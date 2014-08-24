# Code book

# Source data

The script works on the UCI "Human Activity Recognition Using Smartphones Data Set" available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . It tidies the data set by doing the transformations explained below. The output is a tidied data set containing 180 rows representing the measurements for each of the 6 activities performed for each of the 30 subjects.

## Variables in the tidied data set

<table border="1px">
<tr><th>Variable</th><th>Description</tr></th>
<tr><td width="30%">Subject</td><td>subject id (1-30)</td></tr>
<tr><td>Activity</td><td>activity performed, one of
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING</td></tr>
<tr><td>BodyAcceleration{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>GravityAcceleration{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>BodyAccelerationJerk{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>BodyGyroscope{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>BodyGyroscopeJerk{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>BodyAccelerationMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>GravityAccelerationMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>BodyAccelerationJerkMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>BodyGyroscopeMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>BodyGyroscopeJerkMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>FFTBodyAcceleration{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>FFTBodyAccelerationJerk{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>FFTBodyGyroscope{Mean|Std}{X|Y|Z}</td><td></td></tr>
<tr><td>FFTBodyAccelerationMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>FFTBodyAccelerationJerkMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>FFTBodyGyroscopeMagnitude{Mean|Std}</td><td></td></tr>
<tr><td>FFTBodyGyroscopeJerkMagnitude{Mean|Std}</td><td></td></tr>
</table>


      
               
            
         
[43] "FFTBodyAccelerationMeanX"                 "FFTBodyAccelerationMeanY"                
[45] "FFTBodyAccelerationMeanZ"                 "FFTBodyAccelerationStdX"                 
[47] "FFTBodyAccelerationStdY"                  "FFTBodyAccelerationStdZ"                 
[49] "FFTBodyAccelerationJerkMeanX"             "FFTBodyAccelerationJerkMeanY"            
[51] "FFTBodyAccelerationJerkMeanZ"             "FFTBodyAccelerationJerkStdX"             
[53] "FFTBodyAccelerationJerkStdY"              "FFTBodyAccelerationJerkStdZ"             
[55] "FFTBodyGyroscopeMeanX"                    "FFTBodyGyroscopeMeanY"                   
[57] "FFTBodyGyroscopeMeanZ"                    "FFTBodyGyroscopeStdX"                    
[59] "FFTBodyGyroscopeStdY"                     "FFTBodyGyroscopeStdZ"                    
[61] "FFTBodyAccelerationMagnitudeMean"         "FFTBodyAccelerationMagnitudeStd"         
[63] "FFTBodyBodyAccelerationJerkMagnitudeMean" "FFTBodyBodyAccelerationJerkMagnitudeStd" 
[65] "FFTBodyBodyGyroscopeMagnitudeMean"        "FFTBodyBodyGyroscopeMagnitudeStd"        
[67] "FFTBodyBodyGyroscopeJerkMagnitudeMean"    "FFTBodyBodyGyroscopeJerkMagnitudeStd"