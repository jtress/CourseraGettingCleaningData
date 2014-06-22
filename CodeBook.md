# Code Book for Output File

The data set present in the file “tidydataset.csv” after running the R script “run_Analysis.R” against the Samsung Galaxy S data set represents the averages of each
feature by subject and activity.

The first three columns; “”, “subject” and “activity”; indicate the grouping used for the calculation of the averages across the features present in the initial data set.
“” - represents the row id from the data set created in R, this column will likely be ignored
“subject” - represents the value assigned to individuals on which the initial data set was collected
“activity” - represents the activity the subject was performing when the data was collected; the activity can either be WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING


The rest of the columns in the data set describe the average of the values for the particular feature collected. The column header is the feature name. The original data set had far more features than the subset available in this data set. Only the features containing the mean or standard deviation (std) were kept. The feature names were also renamed to remove punctuation. More information about the meaning of the features can be found in the “features_info.txt” file from the original data source.