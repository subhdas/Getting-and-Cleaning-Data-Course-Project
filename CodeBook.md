Process:

The script run_analysis.R addresses the following 5 steps mentioned in the course project.

1. The script first reads data from the test and train cases. Over all 6 txt files are read into a data frame for each ( 3 txt files each for test and train cases respectively.)
2. x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files. x_data, y_data and subject_data merge the previous datasets to further analysis.features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

3. After understanding the dataset based on same dimensions , I merged them based on same columns or rows, by cbind and rbind commands. Later I added two more columns ( Subject ID and Activity Name)

4. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

5. Later activity data is updated which previously was added as 1:6 numeric format.I fetched the activity labels from the activitylabels.txt and replaced in the dataset.

6. Finally, I generated a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called Avg Tidy Data.txt, and uploaded to this repository.


