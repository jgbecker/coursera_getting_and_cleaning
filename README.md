# run_analysis.R

*Script for tidying the UCI "Human Activity Recognition Using Smartphones Data Set"*

## Description

The script is intended for tidying the UCI "Human Activity Recognition Using Smartphones Data Set", which is
available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The script
creates a single data set with one record for each of the 30 subjects and each of the 6 activities (i.e. a
total of 6*30=180 records), obtained by column-wise averaging over all rows for each particular (subject,activity)
pair in the original data set. All columns apart from those labelled as "mean" or "standard deviation" in the
original data set are removed.

Consequently, for each record, the generated data set contains mean and standard deviation of the 33 different
accelometer and gyroscope measurents.

## Usage

Get the zip file from the above link and unpack it.

Then, in R, do:

    setwd( [path to the UCI HAR Dataset directory obtained after unzipping] )
    source('run_analysis.R')
  
The script will then output a file named "tidy.txt" with the tidied data set to the UCI HAR Dataset directory.

## Details

The script is structured into helper functions, which are explained in the comments in the code.
These helper functions are wired together by the function
uci.har.process (). This function is called at the bottom of the file and thus executed as soon as the script
is `source`d.