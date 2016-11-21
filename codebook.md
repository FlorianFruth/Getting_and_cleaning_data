#Code book
The data used in this repo can be retrieved from the following website:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
  
##Used data files from the above zip folder:  
From this, the following data files were used:  
1) X_train.txt         (training data)  
2) X_test.txt          (test data)  
3) features.txt        (descriptive names of columns/variables from data files 1 and 2)  
4) subject_train.txt   (subject IDs for training data)  
5) subject_test.txt    (subject IDs for test data)  
6) y_train.txt         (activity labels for training data)  
7) y_test.txt          (activity labels for test data)  
8) activity_labels.txt (meaningful description of activity labels)  
  
##Calculated variables:  
1) activity_label: This variable was created from numeric values (ranging from 1-6) as suggested in the file activity_labels.txt,   
i.e. the numbers were replaced by the second column in the mentioned file.  
2) mean_index: lists columns that contain "mean()"  
3) std_index:  lists columns that contain "std()"  
4) "data_mean_std": Data frame created from the previously mentioned files. For all subjects and all activities it lists variables,  
which stem from a mean or standard deviation.  
3) "tidy_data_mean_std": Data frame obtained by calculating for each subject and each activity the average for each variable of   "data_mean_std".  
  
##Process steps of the analysis:  
1) Gathering data from different files  
2) Merging different files into one data set. Then filtering this data set such that it only consists of variables that   
represent a mean or standard deviation.   
3) Calculating a tidy data set that contains for each subject and each activity the mean of all measured variables from   
the data set generated in step 2.  
