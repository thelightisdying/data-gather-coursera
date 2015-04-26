'''r
# Coursera - Getting and Cleaning Data - Course Project Script

# Running this script will download the raw data for the course project, process it, and produce a tidy data set.

# Filename: run_Analysis.R
# R version: 3.2.0 (2015-04-16) "Full of Ingredients"
# R studio version: 0.98.1103
# OS: Windows 8.1

#1. Check if the data directory exists and create it if it does not:

  if (!file.exists("data")) {
    
    dir.create("data")
  }
  
  setwd("./data")
  
#2. Check for required packages and load all required libraries:
  
  require("downloader") # this package allows easy unzipping of files!
  require("dplyr")
  library(dplyr)
  
#3. Download the raw data file and extract it:
  
  #a) Check if file is already downloaded before downloading:
    
    if (!file.exists("rawData.zip")) {
    
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","rawData.zip")
    }
  
  #b) Uzip the file to the existing directory:
  
    unzip("rawData.zip", exdir = ".")
  
#4. Load all of the training and test data sets into separate data frames:
  
  testSubject <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
  testX <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
  testY <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt", header = FALSE)
  
  trainSubject <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)
  trainX <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
  trainY <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt", header = FALSE)
  
  activityLabels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", header = FALSE)
  featuresLabels <- read.table(".\\UCI HAR Dataset\\features.txt", header = FALSE)
    
#4. Combine the test and training data sets:
  
  #a) The featuresLabels are supposed to be the column names for the 561 variables in the data set. However, these names have invalid characters in them like "(" and ",". Therefore, we must remove these characters from the featuresLabels data before assigning them as column names.
  
    featuresLabels[,2] <- sub(pattern = "(",replacement = "",featuresLabels[,2],fixed = TRUE) #ex. find all ")" characters and replace with blanks
    featuresLabels[,2] <- sub(pattern = ")",replacement = "",featuresLabels[,2],fixed = TRUE)
    featuresLabels[,2] <- sub(pattern = ",",replacement = "",featuresLabels[,2],fixed = TRUE)
    featuresLabels[,2] <- sub(pattern = "-",replacement = "",featuresLabels[,2],fixed = TRUE) 
    featuresLabels[,2] <- sub(pattern = "-",replacement = "",featuresLabels[,2],fixed = TRUE) # for some reason, this needs to run twice to work
    featuresLabels[,2] <- sub(pattern = ")",replacement = "",featuresLabels[,2],fixed = TRUE) 
  
  #b) Set the cleaned featuresLabels vector as the column names for the testX and testY dataframes:
  
    colnames(testX) <- c(featuresLabels[,2]) # actual labels are located in the 2nd row, hence the sub-setting
    colnames(trainX) <- c(featuresLabels[,2])
  
  #c) Combine the test and training data with the common labels:
  
    testData <- cbind(testSubject, testY, testX)
    trainData <- cbind(trainSubject, trainY, trainX)
  
  #d) Rename the recently added subject and activity columns:
  
    colnames(testData)[1] <- c("SubjectNumber")
    colnames(testData)[2] <- c("ActivityType")
    colnames(trainData)[1] <- c("SubjectNumber")
    colnames(trainData)[2] <- c("ActivityType")
  
  #e) Combine the data and re-initialize the column names of the CombinedData (avoids errors later on):
  
    CombinedData <- rbind(testData, trainData)
  
    validNames <- make.names(names=names(CombinedData), unique=TRUE, allow_ = TRUE)
    names(CombinedData) <- validNames
  
  #f) Replace the numeric values in the ActivityType column with the equivalent character string (this is not elegant but it works!):
  
    CombinedData[,2] <- sub(pattern = "1",replacement = activityLabels[1,2],CombinedData[,2],fixed = TRUE)
    CombinedData[,2] <- sub(pattern = "2",replacement = activityLabels[2,2],CombinedData[,2],fixed = TRUE)
    CombinedData[,2] <- sub(pattern = "3",replacement = activityLabels[3,2],CombinedData[,2],fixed = TRUE)
    CombinedData[,2] <- sub(pattern = "4",replacement = activityLabels[4,2],CombinedData[,2],fixed = TRUE)
    CombinedData[,2] <- sub(pattern = "5",replacement = activityLabels[5,2],CombinedData[,2],fixed = TRUE)
    CombinedData[,2] <- sub(pattern = "6",replacement = activityLabels[6,2],CombinedData[,2],fixed = TRUE)
 
  #g) Clean up the workspace and free up memory:
  
    remove(featuresLabels, testData, testSubject, testX, testY, trainData, trainSubject, trainX, trainY, activityLabels)
 
#5. Use dplyr functions to find only data columns with the strings "mean" and "std". I am not including columns with MeanFreq or Angle. I also have to keep the SubjectNumber and ActivityType columns for Part 5:
  
  #a. Use the select function to filter the desired columns: 
  
    filteredCombinedData <- select(CombinedData, contains("SubjectNumber"), contains("ActivityType"), contains("mean"), -contains("freq"), contains("std"), -contains("angle") )
  
  #b. Use aggregates function to summarize the data and compute the means:
  
    attach(filteredCombinedData)
    aggData <-aggregate(filteredCombinedData, by=list(SubjectNumber,ActivityType), FUN=mean, na.rm=TRUE)
    detach(filteredCombinedData)
  
  #c. Remove the grouping columns and rename the columns created by aggregates():
  
    drops <- c("ActivityType", "SubjectNumber")
    tidyData <- aggData[,!(names(aggData) %in% drops)]
 	  colnames(tidyData)[1] <- c("SubjectNumber")
    colnames(tidyData)[2] <- c("ActivityType")
	
  #d. Clean memory and write the final data table!
  
    remove(aggData,filteredCombinedData)
    write.table(tidyData, "tidyData.txt", row.names=FALSE)
    #rm(list=ls(all=TRUE))
  
# This data is tidy because it conforms to all the tidy data principles of:
# 1. There is only one variable per column.
# 2. Each different observation of that variable is in a different row.
# 3. There is only one table for each kind of variable.
# 4. There is a row at the top with the variable names and each variable name is human readable.
  
'''  
