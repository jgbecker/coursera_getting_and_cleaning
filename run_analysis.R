# run_analysis.R
# script for tidying the UCI "Human Activity Recognition Using Smartphones Data Set"

# Usage:
# setwd( [path to the UCI HAR Dataset directory obtained after unzipping] )
# source('run_analysis.R')

# Output:
# writes a file named tidy.txt the UCI HAR Dataset directory containing the tidied data

# this script contains several helper functions
# those are wired together in the uci.har.process function below
# uci.har.process is called at the bottom of this file

# requires plyr library
library(plyr)

# reads numeric data, column names, subjects and activities
# assembles everything into one data frame, which is returned
# parameters:
#    numericDataFileName : path to the file containing the numeric data values
#    columnNamesFileName : path to the file containing the column names
#    activitiesColumnFileName : path to the file containing the column indicating the activities
#    subjectColumnFileName : path to the file containing the column indicating the subjects
uci.har.readAndAssemble <- function (
  numericDataFileName,
  columnNamesFileName,
  activitiesColumnFileName,
  subjectColumnFileName
) {
  # read numeric data values
  x <- read.table (numericDataFileName)
  
  # read column names for numeric data
  featuresTbl <- read.table (columnNamesFileName)
  features <- featuresTbl[,2]
  
  # set column names
  colnames(x) <- features
  
  # read column indicating activities
  y <- read.table (activitiesColumnFileName)
  activityId <- y[,1]
  
  # read column indicating subjects
  s <- read.table (subjectColumnFileName)
  subject <- s[,1]
  
  # return data frame including Subject and ActivityId columns
  cbind(Subject = subject, ActivityId = activityId, x)
}

# calls uci.har.readAndAssemble for the test data
# returns a data frame containing the data
uci.har.readAndAssemble.testDataframe <- function () {
  uci.har.readAndAssemble (
    'test/X_test.txt',
    'features.txt',
    'test/y_test.txt',
    'test/subject_test.txt'
  )
}

# calls uci.har.readAndAssemble for the training data
# returns a data frame containing the data
uci.har.readAndAssemble.trainDataframe <- function () {
  uci.har.readAndAssemble (
    'train/X_train.txt',
    'features.txt',
    'train/y_train.txt',
    'train/subject_train.txt'
  )
}

# reads both the test and the training data
# concatenates the two data frames into a single data frame,
# which is returned
uci.har.readAndAssemble.intoSingleDataframe <- function () {
  testDf <- uci.har.readAndAssemble.testDataframe ()
  trainDf <- uci.har.readAndAssemble.trainDataframe ()
  rbind (testDf, trainDf)
}

# takes raw data frame as a parameter and returns a new data frame
# containing only the Subject, ActivityId as well as all mean and std deviation columns
uci.har.extractMeanAndStdCols <- function (df) {
  meanAndStdColIndices <- grep ('-mean\\(\\)|-std\\(\\)', colnames(df))
  activityIdColIndex <- grep ('^ActivityId$', colnames(df))
  subjectColIndex <- grep ('^Subject$', colnames(df))
  df[ , c(subjectColIndex,activityIdColIndex,meanAndStdColIndices) ]
}

# reads table containing the translation activity id to activity (verbal)
# returns data frame containing this table with columns named "ActivityId" and "Activity"
uci.har.readActivityLabels <- function () {
  tbl <- read.table ('activity_labels.txt')
  colnames (tbl) <- c('ActivityId', 'Activity')
  tbl
}

# performs merge (join) of the two data framees passed
# intended to be used for generating a column containing the verbal description
# of the activity indicated in the df$ActivityId column
# returns copy of df with additional column describing the activity in words
uci.har.addActivityLabels <- function (df, activityLabels) {
  merge (df, activityLabels)
}

# aggregate df by column-wise averaging with grouping being done by the values
# in the Subject and Activity columns
# returns aggregated data frame
uci.har.aggregateBySubjectAndActivity <- function (df) {
  ddply(df, .(Subject,Activity), numcolwise(mean))
}

# generate a cleaned variable name from the variable name passed
# substitutions done:
#   t at the beginning is removed
#   f at the beginning is replaced by FFT
#   Acc is replaced by Acceleration
#   Gyro is replaced by Gyroscope
#   Mag is replaced by Magnitude
#   -mean() is replaced by Mean
#   -std() is replaced by Std
#   afterwards, hyphens are removed
uci.har.generateCleanVariableName <- function (originalName) {
  s <- originalName
  s <- sub ('^t', '', s)
  s <- sub ('^f', 'FFT', s)
  s <- sub ('Acc', 'Acceleration', s)
  s <- sub ('Gyro', 'Gyroscope', s)
  s <- sub ('Mag', 'Magnitude', s)
  s <- sub ('\\-mean\\(\\)', 'Mean', s)
  s <- sub ('\\-std\\(\\)', 'Std', s)
  s <- gsub ('\\-', '', s)
  s  
}

# main function:
#   reads both test and training data, builds data frames, concatenates them,
#   removes all columns apart from subject, activity, as well as means and std deviations
#   verbalizes activities
#   tidies column names
#   aggregates by averaging in order to obtain one record for each (subject, activity) pair
#   writes the result to file "tidy.txt" in the current working directory
uci.har.process <- function () {
  df <- uci.har.extractMeanAndStdCols ( uci.har.readAndAssemble.intoSingleDataframe () )
  activityLabels <- uci.har.readActivityLabels ()
  df <- uci.har.addActivityLabels (df, activityLabels)
  df$ActivityId <- NULL
  colnames (df) <- lapply (colnames(df), uci.har.generateCleanVariableName)
  df <- uci.har.aggregateBySubjectAndActivity (df)
  write.table(df, 'tidy.txt', row.names=FALSE)
}

### call main function
uci.har.process ()