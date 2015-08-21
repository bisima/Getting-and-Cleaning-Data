# Getting-and-Cleaning-Data
###Course Project: README
###File Name: README.md
-----				

**Author:** H. Atib  
**Date:** 19th August 2015

## Introduction:

In this README file you will find all the necesary information required to perform analysis on the provided data set.

The purpose of this project is to collect, process and clean the provided data set. The goal is to prepare tidy data that can be used for later analysis.

### The files need for analysis 
The following files below are available for performing analysis on the dataset and description on how they are connected. 

- README.md
- run_analysis.R
- getdata-projectfiles-UCI HAR Dataset.zip
- CodeBook.md
- tidyDataset.txt

- **README.md:** Explains how the files are connected and instructions on how to run the R code for performing analysis
- **run_analysis.R:** It's R code for performing analysis on dataset to generate tidy dataset **tidyDataset.txt**.
- **CodeBook.md:** describes the variables, the data, and transformations performed to clean up the data set in order to make it ready for further analysis.
- **tidyDataset.txt:** This text file is output of running R code: **"run_analysis.R".** 
- **getdata-projectfiles-UCI HAR Dataset.zip:** Which contains the following data set files to be used for this analysis.
	+ **'features_info.txt':** Shows information about the variables used on the feature vector.

	+ **'features.txt':** List of all features.

	+ **'activity_labels.txt':** Links the class labels with their activity name.

	+ **'train/X_train.txt':** Training set.

	+ **'train/y_train.txt':** Training labels.

	+ **'test/X_test.txt':** Test set.

	+ **'test/y_test.txt':** Test labels.

###Instruction to perform analysis
---

1. Install these two packages **'data.table'**
and **'reshape2'** required for this analysis.
2. Create directory **project_getdata** in your home directory. 
3. Download **getdata-projectfiles-UCI HAR Dataset.zip** from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "from this site").
4. Extract or unzip the zip file downloaded in step 3, above into directory **project_getdata** created in step 1, above. After unzip the zip file you should see directory **'UCI HAR Dataset'** within directory **project_getdata**  
5. Download **run_analysis.R** from [Getting-and-Cleaning-Data](https://github.com/bisima/Getting-and-Cleaning-Data "this github site") and save the file into the directory **project_getdata** created in step 1, above.
6. Set your working directory as **~/project_getdata**
7. Perform the analysis by typing **source('~/project_getdata/run_analysis.R')** at the R prompt.
8. If you type dir() you should be able to see the generated tidy data set as a text file: **'tidyDataset.txt'.**

For more information read **CodeBook.md**

 

