This file describes the variables, the data, and any transformations or work that I performed to clean up the data

Steps the file run_analysis.R uses to get the final tidy data:
=========  
  - Set working directory as './getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/' so I don't have to retype it throughout the script.
  - Read the trainning data into the 3 variables: x_train, y_train (activities), subject_train (subjects)
  - Read the test data nto the 3 variables: x_test, y_test (activities), subject_test(subjects) 
  - Merge the training sets and the test sets by function rbind into the 3 variables: x_merged, y_merged, subject_merged

  - Read the features from file features.txt
  - Tidy up the names of the features
  - Extract only the rows with mean and std features from this file
  - Extract the corresponding columns from file x_merged
  - Merge the training sets and the test sets by function rbind

  - Read the features from file activity_label.txt
  - Tidy up the names of the activities
  - Use activity names from this file for y_merge data

  - Change column names of x_merged to feature names from features.txt file
  - Merge 3 data x_merged, y_merged and subject_merged into 1 combined data set: data_merged using cbind

  - Create an empty data frame with 30*6 rows and 88 columns
  - Start populating the data frame by rotating through each subject and each activity
  - For each of those combination, we fill in the row with the average of each variable for each activity and each subject. 
  - Write the tidy data into a txt file 'tidy_data.txt'
