# Getting_and_cleaning_data
This repo contains the R file "run_analysis.R", which gets data and cleans data, and a code book "CodeBook.Md", detailing the variables and summaries calculated.  
  
The analysis, taking part in the file "run_analysis.R" follows the following steps:  
1. It merges the training and the test sets to create one data set. In this step, the variables are also given appropriate and descriptive names.  
2. It extracts only the measurements on the mean and standard deviation for each measurement.  
3. It uses descriptive activity names to name the activities in the data set. The resulting data set is called "data_mean_std".   
4. From the data set in step 4, the R file creates a second, independent tidy data set ("tidy_data_mean_std") with the average of each variable for each activity and each subject.


