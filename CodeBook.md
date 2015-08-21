# Getting-and-Cleaning-Data
### Course Project: CodeBook
### File Name: CodeBook.md
---
**Author:** H. Atib  
**Date:** 19th August 2015

### Introduction:
---
The purpose of this project is to collect, process and clean the provided data set. The goal is to prepare tidy data that can be used for later analysis.

In this CodeBook file you will find all the necesary information on this project.  
It provides decription of the following:  

- variables selected for this project.
- original data set used for this project.
- transformation/work performed to clean data to get tidy data set.  

### Files used in this project:
---
- README.md: Provides instructions on how to perform analysis of this project.
- CodeBook.md: Provide overview of the project including information on data, variables and transformation.
- run_analysis.R: R code for computerisation of analysis to performed on data
- tidyDataset.txt: tidy data set produced by running R code on original dataset. 

### Background to the study
---
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The original data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  
[data set information](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data for the project can be obtained from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

#### Overview of the Data set used in this Project
---
Human Activity Recognition Using Smartphones Dataset.  
Version 1.0.  
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
###Data captured
---
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Data files and Description
--- 
- **getdata-projectfiles-UCI HAR Dataset.zip:** Zip file contains the original data set to be analysed.
	+ **'activity_label.txt':** Provides activity names.
	+ **'features_info.txt':** Shows information about the variables used on the feature vector.

	+ **'features.txt':** List of all features.

	+ **'activity_labels.txt':** the activity names.

	+ **'train/X_train.txt':** Training set.

	+ **'train/y_train.txt':** Training labels.

	+ **'test/X_test.txt':** Test set.

	+ **'test/y_test.txt':** Test labels.

### Analysis Pseudocode Algorithm
--- 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Write the data set generated in step 5, as a txt file using **write.table** with option **row.names = 'FALSE'.** 

### Data Transformation:
---
1. Read test and train data file into R using read.table function with default options unchanged.
2. Using row bind function to:
	-	1 row bind test and train subject data into originalSubject
	- 	2 row bind test and train activity data into originalActivity 
	-  	3 row bind test and train features data into originalFeatures
3. read features using read.table into feature table and extract from features names from column 2 of feature table and store into character vector features.
4. Name columns of originalFeatures by assigning features to it.
5. OriginalFeatures data had 561 features. But we are only interested in mean and standard deviation measurements. Selecting mean and standard deviation measurements on reduced the features to 79 features. Furthermore we eliminated meanFreq measurements since it's weighted average of the frequency components to obtain mean. This reduced the features to 66 features. Then named data set extractedDataTemp

	- 1 tBodyAcc-mean()-X
	- 2 tBodyAcc-mean()-Y
	- 3 tBodyAcc-mean()-Z
	- 4 tBodyAcc-std()-X
	- 5 tBodyAcc-std()-Y
	- 6 tBodyAcc-std()-Z
	- 7 tGravityAcc-mean()-X
	- 8 tGravityAcc-mean()-Y
	- 9 tGravityAcc-mean()-Z
	- 10 tGravityAcc-std()-X
	- 11 tGravityAcc-std()-Y
	- 12 tGravityAcc-std()-Z
	- 13 tBodyAccJerk-mean()-X
	- 14 tBodyAccJerk-mean()-Y
	- 15 tBodyAccJerk-mean()-Z
	- 16 tBodyAccJerk-std()-X
	- 17 tBodyAccJerk-std()-Y
	- 18 tBodyAccJerk-std()-Z
	- 19 tBodyGyro-mean()-X
	- 20 tBodyGyro-mean()-Y
	- 21 tBodyGyro-mean()-Z
	- 22 tBodyGyro-std()-X
	- 23 tBodyGyro-std()-Y
	- 24 tBodyGyro-std()-Z
	- 25 tBodyGyroJerk-mean()-X
	- 26 tBodyGyroJerk-mean()-Y
	- 27 tBodyGyroJerk-mean()-Z
	- 28 tBodyGyroJerk-std()-X
	- 29 tBodyGyroJerk-std()-Y
	- 30 tBodyGyroJerk-std()-Z
	- 31 tBodyAccMag-mean()
	- 32 tBodyAccMag-std()
	- 33 tGravityAccMag-mean()
	- 34 tGravityAccMag-std()
	- 35 tBodyAccJerkMag-mean()
	- 36 tBodyAccJerkMag-std()
	- 37 tBodyGyroMag-mean()
	- 38 tBodyGyroMag-std()
	- 39 tBodyGyroJerkMag-mean()
	- 40 tBodyGyroJerkMag-std()
	- 41 fBodyAcc-mean()-X
	- 42 fBodyAcc-mean()-Y
	- 43 fBodyAcc-mean()-Z
	- 44 fBodyAcc-std()-X
	- 45 fBodyAcc-std()-Y
	- 46 fBodyAcc-std()-Z
	- 47 fBodyAccJerk-mean()-X
	- 48 fBodyAccJerk-mean()-Y
	- 49 fBodyAccJerk-mean()-Z
	- 50 fBodyAccJerk-std()-X
	- 51 fBodyAccJerk-std()-Y
	- 52 fBodyAccJerk-std()-Z
	- 53 fBodyGyro-mean()-X
	- 54 fBodyGyro-mean()-Y
	- 55 fBodyGyro-mean()-Z
	- 56 fBodyGyro-std()-X
	- 57 fBodyGyro-std()-Y
	- 58 fBodyGyro-std()-Z
	- 59 fBodyAccMag-mean()
	- 60 fBodyAccMag-std()
	- 61 fBodyBodyAccJerkMag-mean()
	- 62 fBodyBodyAccJerkMag-std()
	- 63 fBodyBodyGyroMag-mean()
	- 64 fBodyBodyGyroMag-std()
	- 65 fBodyBodyGyroJerkMag-mean()
	- 66 fBodyBodyGyroJerkMag-std() 

6. Now column bind the originalSubject, originalActivity and extractedDataTemp then named it extractedData.
7. Then labelled extractedData in step 6 above using descriptive names obtained from activity_labels.txt.
	- 1- WALKING
	- 2- WALKING_UPSTAIRS
	- 3- WALKING_DOWNSTAIRS
	- 4- SITTING
	- 5- STANDING
	- 6- LAYING 
8. Replace abreviations from features names using gsub.
	-  Replace **Acc** with **Accelerometer**     
	-  Replace **Gyro** with **Gyroscope**      
	-  Replace **Mag** with **Magnitude**      
	-  Replace **BodyBody** with **Body**                
	-  Replace **-** with **_**
	-  Replace **t** with **Time**
	-  Replace **f** with **Frequency**
9. The transformed features from step 8:
	- 1 TimeBodyAccelerometer-mean()-X
	- 2 TimeBodyAccelerometer-mean()-Y
	- 3 TimeBodyAccelerometer-mean()-Z
	- 4 TimeBodyAccelerometer-std()-X
	- 5 TimeBodyAccelerometer-std()-Y
	- 6 TimeBodyAccelerometer-std()-Z
	- 7 TimeGravityAccelerometer-mean()-X
	- 8 TimeGravityAccelerometer-mean()-Y
	- 9 TimeGravityAccelerometer-mean()-Z
	- 10 TimeGravityAccelerometer-std()-X
	- 11 TimeGravityAccelerometer-std()-Y
	- 12 TimeGravityAccelerometer-std()-Z
	- 13 TimeBodyAccelerometerJerk-mean()-X
	- 14 TimeBodyAccelerometerJerk-mean()-Y
	- 15 TimeBodyAccelerometerJerk-mean()-Z
	- 16 TimeBodyAccelerometerJerk-std()-X
	- 17 TimeBodyAccelerometerJerk-std()-Y
	- 18 TimeBodyAccelerometerJerk-std()-Z
	- 19 TimeBodyGyroscope-mean()-X
	- 20 TimeBodyGyroscope-mean()-Y
	- 21 TimeBodyGyroscope-mean()-Z
	- 22 TimeBodyGyroscope-std()-X
	- 23 TimeBodyGyroscope-std()-Y
	- 24 TimeBodyGyroscope-std()-Z
	- 25 TimeBodyGyroscopeJerk-mean()-X
	- 26 TimeBodyGyroscopeJerk-mean()-Y
	- 27 TimeBodyGyroscopeJerk-mean()-Z
	- 28 TimeBodyGyroscopeJerk-std()-X
	- 29 TimeBodyGyroscopeJerk-std()-Y
	- 30 TimeBodyGyroscopeJerk-std()-Z
	- 31 TimeBodyAccelerometerMagnitude-mean()
	- 32 TimeBodyAccelerometerMagnitude-std()
	- 33 TimeGravityAccelerometerMagnitude-mean()
	- 34 TimeGravityAccelerometerMagnitude-std()
	- 35 TimeBodyAccelerometerJerkMagnitude-mean()
	- 36 TimeBodyAccelerometerJerkMagnitude-std()
	- 37 TimeBodyGyroscopeMagnitude-mean()
	- 38 TimeBodyGyroscopeMagnitude-std()
	- 39 TimeBodyGyroscopeJerkMagnitude-mean()
	- 40 TimeBodyGyroscopeJerkMagnitude-std()
	- 41 FrequencyBodyAccelerometer-mean()-X
	- 42 FrequencyBodyAccelerometer-mean()-Y
	- 43 FrequencyBodyAccelerometer-mean()-Z
	- 44 FrequencyBodyAccelerometer-std()-X
	- 45 FrequencyBodyAccelerometer-std()-Y
	- 46 FrequencyBodyAccelerometer-std()-Z
	- 47 FrequencyBodyAccelerometerJerk-mean()-X
	- 48 FrequencyBodyAccelerometerJerk-mean()-Y
	- 49 FrequencyBodyAccelerometerJerk-mean()-Z
	- 50 FrequencyBodyAccelerometerJerk-std()-X
	- 51 FrequencyBodyAccelerometerJerk-std()-Y
	- 52 FrequencyBodyAccelerometerJerk-std()-Z
	- 53 FrequencyBodyGyroscope-mean()-X
	- 54 FrequencyBodyGyroscope-mean()-Y
	- 55 FrequencyBodyGyroscope-mean()-Z
	- 56 FrequencyBodyGyroscope-std()-X
	- 57 FrequencyBodyGyroscope-std()-Y
	- 58 FrequencyBodyGyroscope-std()-Z
	- 59 FrequencyBodyAccelerometerMagnitude-mean()
	- 60 FrequencyBodyAccelerometerMagnitude-std()
	- 61 FrequencyBodyAccelerometerJerkMagnitude-mean()
	- 62 FrequencyBodyAccelerometerJerkMagnitude-std()
	- 63 FrequencyBodyGyroscopeMagnitude-mean()
	- 64 FrequencyBodyGyroscopeMagnitude-std()
	- 65 FrequencyBodyGyroscopeJerkMagnitude-mean()
	- 66 FrequencyBodyGyroscopeJerkMagnitude-std() 
10. Use the melt function from reshape2 to melt the extractedData with subject and activity as **id**
11. Then apply dcast function and compute the average of the grouped data set (extractedData)
12. Then wrote the tidy data obtained in step 10 using write.table with option row.name = FALSE into a text file tidyDataset.txt