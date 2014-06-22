# CourseraGettingCleaningData

Course assignment for Coursera course "Getting and Cleaning Data'

## Summary

The script "run_Analysis.R" takes the data collected from the accelerometers
from the Samsung Galaxy S smartphones. The initial data set contains
individual measures for several features for subjects doing different
activities such as walking or sitting. After running the script against the
base directory of the unzipped data set found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, you will have a CSV
data set saved to the file "tidydataset.csv" with the averages of each feature
for each subject performing each activity. The code book describing the
features can be found in the file "CodeBook.md".

 
## Steps taken in run_Analysis.R

First the “features.txt” file available in the downloaded zip data set is loaded. All
punctuation is removed from the feature names.

Second the “X_train.txt” and “X_test.txt” data sets are loaded with the column names extracted from the features.txt file in the step above. These “X” data sets are then combined into one data set.

Third the subset of features containing means and standard deviations are taken from the combined “X” data set created in the previous step. This reduces the number of features to only mean and standard deviation features.

Fourth the “y_train.txt” and “y_test.text” data sets are loaded with the column name set to activity. These “y” data sets are then combined into one data set. Then the integers representing the activities in the data set are replaced with the string representation of the activities by using the coding found in the “activity_labels.txt” file.

Fifth the “subject_train.txt” and “subject_test.txt” data sets are loaded with the column name set to subject. These “subject” data sets are then combined into one data set.

Sixth the subjects, activities and features columns created in the previous steps are combined into one data set with the observations by subject, activity, and features.

Seventh the melt and dcast functions are used. These are available in the reshape2 package which must be loaded prior to running the script. The data set created in the sixth data set is melted to divide the data by subject and activity across each feature. Then the cast function is used to calculate the mean of each feature for each subject and activity. This output is then written to the file “tidydataset.csv” as a text file in the current working directory.