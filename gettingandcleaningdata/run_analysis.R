# run_analysis.R
# ---------------
# Project - Gettig and Cleaning Data
# -----------------------------------
# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#

# ----------------------------------
# Project requirement tasks
# ----------------------------------

# Task-1. Merges Training and Test data to create one data - from flders "test" and "train" (Takes about 53 seconds to read)
# --------------------------------------------------------------------------------------------------------------------------
xall_data <- rbind(read.table("train/x_train.txt"), read.table("test/x_test.txt"))
yall_data <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))
subj_data <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))


# Task-2. Extracts only the measurements on the mean and standard deviation for each measurement.
# -----------------------------------------------------------------------------------------------
features_data <- read.table("features.txt")
features_data_idx <-  grep("-mean\\(\\)|-std\\(\\)", features_data[, 2])  #get the value of data 
xall_data <- xall_data[,features_data_idx]  			 # getting data for mean and Std
names(xall_data) <- features_data[features_data_idx, 2]  	 # assigning labels
names(xall_data) <- gsub("\\(|\\)", "", names(xall_data))        # clean-remove open paranthesis
names(xall_data) <- tolower(names(xall_data))  			 # convert into lower case

# Task-3. Uses descriptive activity names to name the activities in the data set
# ------------------------------------------------------------------------------

activities_data <- read.table("activity_labels.txt")		  		
activities_data[,2]<- tolower(as.character(activities_data[, 2]))
yall_data[,1] <- activities_data[yall_data[,1],2]
names(yall_data) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.
# ---------------------------------------------------------------------
names(subj_data) <- "subject"					#assign the label to subject_data
clean_data_set <- cbind(subj_data, yall_data, xall_data)	#combine all 3 data sets
write.table(clean_data_set, "merged_clean_data.txt")		#create the data file with result


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
# -----------------------------------------------------------------------------------------------------------------

# initialize and assign values to variables

totCleanCols <- ncol(clean_data_set)     		  
totActivity  <- nrow(activities_data)      
unqSubjData  <- unique(subj_data)[,1]
totSubj      <- length(unqSubjData)
totObs       <- totSubj*totActivity

#initialize the data frame avgResultData

avgResultData<- clean_data_set[1:totObs, ]          


# loop calculation to create the tiday data set for each variable for each activity and subject
rcnt <- 1               
for (subj in 1:totSubj) {
	for (acvty in 1:totActivity) {
		avgResultData[rcnt, 1] = unqSubjData[subj]
		avgResultData[rcnt, 2] = activities_data[acvty, 2]
		tmpMean <- clean_data_set[clean_data_set$subject==subj & clean_data_set$activity==activities_data[acvty, 2], ]
		avgResultData[rcnt, 3:totCleanCols] <- colMeans(tmpMean[, 3:totCleanCols])
		rcnt <- rcnt+1
	}
}

write.table(avgResultData, "data_set_with_the_averages.txt") 		#create the data file with the result


#----End-------------