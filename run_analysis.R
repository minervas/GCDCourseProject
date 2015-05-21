#uncomment next line to install dplyr library
#install.packages("dplyr")
print("loading dplyr")
library(dplyr)
#uncomment the next line to download the data
#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='dataSet.zip', method='curl')
#uncomment the next line to unzip the data
#unzip('dataSet.zip')

# read in training data
print("reading in training data")
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

#read in testing data
print("reading in testing data")
testingData <- read.table("UCI HAR Dataset/test/X_test.txt")
testingLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testingSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

#stack training and testing data
print("stacking training and testing data")
stackedData = rbind(trainingData, testingData)
stackedLabels = rbind(trainingLabels, testingLabels)
stackedSubjects = rbind(trainingSubjects, testingSubjects)

#read in feature var names
print("selecting features")
featureVars <- read.table("UCI HAR Dataset/features.txt")
#find index of vars with mean or std in their name
selectedVarsIndex <- grep("mean|std", featureVars[, 2])
#use the selected vars index to remove irrelevant feature vars in the data
stackedData <- stackedData[, selectedVarsIndex]
#attach feature var names to data
names(stackedData) <- featureVars[selectedVarsIndex, 2]

#read in activity labels
print("tidying labels")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
#rename stackedLabels data
stackedLabels[,1] <- activityLabels[stackedLabels[, 1], 2]


#rename stackedLabels column name
print("renaming stacked column names")
names(stackedLabels) <- "activity"
#rename stackedSubjects column name
names(stackedSubjects) <- "subject"


#join datatables
print("joining datatables")
tidyData <- cbind(stackedSubjects, stackedLabels, stackedData)

#group by subject and activity columns
print("creating final aggregated dataset")
grpd_tidyData <- group_by(tidyData, subject, activity)
#get means of all variables (except the group by variables)
tidyData_means <- summarise_each(grpd_tidyData, funs(mean))
#rename columns to indicated they have been aggregated
colnames(tidyData_means)[3:length(colnames(tidyData_means))] <- paste0("mean_of_",colnames(tidyData_means)[3:length(colnames(tidyData_means))])

print("writing table to tidyData_means.txt")
#write data to file
write.table(tidyData_means, file="tidyData_means.txt", row.name=FALSE)
print("done! the aggregated data is available in the tidyData_means data.frame.")

