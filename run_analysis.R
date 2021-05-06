
## Merges the training and the test sets to create one data set.

# Read datasets
subject_test <- read.table("./data/test/subject_test.txt")
X_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")

subject_train <- read.table("./data/train/subject_train.txt")
X_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")

activity_labels <- read.table("./data/activity_labels.txt")
features <- read.table("./data/features.txt")

# Assign column names
colnames(subject_test) <- "subject_id"
colnames(X_test) <- features[,2]
colnames(y_test) <- "activity_id"

colnames(subject_train) <- "subject_id"
colnames(X_train) <- features[,2]
colnames(y_train) <- "activity_id"

colnames(activity_labels) <- c("activity_id", "activity_type")

# Merge datasets
test <- cbind(y_test, subject_test, X_test)
train <- cbind(y_train, subject_train, X_train)
merged <- rbind(test, train)


## Extracts only the measurements on the mean and standard deviation for each measurement. 
columnnames <- colnames(merged)
relevant_columns <- (grepl("activity_id", columnnames) | grepl("subject_id", columnnames) | grepl("mean", columnnames) | grepl("std", columnnames))
measurements_mean_std <- merged[, relevant_columns == TRUE]


## Uses descriptive activity names to name the activities in the data set
measurements_mean_std_named <- merge(measurements_mean_std, activity_labels, by="activity_id", all.x=TRUE)


## Appropriately labels the data set with descriptive variable names. 
 
# Already happened


## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(. ~subject_id + activity_type, measurements_mean_std_named, mean)
tidy_data <- tidy_data[order(tidy_data$subject_id, tidy_data$activity_id), ]

write.table(tidy_data, "final_data.txt", row.names = FALSE)







