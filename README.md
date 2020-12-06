# Getting-and-Cleaning-Data-Course-Project

This repository is for JHU's Getting and Cleaning Data course project. 
This document explains the content of this repo.

### Dataset
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original dataset is not included in this repo, it can be retrieved through the above link. 

### Files

`codebook.md`
The code book that describes information related to the variables, dataset, and 
data transformation procedures.

`clean_script.R`
R-script file that record the procedures of transforming the raw data
to the exported `tidy_dataset.txt`. The procedures are:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`tidy_dataset.txt`
The exported data after going through all transformation prescribed
by the assignment instruction