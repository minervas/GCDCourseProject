# GCDCourseProject
This is my Course Project for the Getting and Cleaning Data Coursera Course

# Data
Data for this project was sourced from this dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
See CodeBook.md for more info on the data.

# Directions for this project
Here are the directions for this project
 - You should create one R script called run_analysis.R that does the following. 
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



# Running this project:
In order to successfully reproduce this project, make sure you have the dataset mentioned above downloaded and unzipped (without any modifications to directory names) into the same directory as the run_analysis.R file when you execute run_analysis.R. You must also have the R dplyr library installed. For your convenience, I have included some commented lines near the top of the run_analysis.R that will download and unzip the data as well as install and load the dplyr library.
Execution of run_analysis.R is a bit slow, so be patient. This script should print out some text related to it's progress.

# How the run_analysis.R works
Here are the steps involved in run_analysis.R (See comments in the script itself for more details.)

 - load dplyr

 - read in training data

 - read in testing data

 - stack training and testing data

 - select features with either mean or std in their name (It was unclear from the project directions whether I was supposed to take only features with names ending with std or mean or with std or mean anywhere in the feature name. So I opted for the latter.)

 - tidy activity labels

 - join datatables

 - create final aggregated dataset via group by and summerize

 - write data to file


# Return value
My final tidy dataset (Each variable is in one column, Each different observation of that variable is in a different row) produced with run_analysis.R named tidyData_means should be available as a data.frame upon successful execution. (run_analysis.R also writes tidyData_means.txt to the current working directory.)