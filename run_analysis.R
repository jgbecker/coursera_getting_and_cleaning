# reads numeric data, column names, subjects and activities
# assembles everything into one data frame, which is returned

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

        # return data frame including subjects and activity columns
	cbind(subject, activityId, x)
}

uci.har.readAndAssemble.testDataframe <- function () {
	uci.har.readAndAssemble (
		'test/X_test.txt',
		'features.txt',
		'test/y_test.txt',
		'test/subject_test.txt'
	)
}

uci.har.readAndAssemble.trainDataframe <- function () {
	uci.har.readAndAssemble (
		'train/X_train.txt',
		'features.txt',
		'train/y_train.txt',
		'train/subject_train.txt'
	)
}

uci.har.readAndAssemble.intoSingleDataframe <- function () {
	testDf <- uci.har.readAndAssemble.testDataframe ()
        trainDf <- uci.har.readAndAssemble.trainDataframe ()
	rbind (testDf, trainDf)
}

uci.har.extractMeanAndStdCols <- function (df) {
	meanAndStdColIndices <- grep ('-mean\\(\\)|-std\\(\\)', colnames(df))
	activityIdColIndex <- grep ('^activityId$', colnames(df))
	subjectColIndex <- grep ('^subject$', colnames(df))
	df[ , c(subjectColIndex,activityIdColIndex,meanAndStdColIndices) ]
}

uci.har.readActivityLabels <- function () {
	tbl <- read.table ('activity_labels.txt')
        colnames (tbl) <- c('activityId', 'activity')
        tbl
}
