## Project Name: run_analysis.R
## Author: H Atib
## Title: Getting and Cleaning Data

## The R scripts analyses the provided dataset and transform it into tidy dataset.
###################################################################################################
## Load libraries needed by this program 
library(data.table)
library(reshape2)

## DF means dataframe is been used throughtout the code.

## Read all the input data before starting analysis.
featureDF <- read.table("~/project_getdata/UCI HAR Dataset/features.txt", header = FALSE)
activityLabelsDF <- read.table("~/project_getdata/UCI HAR Dataset/activity_labels.txt", header = FALSE)
featureNames <- as.character(featureDF[,2])

trainDatasetDF <- read.table("~/project_getdata/UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainActivityDF <- read.table("~/project_getdata/UCI HAR Dataset/train/y_train.txt", header = FALSE) 
trainSubjectDF <- read.table("~/project_getdata/UCI HAR Dataset/train/subject_train.txt", header = FALSE) 

testDatasetDF <- read.table("~/project_getdata/UCI HAR Dataset/test/X_test.txt", header = FALSE)
testActivityDF <- read.table("~/project_getdata/UCI HAR Dataset/test/y_test.txt", header = FALSE) 
testSubjectDF <- read.table("~/project_getdata/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

## 1) Merge the training and the test datasets to create original dataset

## Merge train and test dataset using rbind ############
originalDatasetDF <- rbind(trainDatasetDF,testDatasetDF)
originalActivityDF <- rbind(trainActivityDF,testActivityDF)
originalSubjectDF <- rbind(trainSubjectDF,testSubjectDF)

## Label the original dataset
names(originalDatasetDF) <- featureNames
names(originalActivityDF) <- "Activity"
names(originalSubjectDF) <- "Subject"

## 2) Extracts the mean and standard deviation for each measurements

## Extract only the mean and std function measurements as my choice
meanStdVar <- grepl("mean|std", names(originalDatasetDF))
extractedDatasetTempDF <- originalDatasetDF[meanStdVar]

## Eliminate meanFreq() since it's weighted average of the frequency components to obtain mean
meanFreqVar <- grepl("meanFreq",names(extractedDatasetTempDF))
extractedDatasetTempDF <- extractedDatasetTempDF[!meanFreqVar]

## Add the Subject, Activity and Extracted dataframes together
extractedDatasetDF <- cbind(originalSubjectDF,originalActivityDF,extractedDatasetTempDF)

## 3) Uses descriptive activity names to name the activities in the dataset
extractedDatasetDF$Activity <- factor(extractedDatasetDF$Activity, 
                                     levels = c(1,2,3,4,5,6),labels = activityLabelsDF[,2])

## 4) Appropriately labels the dataset with descriptive variable names

nameVar <- names(extractedDatasetDF)
nameVar <- gsub("Acc","Accelerometer",nameVar)  ## Replace Acc with Accelerometer
nameVar <- gsub("Gyro","Gyroscope",nameVar)     ## Replace Gyro with Gyroscope
nameVar <- gsub("Mag","Magnitude",nameVar)      ## Replace Mag with Magnitude
nameVar <- gsub("BodyBody","Body",nameVar)      ## Replace BodyBody with Body
nameVar <- gsub("-","_",nameVar)                ## Replace - with _
nameVar <- gsub("^t","Time",nameVar) 
nameVar <- gsub("^f","Frequency",nameVar)
names(extractedDatasetDF) <- nameVar

## 5) From the dataset in step 4, creates a second, independentent tidy dataset 
##    with the average of each variable for each activity and each subject.

averageDatabsetDF <- melt(extractedDatasetDF,id=1:2,measure.vars= 3:68)
averageDatabsetDF <- dcast(averageDatabsetDF, ... ~ variable,mean)
## Same like the statement above.
## averageDatabsetDF <- dcast(averageDatabsetDF,Subject + Activity ~ variable,mean)

## Write the Average Databaset as a txt file
write.table(averageDatabsetDF,file ="tidy.txt",row.names = FALSE)
