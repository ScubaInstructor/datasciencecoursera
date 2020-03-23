# This repo explains how all of the scripts work and how they are connected.

## Prerequisites 
Download data set into RStudio working directory:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Extract data set inside working directory so that this folder is present:  
*UCI HAR Dataset*   

## Part 1 - Merge the training and the test sets to create one data set.

Load following files into one data set.  
*UCI HAR Dataset/features.txt*

*UCI HAR Dataset/test/subject_test.txt*  
*UCI HAR Dataset/test/X_test.txt*  
*UCI HAR Dataset/test/y_test.txt*  

*UCI HAR Dataset/train/subject_train.txt*  
*UCI HAR Dataset/train/X_train.txt*  
*UCI HAR Dataset/train/y_train.txt*  

Load **x|y test** data set and combine it with **features** and **subject_test**.
Load **x|y train** data set and combine it with **features** and **subject_train**.
Merge **testData** and **trainData** into data set **alldata**.

## Part 2 - Extract only the measurements on the mean and standard deviation for each measurement.

Create data set **meanStdData** as subset from **alldata** containing columns *identityId, all columns containing "mean..." and "std..", activityId*

## Part 3 - Use descriptive activity names to name the activities in the data set

Merge **meanStdData** with file *UCI HAR Dataset/activity_labels.txt* to add activity names into data set **activityMeanStdData**

## Part 4 - Appropriately label the data set with descriptive variable names.

*UCI HAR Dataset/features.txt* contains the lables for the dataset and is loaded in **Part 1** and is applied to the data set.

## Part 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Aggregate **activityMeanStdData** mean on *activity* and *subjectId* into **tidyDataSet**.  
Write **tidyData** to file. 
