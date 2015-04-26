#README

Coursera - Getting and Cleaning Data - Course Project Script

##Purpose

The purpose of the run_analysis.R script file is to produce a tidy data set of the means of specific variables within the Samsung data set, organized by activiy type and the test subject number.

##Information

The script was created with the following software:

	'Filename: run_Analysis.R
	'R version: 3.2.0 (2015-04-16) "Full of Ingredients"
	'R studio version: 0.98.1103
	'OS: Windows 8.1

##Acknowledgements and License

This script relies on data gathered in the following study:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Please consult the documentation within this publication and within their data for more detailed information.

##Program Flow

A summary of how the run_analysis.R script is below. For more information, please see the annotated code within the run_Analysis.R script.

1) The script executes preliminary checks such as checking for the existence of a data directory, installing required R packages, and downloading and unzipping the data set from the Internet.

2) The script loads the following text files from the data set into separate data frames in R:

	'features.txt'
	'activity_labels.txt'
	'train/X_train.txt'
	'train/y_train.txt'
	'test/X_test.txt'
	'test/y_test.txt'
	'train/subject_train.txt'
	'test/subject_test.txt'

3) The script processes the data frames from Step 2 by: removing invalid characters (for column names), combining the test and training data sets, re-initializing the column names, and freeing up memory. The result of this step is a combined data set.

4) The script filters out the combined data set for columns that are computing only the mean and standard deviation of the data. The result of this step is the correctly filtered data.

5) The script uses the aggregate() function in R to compute the mean for the filtered data set by activity type and subject number. The output of this step is the desired tidy data set.

6) The script outputs the final tidy data set as tidyData.txt and clears memory.

## Tidy Data Justification

This data is tidy because it conforms to the key tidy data principles:
1. There is only one variable per column.
2. Each different observation of that variable is in a different row.
3. There is only one table for each kind of variable.
4. There is a row at the top with the variable names and each variable name is human readable.
5. The data is ready for further analysis.
