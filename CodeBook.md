Getting and Cleaning Data Course Project - CodeBook
========================================================

This codebook will list and briefly describe the variables used for the Getting and Cleaning Data Course Project.  This project is based on acceleration and angular velocity data that was collected by the Samsung Galaxy SII on 30 volunteers ranging in age from 19-48 years.  Each volunteer was measured performing six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  The data was divided into a train/test set but was recombined for purposes of our analysis. Using the embedded accelerometer and gyroscope of the SII, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  Each variable has been normalized to range between -1 and 1.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The full dataset consists of 10,299 unique observations with 561 predictor variables.  The dependant variable is one of the six activities listed above.  One goal in the course project was to reduce the scope of predictor variables to the mean and std of each measurement.  This reduced the number of predictor variables to 66 (33 for the mean, 33 for the stdev).  The Subject (1-30) and Activity (WALKING, etc) and a SubjectActivity combination (1-WALKING,etc) are also included.

The output data frame contains 180 rows (one for each combination of Subject and Activity), and 69 columns (one for each of the 66 mean or standard deviations of a predictor variable and 3 for Subject, Activity and SubjectActivity).  For row i, and column j (j = 1:66), the value at the i,j location of the dataframe represents the mean of of the mean or standard deviations for that particular measurement (for example: tBodyAcc-std()-Y) and that particular SubjectActivity combination (for example: 27 - SITTING).

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- Subject
- Activity
- SubjectActivity
