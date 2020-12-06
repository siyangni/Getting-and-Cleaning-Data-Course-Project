# Code Book

The clean_script.R script document lownload the data fron the file server, 
and then perforeme data cleaning work as requested 
by the assignment instruction:

### 1. Loading the dataset
Dataset downloaded from the original server link and extracted to the folder 
"UCI HAR Dataset."

### 2. Assign each data to variables

- `features <- features.txt` : 561 rows, 2 columns

- `activities <- activity_labels.txt` : 6 rows, 2 columns

- `subject_test <- test/subject_test.txt` : 2947 rows, 1 column

- `x_test <- test/X_test.txt` : 2947 rows, 561 columns

- `y_test <- test/y_test.txt` : 2947 rows, 1 columns

- `subject_train <- test/subject_train.txt` : 7352 rows, 1 column

- `x_train <- test/X_train.txt` : 7352 rows, 561 columns

- `y_train <- test/y_train.txt` : 7352 rows, 1 columns


### 3. Merges the training and the test data

1. Dataframe `X` (10299 rows, 561 columns) is created via merging
`x_train` and `x_test` by row (`rbind()`)

2. Dataframe `Y` (10299 rows, 1 column) is created via merging 
`y_train` and `y_test` by row (`rbind()`)

3. Dataframe `Subject` (10299 rows, 1 column) is created via merging 
`subject_train` and `subject_test` by row (`rbind()`) 

4. Dataframe `merged` (10299 rows, 563 column) is created via merging 
`Subject`, `Y` and `X` by column (`cbind()`)


### 4. Extracts only the measurements on the mean and standard deviation for each measurement

Dataframe `df` (10299 rows, 88 columns) is created by 
subsetting the dataframe `merge` (created in step 3), 
selecting the following columns: `subject`, `code` and the measurements on the 
`mean` and standard deviation (`std`) for each measurement

### 5. Uses descriptive activity names to name the activities in the data set

Replace numbers in `code` column of the dataframe `df` with
corresponding activity as it is recoded 
in the second column of the `activities` variable

### 6. Appropriately labels the data set with descriptive variable names
- Rename `code` column in dataframe `df` `activities`
- Replace all `Acc` in column’s name with `Accelerometer`
- Replace all `Gyro` in column’s name with `Gyroscope`
- Replace all `BodyBody` in column’s name with `Body`
- Replace all `Mag` in column’s name with `Magnitude`
- Replace all column's names starting with the character `f` with `Frequency`
- Replace all column's names starting with the character `t` with `Time`

### 7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

`tidy_dataset.txt` (180 rows, 88 columns) is created by summarizing 
dataframe `df` (taking the means of each variable for each activity 
and each subject), grouped by subject and activity.