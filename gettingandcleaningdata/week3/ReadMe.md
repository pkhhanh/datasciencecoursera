This project is part of the Coursera course Getting and Cleaning Data. Please see below for some overview.

The data used in this project:
=========
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


This repo includes the following files:
=========
  - run_analysis.R: R script that cleans and merge the raw data into a final tidy data set
  - README.md: this file gives an overal explanation of the project
  - CodeBook.md: this file describes the variables, the data, and any transformations or work that I performed to clean up the data
  - tidy_data.txt: this is the final tidy dataset



How to run the script:
=========
In order to run the script, please download the raw data to your working directory. You need to extract the folder before running run_analysis.R. It will produce file tidy_data.txt after the R code finishes running


Can I call this data tidy?
=========
According to the lectures and the paper http://vita.had.co.nz/papers/tidy-data.pdf, our final data set qualifies as a tidy dataset:
  - Each variable forms a column: we have subject, activity and other feature columns

  - Each observation forms a row: each row is the average of each variable for each activity and each subject

  - Each type of observational unit forms a table.

  - We added column names.