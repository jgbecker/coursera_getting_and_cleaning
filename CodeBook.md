# Code book

## Source data

The script works on the UCI "Human Activity Recognition Using Smartphones Data Set" available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . It tidies the data set by doing the transformations explained below. The output is a tidied data set containing 180 rows representing the measurements for each of the 6 activities performed for each of the 30 subjects.

## Variables in the tidied data set

For each signal, mean and standard deviation are provided (Mean, Std). X, Y, Z indicate the three directions. FFT means Fast Fourier Transformation applied to the original variable. For each variable, we indicate the name of the corresponding variable in the source data set.

<table border="1px">
<tr><th>Variable</th><th>Description</tr></th>
<tr><td width="30%">Subject</td><td>subject id (1-30)</td></tr>
<tr><td>Activity</td><td>activity performed, one of
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING</td></tr>
<tr><td>BodyAcceleration{Mean|Std}{X|Y|Z}</td><td>body acceleration (tBodyAcc-XYZ)</td></tr>
<tr><td>GravityAcceleration{Mean|Std}{X|Y|Z}</td><td>gravity acceleration (tGravityAcc-XYZ)</td></tr>
<tr><td>BodyAccelerationJerk{Mean|Std}{X|Y|Z}</td><td>body acceleration Jerk signal (tBodyAccJerk-XYZ)</td></tr>
<tr><td>BodyGyroscope{Mean|Std}{X|Y|Z}</td><td>body gyroscope signal (tBodyGyro-XYZ)</td></tr>
<tr><td>BodyGyroscopeJerk{Mean|Std}{X|Y|Z}</td><td>body gyroscope Jerk signal (tBodyGyroJerk-XYZ)</td></tr>
<tr><td>BodyAccelerationMagnitude{Mean|Std}</td><td>magnitude of body acceleration by Euclidian norm (tBodyAccMag)</td></tr>
<tr><td>GravityAccelerationMagnitude{Mean|Std}</td><td>magnitude of gravity acceleration by Euclidian norm (tGravityAccMag)</td></tr>
<tr><td>BodyAccelerationJerkMagnitude{Mean|Std}</td><td>magnitude of body acceleration Jerk signal by Euclidian norm (tBodyAccJerkMag)</td></tr>
<tr><td>BodyGyroscopeMagnitude{Mean|Std}</td><td>magnitude of body signal by Euclidian norm (tBodyGyroMag)</td></tr>
<tr><td>BodyGyroscopeJerkMagnitude{Mean|Std}</td><td>magnitude of body gyroscope Jerk signal by Euclidian norm (tBodyGyroJerkMag)</td></tr>
<tr><td>FFTBodyAcceleration{Mean|Std}{X|Y|Z}</td><td>see above</td></tr>
<tr><td>FFTBodyAccelerationJerk{Mean|Std}{X|Y|Z}</td><td>see above</td></tr>
<tr><td>FFTBodyGyroscope{Mean|Std}{X|Y|Z}</td><td>see above</td></tr>
<tr><td>FFTBodyAccelerationMagnitude{Mean|Std}</td><td>see above</td></tr>
<tr><td>FFTBodyAccelerationJerkMagnitude{Mean|Std}</td><td>see above</td></tr>
<tr><td>FFTBodyGyroscopeMagnitude{Mean|Std}</td><td>see above</td></tr>
<tr><td>FFTBodyGyroscopeJerkMagnitude{Mean|Std}</td><td>see above</td></tr>
</table>

## Transformations performed

The following transformations are being performed by our script:

1.  Subject, activity and measurement data are assembled into a single table.
2.  Test and training tables are concatenated into a single table containing data for all 30 subjects.
3.  Columns apart from means and standard deviations are thrown away.
4.  Activities are indicated by the verbal description rather than the activity id.
5.  Column names are changed as described above, in order to be more descriptive.
6.  Column-wise averaging is done in order to obtain a single record for each (subject,activity)-pair.

