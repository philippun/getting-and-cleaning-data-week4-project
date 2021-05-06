## Code book to the file run_analysis.R

Before running the script the data needs to be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After that the data needs to be unzipped in the working directory and the outermost directory needs to be renamed to 'data'

The run_analysis.R can then be run

The script itself follows the steps from the assignment:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output is data from step 5 and saved into the file final_data.txt