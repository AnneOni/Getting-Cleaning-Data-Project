###Getting and Cleaning Data - Project


This project covers the ability to extract data from an external source and transform as per requirement.

The script which contains the code is called run_analysis.R.

The purpose of the script is as follows: 

A) Set working directory to location of downloaded dataset

B) Read and assign the following tables
-x_train.text
-y_train.text
-subject_train.text
-x_test.text
-y_test.text
-subject_test.text

C) Combine datasets as follows
-x_train & x_test
-y_train & y_test
-subject_train & subject_test

D)Extract Mean and Standard deviation from x_train & x_test merger

E)The result from the 3 mergers in (C)will be merged together to form Merge_DS NB: x_train & x_test will only contain 
Mean and Standard deviation at this point.

F)Replace activities labels in data set with descriptive activity names provided

G)Create a second tidy set from table created initially. This contains the mean per activity per subject.

H)tidydata.txt file is produced at the end of run_analysis.R
