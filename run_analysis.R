#############################################
#
# This script performs a variety of tasks specified below:
#
#
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each 
#   measurement.
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names.
#5) From the data set in step 4, creates a second, independent tidy data set with 
#   the average of each variable for each activity and each subject.


## Step 1)  Merge the training and the test sets to create one data set
# Set working directory:
setwd("~/CourseraDataScienceSpecialization/R/data/UCI HAR Dataset")

# Read in the feature list
featurelist <- read.table("features.txt")

# Read in the training and test data
data_train <- read.table("./train/X_train.txt")
data_test  <- read.table("./test/X_test.txt")

# Name data with appropriate labels using the feature.txt file
colnames(data_train) <- featurelist[,2]
colnames(data_test)  <- featurelist[,2]

# Read in subject number
subject_train <- read.table("./train/subject_train.txt")
subject_test  <- read.table("./test/subject_test.txt")

# Name subject data appropriately:
colnames(subject_train) <- "subject_number"
colnames(subject_test)  <- "subject_number"

# Read in label of activity
label_train <- read.table("./train/y_train.txt")
label_test  <- read.table("./test/y_test.txt")

# Name label data appropriately
colnames(label_train) <- "activity_label"
colnames(label_test)  <- "activity_label"

#merge data sets:
#merge training data
train <- cbind(subject_train, label_train, data_train)
#merge testing data
test  <- cbind(subject_test,  label_test,  data_test)

#merge train and test data:
data <- rbind(train, test)


## Step 2) Extract only the measurements on the mean and standard deviation for
#          each measurement.
# list column indices that contain "mean()" and "std()"
mean_index <- grep(pattern = "mean()", x= colnames(data))
std_index  <- grep(pattern = "std()",  x= colnames(data))

# create data set with only the columns stemming from 
# the subject number, activity label and measurements from mean or std. dev.
data_mean_std <- data[,c(1,2,mean_index,std_index)]

## Step3) Use descriptive activity names to name the activities in the data set
#read in data file specifying activities
activity_list <- read.table("activity_labels.txt") 

#replace number of activity by a descriptive name 
data_mean_std$activity_label <- sapply(data_mean_std$activity_label,
                                      function(i){activity_list[i,2]})

## Step 4) is already done thanks to the renaming immediately after reading
## the data files in in step 1

## Step 5) From the data set in step 4, create a second, independent tidy data 
##         set with the average of each variable for each activity and each 
##         subject.

# for each subject and each activity calculate the mean for each row 

#tidy_data_mean_std will be the final tidy data set
tidy_data_mean_std <- NULL
#looping through the 6 activities
for(activity in activity_list[,2]){
                #looping through the 30 subjects
                for(subject in 1:30){
                temp <- subset(data_mean_std,
                               data_mean_std$activity_label==activity 
                               & data_mean_std$subject_number==subject)
                result <- colMeans(temp[,(3:ncol(data_mean_std))])
                record <- c(subject, activity, result)
                tidy_data_mean_std <- rbind(tidy_data_mean_std,record)
        }
}
rownames(tidy_data_mean_std)<-NULL
