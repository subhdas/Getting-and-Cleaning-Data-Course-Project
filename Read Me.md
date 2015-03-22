Getting and Cleaning Data - Course Project
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data",from Coursera.

The dataset used for this project : Human Activity Recognition Using Smartphones 

The code requires that all data is present in the Data folder under the root directory, un-compressed and without names altered. CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. The output of the 5th step is called Avg Tidy Data.txt, and uploaded in the course project's form.

This repository includes my final  course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization. 

Raw Data:
561 features are unlabeled and available in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file. Same goes for the training data set.

About the script and the tidy dataset
There is a script in this repository called run_analysis.R which merges the test and training sets together.
Data requirements for this script:
the UCI HAR Dataset must be extracted and..
the UCI HAR Dataset must be availble in a directory called  "data"
After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

The R Script will create a tidy data set containing the means of all the columns per test subject and per activity. This tidy dataset will be written to a tab-delimited file.

About the Code Book
The CodeBook.md file explains the algorithm employed to clean the data and fetch required measurements.