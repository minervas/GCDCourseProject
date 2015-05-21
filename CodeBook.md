# Data
Data for this project was sourced from this dataset: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

See the following URL for an explanation of how the data was collected.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The README.txt and features_info.txt of the downloaded, unzipped data go into detail about the naming conventions for each feature measured in this experiment.

Directions for this project are the following:

1. Merges the training and the test sets to create one data set.

- To accomplish my first task I merged the training and test sets by stacking them on top of one another.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

- In satisfying the second direction of this project I kept all features that included std or mean in their labels (as the directions weren't clear if I needed only the features with labels ending in std or mean.)

3. Uses descriptive activity names to name the activities in the data set

- For the third direction I relabeled each subject's activity data with the activity labels in the activity_labels.txt file included with the data.

4. Appropriately labels the data set with descriptive variable names. 

- To accomplish the fourth direction I replaced the feature column names with their associated variable names listed in the features.txt file in the data.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- In satisfying the final direction of this project I used the dplyr package to first group by the subject and activity columns and then used summarize to calculate the average of each feature. In order to indicate that each feature has been averaged, I renamed each feature column in the follow fashion: mean_of_<feature name from features.txt>


