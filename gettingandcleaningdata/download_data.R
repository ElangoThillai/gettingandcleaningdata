# download_data.R
# --------------
# Project - Gettig and Cleaning Data
# -----------------------------------
# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# -----------------------------------------------------
# Part 1 - Download and Unzip the file ( for Windows 7)
# -----------------------------------------------------
source_url = "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFname    <- "projectData.zip"
rootWorkDir <- "c:/Clean_Data/"            # root work directory - "C:/Clean_Data/"
subDir <- "UCI HAR Dataset"

# Create the Main Directory

if (!file.exists(rootWorkDir)) {
 dir.create(file.path(rootWorkDir))
  setwd(file.path(rootWorkDir))
} else {
 setwd(file.path(rootWorkDir))
}
setwd(file.path(rootWorkDir))


# Download the file and set the subdirectory "UCI HAR Dataset" under root Directory as working directory
if (file.exists(subDir)) {
    setwd(file.path(rootWorkDir,subDir))
} else {
    download.file(source_url, destfile=zipFname)
    unzip(zipFname, exdir=".")
    setwd(file.path(rootWorkDir,subDir))
}
