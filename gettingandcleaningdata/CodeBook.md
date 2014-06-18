Course 3:  GETTING AND CLEANING- Project

Project Requirement:
--------------------
Create R script called run_analysis.R that does the following. 


1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Data Source:
------------
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Part-1: Download and unzip the file
-----------------------------------
This part has been tested with Windows 7.  If you have different operating system, please ignore this part, and download and unzip the file.
set the current working directory using the command setwd("./UCI HAR DataseT/") and run Part-2


## Task-1. Merges Training and Test data to create one data - from folders "test" and "train":
-------------------------------------------------------------------------------------------
1. Read and Merge the data into one data set. This part of the code takes about 53 secs to read and merge the data.  

run Time below.
---------------
> system.time(rbind(read.table("train/x_train.txt"), read.table("test/x_test.txt")))
   user  system elapsed 
   52.41    0.30   52.86 



> system.time(rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt")))
   user  system elapsed 
   0.01    0.00    0.02 

> system.time(rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt")))
   user  system elapsed 
   0.02    0.00    0.02 


## Task-2. Extracts only the measurements on the mean and standard deviation for each measurement.
## -----------------------------------------------------------------------------------------------
This steps read the 'features.txt".  First it identify with an index of the occurrences of the words 'mean' and 'std'
and  corresponding set from xall_data (merged dataset of train/test), and assigns labels after enrich the data by removing
the "()" and converting the data all into lower cases.  
Example:  
(before cleaning)
[1] "tBodyAcc-mean()-X"           
[2] "tBodyAcc-mean()-Y"     

(after cleaning)
 [1] "tbodyacc-mean-x"           
 [2] "tbodyacc-mean-y"

This creates a data frame of 10299 rows x 66 columns



##Task-3 (Uses descriptive activity names to name the activities in the data set)
-------------------------------------------------------------------------------
This part of R script first reads the look up data in the activity_labels.txt. To create a standard consistent data, it cleans by converting
all the lables into lower cases.  Then, the script replaces all the codes with the right labels in the "yall_data" set.
For example:  In "yall_data" set, if there is a code for the attribute "v1" is 5, then it replaces it with "standing",  replaces 3 with
"walking_downstairs" etc.,  Finally the code replaces the attribute name "v1" to "activity"

This creates a data frame of 10299 rows x 1 column
Example:
  activity
1 standing
2 standing
10287 walking_downstairs
10288 walking_downstairs
10298 walking_upstairs
10299 walking_upstairs


## Task -4. Appropriately labels the data set with descriptive activity names.
## ---------------------------------------------------------------------------

This part of the R first assigns the lable "subject" to the subj_data and then combines all 3 data frames and finally create a file
"merged_clean_data.txt" in the current directory from the data set

Example:
  fbodybodygyromag-std fbodybodygyrojerkmag-mean fbodybodygyrojerkmag-std
1           -0.9613094                -0.9919904               -0.9906975
2           -0.9833219                -0.9958539               -0.9963995
3           -0.9860277                -0.9950305               -0.9951274
4           -0.9878358                -0.9952207               -0.9952369
5           -0.9890594                -0.9950928               -0.9954648
6           -0.9858609                -0.9951433               -0.9952387


This creates a data frame of 10299 rows x 68 columns


## 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
## -----------------------------------------------------------------------------------------------------------------


This part of R first initialize set of variables and a data frame set, then using a set of commands inside a loop to create a data frame
of 180 rows and 68 columns.  Finally, it creates a data file "data_set_with_the_averages.txt" from this data frame.

