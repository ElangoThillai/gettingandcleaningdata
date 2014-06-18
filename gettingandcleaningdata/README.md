
Two sets of code attached.

1.download_data.R  
2.run_analysis.R


Part-1: download_data.R  (for windows 7)
----------------------------------------
This part has been tested with Windows 7.  If you have different operating system, please ignore this script, and please manually 
download and unzip the file. 
set the current working directory using the command setwd("./UCI HAR Dataset/") and run Part-2

## Source of data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



Part-2: run_analysis.R 
-----------------------

Please setup the current directory where you have downloaded and unzip. Example if you have downloaded and unzipped into "c:/Clean_Data"
then set the current directory using the follwoing command:

setwd("c:/Clean_Data/UCI HAR Dataset/")

Run the R file using:

source("c:/Clean_Data/run_analysis.R")


The read takes about 53 seconds from the files.

The script creates 2 files:

C:\Clean_Data\UCI HAR Dataset>DIR
 Volume in drive C has no label.
 Volume Serial Number is F48F-7E00

 Directory of C:\Clean_Data\UCI HAR Dataset

05/25/2014  04:53 PM    <DIR>          .
05/25/2014  04:53 PM    <DIR>          ..
05/25/2014  04:49 PM                80 activity_labels.txt
05/25/2014  04:53 PM           225,171 data_set_with_the_averages.txt
05/25/2014  04:49 PM            15,785 features.txt
05/25/2014  04:49 PM             2,809 features_info.txt
05/25/2014  05:15 PM         8,348,196 merged_clean_data.txt
05/25/2014  04:49 PM             4,453 README.txt
05/25/2014  04:49 PM    <DIR>          test
05/25/2014  04:49 PM    <DIR>          train
               6 File(s)      8,596,494 bytes
               4 Dir(s)  38,818,164,736 bytes free




1) merged_clean_data.txt:  10299 rows x 68 columns
2) data_set_with_the_averages.txt: 180 rows x 68 columns


Testing:
--------
To read the file use the following command:

> test1 <- read.table("data_set_with_the_averages.txt")

> test1[4,5]
[1] -0.1045442
> test1[124,67]
[1] -0.9900143
> 
