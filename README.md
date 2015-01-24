# CourseProj_GetCleanData
CourseProject Coursera Getting_Cleaning Data

This script is very simple. Simply locate the script "run_analysis.R" in the folder "UCI HAR Dataset" (that shlud contains folders "test" and "train" and other files.
Open R. In the prompt type "dataset<-run_analysis() and after few time dataset contains a tidy dataset corresponding to point 5 in Course Project. In a nutshell. it contains the mean values for each column for each combination (subset) of subject and activity.

The dataset variable is a dataframe containing columns:
Col 1: Subjects
Col 2: Activity
Col 3 till 81: variables

In the code, 

-Data1 (line 10) contains the dataset as required in point 1 of Course Project (#1.Merges the training and the test sets to create one data set.
-Dataset_only_mean_std (Point #2.Extracts only the measurements on the mean and standard deviation for each measurement.)
-DataWithActNames(Point#3.Uses descriptive activity names to name the activities in the data set)
-DataSet_Correct_Names( Point #4.Appropriately labels the data set with descriptive variable names. )
-BigDataSet(#5.From the data set in step 4, creates a second,independent tidy data set with the average of each variable for each activity and each subject)
