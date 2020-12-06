library(dplyr)

# Loading the dataset
filename <- "Coursera_DS3_Final.zip"

## Checking if file exists.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/
        getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename)
}  

## Checking if folder exists and unzip if yes
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Load each one of the datasets
features <- read.table("UCI HAR Dataset/features.txt", 
                       col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                     col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                     col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                      col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      col.names = "code")

# 1. Merges the training and the test sets to create one data set

X <- rbind(x_train, x_test)# nrow(X) = nrow(x_train) + nrow(x_test)
Y <- rbind(y_train, y_test)# nrow(Y) = nrow(y_train) + nrow(y_test)
Subject <- rbind(subject_train, subject_test)
merged <- cbind(Subject, Y, X) # nrow(merged) = nrow(Subject)

# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement

df <- merged %>% select(subject, code, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

df$code <- activities[df$code, 2]

# 4. Appropriately labels the data set with descriptive variable names

names(df)[2] = "activity"
names(df) <- gsub("Acc", "Accelerometer", names(df))
names(df)<-gsub("Gyro", "Gyroscope", names(df))
names(df)<-gsub("BodyBody", "Body", names(df))
names(df)<-gsub("Mag", "Magnitude", names(df))
names(df)<-gsub("^t", "Time", names(df))
names(df)<-gsub("^f", "Frequency", names(df))
names(df)<-gsub("tBody", "TimeBody", names(df))
names(df)<-gsub("-mean()", "Mean", names(df), ignore.case = TRUE)
names(df)<-gsub("-std()", "STD", names(df), ignore.case = TRUE)
names(df)<-gsub("-freq()", "Frequency", names(df), ignore.case = TRUE)
names(df)<-gsub("angle", "Angle", names(df))
names(df)<-gsub("gravity", "Gravity", names(df))

# 5. creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject

tidy <- df %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))


write.table(tidy, "tidy_dataset.txt", row.name=FALSE)














