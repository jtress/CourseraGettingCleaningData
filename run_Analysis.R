# Read in the file "features.txt" from the data set to obtain the names of the 
# variables of the features in the file "X_train.txt" and "X_test.txt". Extract
# only the second column which contains the names and then remove punctuation.
col_names <- read.csv("UCI HAR Dataset//features.txt", header = FALSE, sep = "")
col_names <- col_names[,2]
col_names <- gsub("\\-|\\(|\\)|\\.","",col_names, perl=TRUE)


# Create a logical vector to represent the variables which are either mean or
# standard deviation measurements
index_col_names <- grepl("mean()", col_names) | grepl("std()", col_names) |
        grepl("Mean", col_names)


# Read the "X_train.txt" and "Y_test.txt" data sets in setting the column names
# with the vector created earlier. Then combine rows into one data frame.
x_train <- read.csv("UCI HAR Dataset//train//X_train.txt", header = FALSE,
                    sep = "", col.names = col_names)
x_test <- read.csv("UCI HAR Dataset//test//X_test.txt", header = FALSE,
                   sep = "", col.names = col_names)
x <- rbind(x_train, x_test)


# Subset the combined x data set to only contain the variables that either
# mean or standard deviation measurements using the logical vector created earlier
x <- x[,index_col_names]


# Read the "y_train.txt" and "y_test.txt" data sets in setting the column name
# to "activity". Combine rows into one data frame. Then convert the integers to
# factor labels using the labels in the file "activity_labels.txt"
y_train <- read.csv("UCI HAR Dataset//train//y_train.txt", header = FALSE,
                    col.names = c("activity"))
y_test <- read.csv("UCI HAR Dataset//test//y_test.txt", header = FALSE,
                    col.names = c("activity"))
y <- rbind(y_train, y_test)

activity_names <- read.csv("UCI HAR Dataset//activity_labels.txt", header = FALSE,
                           sep = "")
activity_names <- activity_names[,2]

y$activity <- factor(y$activity, labels = activity_names)


# Read the "subject_train.txt" and "subject_test.txt" data sets in setting the
# column name to "subject". Then combine into one data frame.
subject_train <- read.csv("UCI HAR Dataset//train//subject_train.txt",
                          header = FALSE, col.names = c("subject"))
subject_test <- read.csv("UCI HAR Dataset//test//subject_test.txt",
                          header = FALSE, col.names = c("subject"))
subject <- rbind(subject_train, subject_test)


# Combine the data sets so the first column is the subject, the second column 
# the activity and the rest of the columns the mean and standard deviation
# measurements of the features for the subject and activity
full <- cbind(subject, y, x)


# Split by subject and activity to get the averages of each feature.
# melt and dcast require reshape2 package
col_names <- colnames(full)
fullMelt <- melt(full,id=col_names[1:2],measure.vars=col_names[3:88])
final <- dcast(fullMelt, subject + activity ~ variable, mean)


# Write out the final data set containing the averages of all the variables by
# subject and activity to the file "tidydataset.csv" in the current working
# directory
write.csv(final,file="tidydataset.csv")


