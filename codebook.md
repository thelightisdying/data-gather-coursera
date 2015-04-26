#CODEBOOK.md

The 180x68 tidy data set produced by the run_analysis.R script is organized by the first two columns:

	'Name: SubjectNumber
	'Type: integer
	'Purpose: Identifies the subject number. There are 30 total subject numbers in the data.
	
	'Name: ActivityType
	'Type: character
	'Purpose: Identifies the activity a subject was performing when a measurement was taken. There are 6 possible values:

		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		LAYING
		SITTING
		STANDING

The remaining 66 columns are listed below. They represent the mean of each measurement per SubjectNumber and per ActivityType. For more information on the measurements, please consult the features_info.txt file in the original data set.

	tBodyAccmeanX
	tBodyAccmeanY
	tBodyAccmeanZ
	tBodyAccstdX
	tBodyAccstdY
	tBodyAccstdZ
	tGravityAccmeanX
	tGravityAccmeanY
	tGravityAccmeanZ
	tGravityAccstdX
	tGravityAccstdY
	tGravityAccstdZ
	tBodyAccJerkmeanX
	tBodyAccJerkmeanY
	tBodyAccJerkmeanZ
	tBodyAccJerkstdX
	tBodyAccJerkstdY
	tBodyAccJerkstdZ
	tBodyGyromeanX
	tBodyGyromeanY
	tBodyGyromeanZ
	tBodyGyrostdX
	tBodyGyrostdY
	tBodyGyrostdZ
	tBodyGyroJerkmeanX
	tBodyGyroJerkmeanY
	tBodyGyroJerkmeanZ
	tBodyGyroJerkstdX
	tBodyGyroJerkstdY
	tBodyGyroJerkstdZ
	tBodyAccMagmean
	tBodyAccMagstd
	tGravityAccMagmean
	tGravityAccMagstd
	tBodyAccJerkMagmean
	tBodyAccJerkMagstd
	tBodyGyroMagmean
	tBodyGyroMagstd
	tBodyGyroJerkMagmean
	tBodyGyroJerkMagstd
	fBodyAccmeanX
	fBodyAccmeanY
	fBodyAccmeanZ
	fBodyAccstdX
	fBodyAccstdY
	fBodyAccstdZ
	fBodyAccJerkmeanX
	fBodyAccJerkmeanY
	fBodyAccJerkmeanZ
	fBodyAccJerkstdX
	fBodyAccJerkstdY
	fBodyAccJerkstdZ
	fBodyGyromeanX
	fBodyGyromeanY
	fBodyGyromeanZ
	fBodyGyrostdX
	fBodyGyrostdY
	fBodyGyrostdZ
	fBodyAccMagmean
	fBodyAccMagstd
	fBodyBodyAccJerkMagmean
	fBodyBodyAccJerkMagstd
	fBodyBodyGyroMagmean
	fBodyBodyGyroMagstd
	fBodyBodyGyroJerkMagmean
	fBodyBodyGyroJerkMagstd
