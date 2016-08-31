run_analysis <- function()
{
  library(plyr)
  library(dplyr)
  
  #---------------------------------------------------------------------------------------------------
  #During this section, I read in the Subject identifer labels table for the trained data and changed the column name to SUbject ID
  subjecttrainedlabels <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//train//subject_train.txt")
  subjecttrainedlabels <- rename(subjecttrainedlabels, SubjectID = V1)
  
  # During this section, I read in the train set labels and changed the first columan name to activitys. I also set
  # the column to a factor and maped the training labels name table to the values in the activity table first column
  subjecttraineddatalabels <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//train//y_train.txt")
  subjecttraineddatalabels <- rename(subjecttraineddatalabels, Activitys = V1)
  subjecttraineddatalabels <- as.factor(subjecttraineddatalabels$Activitys)
  subjecttraineddatalabels <- mapvalues(subjecttraineddatalabels, from = c("1","2","3","4","5","6"), to = c("WALKING","WALKING_UPSTAIRS","WALKING_DONSTAIRS","SITTING","STANDING","LAYING"))
  
  # During this section, I read in the data for the training sets and the training sets columns label table. Afterwareds, 
  # I set the names of the features to the respective column in the training set tables
  subjecttraineddata <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//train//X_train.txt")
  featuredatalabels <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//features.txt")
  names(subjecttraineddata) = featuredatalabels$V2

  #Lastly, I combined subject table, label table, and data set table into one table 
  #and changed the second column name back to a activity 
  trainingdata <- cbind(subjecttrainedlabels,subjecttraineddatalabels,subjecttraineddata)
  names(trainingdata)[2] = "Activity"
  
  #--------------------------------------------------------------------------------------------------
  #The steps to this section code is identical to the steps above. The only difference is that this is test data
  # instead of training data. Refer to the above text for explaination. 
  
  subjecttestlabels <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//test//subject_test.txt")
  subjecttestlabels <- rename(subjecttestlabels, SubjectID = V1)
  
  
  subjecttestdatalabels <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//test//y_test.txt")
  subjecttestdatalabels <- rename(subjecttestdatalabels, Activitys = V1)
  subjecttestdatalabels <- as.factor(subjecttestdatalabels$Activitys)
  subjecttestdatalabels <- mapvalues(subjecttestdatalabels, from = c("1","2","3","4","5","6"), to = c("WALKING","WALKING_UPSTAIRS","WALKING_DONSTAIRS","SITTING","STANDING","LAYING"))
  
  
  subjecttestdata <- read.table("C://Users//DarkHorse//Desktop//CleanData//UCI HAR Dataset//test//X_test.txt")
  names(subjecttestdata) = featuredatalabels$V2
  
  
  testingdata <- cbind(subjecttestlabels,subjecttestdatalabels,subjecttestdata)
  names(testingdata)[2] = "Activity"
  
  
  #------------------------------------------------------------------------------------------------------
  # This code combined the training and test data into one dataset  
   combineddataset <- rbind(trainingdata,testingdata)
  
   #This code subsetted the data only keeping the columns that represent the mean and stds of each signal
  reduced_dataset <- combineddataset[c(1:2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]
  
  #-----------------This code is how I renamed the columns to useful names---------------------------
  names(reduced_dataset)[3] = "tBodyAccMeanX"
  names(reduced_dataset)[4] = "tBodyAccMeanY"
  names(reduced_dataset)[5] = "tBodyAccMeanZ"
  names(reduced_dataset)[6] = "tBodyAccStdX"
  names(reduced_dataset)[7] = "tBodyAccStdY"
  names(reduced_dataset)[8] = "tBodyAccStdZ"
  
  names(reduced_dataset)[9] = "tGravityAccMeanX"
  names(reduced_dataset)[10] = "tGravityAccMeanY"
  names(reduced_dataset)[11] = "tGravityAccMeanZ"
  names(reduced_dataset)[12] = "tGravityAccStdX"
  names(reduced_dataset)[13] = "tGravityAccStdY"
  names(reduced_dataset)[14] = "tGravityAccStdZ"
  
  names(reduced_dataset)[15] = "tBodyAccJerkMeanX"
  names(reduced_dataset)[16]  = "tBodyAccJerkMeanY"
  names(reduced_dataset)[17] = "tBodyAccJerkMeanZ"
  names(reduced_dataset)[18] = "tBodyAccJerkStdX"
  names(reduced_dataset)[19] = "tBodyAccJerkStdY"
  names(reduced_dataset)[20] = "tBodyAccJerkStdZ"
  
  names(reduced_dataset)[21] = "tBodyGyroMeanX"
  names(reduced_dataset)[22]  = "tBodyGyroMeanY"
  names(reduced_dataset)[23] = "tBodyGyroMeanZ"
  names(reduced_dataset)[24] = "tBodyGyroStdX"
  names(reduced_dataset)[25] = "tBodyGyroStdY"
  names(reduced_dataset)[26] = "tBodyGyroStdZ"
  
  names(reduced_dataset)[27] = "tBodyGyroJerkMeanX"
  names(reduced_dataset)[28]  = "tBodyGyroJerkMeanY"
  names(reduced_dataset)[29] = "tBodyGyroJerkMeanZ"
  names(reduced_dataset)[30] = "tBodyGyroJerkStdX"
  names(reduced_dataset)[31] = "tBodyGyroJerkStdY"
  names(reduced_dataset)[32] = "tBodyGyroJerkStdZ"
  
  names(reduced_dataset)[33] = "tBodyAccMagMean"
  names(reduced_dataset)[34]  = "tBodyAccMagStd"
  names(reduced_dataset)[35] = "tGravityAccMagMean"
  names(reduced_dataset)[36] = "tGravityAccMagStd"
  names(reduced_dataset)[37] = "tBodyAccJerkMagMean"
  names(reduced_dataset)[38] = "tBodyAccJerkMagStd"
  names(reduced_dataset)[39] = "tBodyGyroMagMean"
  names(reduced_dataset)[40] = "tBodyGyroMagStd"
  names(reduced_dataset)[41] = "tBodyGyroJerkMagMean"
  names(reduced_dataset)[42] = "tBodyGyroJerkMagStd"
  
  names(reduced_dataset)[43] = "fBodyAccMeanX"
  names(reduced_dataset)[44]  = "fBodyAccMeanY"
  names(reduced_dataset)[45] = "fBodyAccMeanZ"
  names(reduced_dataset)[46] = "fBodyAccStdX"
  names(reduced_dataset)[47] = "fBodyAccStdY"
  names(reduced_dataset)[48] = "fBodyAccStdZ"
  
  names(reduced_dataset)[49] = "fBodyAccJerkMeanX"
  names(reduced_dataset)[50]  = "fBodyAccJerkMeanY"
  names(reduced_dataset)[51] = "fBodyAccJerkMeanZ"
  names(reduced_dataset)[52] = "fBodyAccJerkStdX"
  names(reduced_dataset)[53] = "fBodyAccJerkStdY"
  names(reduced_dataset)[54] = "fBodyAccJerkStdZ"
  
  names(reduced_dataset)[55] = "fBodyGyroMeanX"
  names(reduced_dataset)[56]  = "fBodyGyroMeanY"
  names(reduced_dataset)[57] = "fBodyGyroMeanZ"
  names(reduced_dataset)[58] = "fBodyGyroStdX"
  names(reduced_dataset)[59] = "fBodyGyroStdY"
  names(reduced_dataset)[60] = "fBodyGyroStdZ"
  
  names(reduced_dataset)[61] = "fBodyAccMagMean"
  names(reduced_dataset)[62]  = "fBodyAccMagStd"
  names(reduced_dataset)[63] = "fBodyAccJerkMagMean"
  names(reduced_dataset)[64] = "fBodyAccJerkMagStd"
  names(reduced_dataset)[65] = "fBodyGyroMagMean"
  names(reduced_dataset)[66] = "fBodyGyroMagStd"
  names(reduced_dataset)[67] = "fBodyGyroJerkMagMean"
  names(reduced_dataset)[68] = "fBodyGyroJerkMagStd"
  
  names(reduced_dataset)[2] = "Activity"
  
  #----------------------------------------------------------------------------------------
  #This code group the data by subject ID and Activity 
  subjectdatabygroup <- group_by(reduced_dataset,SubjectID,Activity)
  
  #This code is used to get the avg and std for each subject by activity
  subjectactivityavgtable <- summarize(subjectdatabygroup,
            tBodyAccMeanX = mean(tBodyAccMeanX, na.rm = TRUE),
            tBodyAccMeanY = mean(tBodyAccMeanY, na.rm = TRUE),
            tBodyAccMeanZ = mean(tBodyAccMeanZ, na.rm = TRUE),
            tBodyAccStdX = mean(tBodyAccStdX, na.rm = TRUE),
            tBodyAccStdY = mean(tBodyAccStdY, na.rm = TRUE),
            tBodyAccStdZ = mean(tBodyAccStdZ, na.rm = TRUE),
            tGravityAccMeanX = mean(tGravityAccMeanX, na.rm = TRUE),
            tGravityAccMeanY = mean(tGravityAccMeanY, na.rm = TRUE),
            tGravityAccMeanZ = mean(tGravityAccMeanZ, na.rm = TRUE),
            tGravityAccStdX = mean(tGravityAccStdX, na.rm = TRUE),
            
            tGravityAccStdY = mean(tGravityAccStdY, na.rm = TRUE),
            tGravityAccStdZ = mean(tGravityAccStdZ, na.rm = TRUE),
            tBodyAccJerkMeanX = mean(tBodyAccJerkMeanX, na.rm = TRUE),
            tBodyAccJerkMeanY = mean(tBodyAccJerkMeanY, na.rm = TRUE),
            tBodyAccJerkMeanZ = mean(tBodyAccJerkMeanZ, na.rm = TRUE),
            tBodyAccJerkStdX = mean(tBodyAccJerkStdX, na.rm = TRUE),
            tBodyAccJerkStdY = mean(tBodyAccJerkStdY, na.rm = TRUE),
            tBodyAccJerkStdZ = mean(tBodyAccJerkStdZ, na.rm = TRUE),
            tBodyGyroMeanX = mean(tBodyGyroMeanX, na.rm = TRUE),
            tBodyGyroMeanY = mean(tBodyGyroMeanY, na.rm = TRUE),
            
            tBodyGyroMeanZ = mean(tBodyGyroMeanZ, na.rm = TRUE),
            tBodyGyroStdX = mean(tBodyGyroStdX, na.rm = TRUE),
            tBodyGyroStdY = mean(tBodyGyroStdY, na.rm = TRUE),
            tBodyGyroStdZ = mean(tBodyGyroStdZ, na.rm = TRUE),
            tBodyGyroJerkMeanX = mean(tBodyGyroJerkMeanX, na.rm = TRUE),
            tBodyGyroJerkMeanY = mean(tBodyGyroJerkMeanY, na.rm = TRUE),
            tBodyGyroJerkMeanZ = mean(tBodyGyroJerkMeanZ, na.rm = TRUE),
            tBodyGyroJerkStdX = mean(tBodyGyroJerkStdX, na.rm = TRUE),
            tBodyGyroJerkStdY = mean(tBodyGyroJerkStdY, na.rm = TRUE),
            tBodyGyroJerkStdZ = mean(tBodyGyroJerkStdZ, na.rm = TRUE),
            
            tBodyAccMagMean = mean(tBodyAccMagMean, na.rm = TRUE),
            tBodyAccMagStd = mean(tBodyAccMagStd, na.rm = TRUE),
            tGravityAccMagMean = mean(tGravityAccMagMean, na.rm = TRUE),
            tGravityAccMagStd = mean(tGravityAccMagStd, na.rm = TRUE),
            tBodyAccJerkMagMean = mean(tBodyAccJerkMagMean, na.rm = TRUE),
            tBodyAccJerkMagStd = mean(tBodyAccJerkMagStd, na.rm = TRUE),
            tBodyGyroMagMean = mean(tBodyGyroMagMean, na.rm = TRUE),
            tBodyGyroMagStd = mean(tBodyGyroMagStd, na.rm = TRUE),
            tBodyGyroJerkMagMean = mean(tBodyGyroJerkMagMean, na.rm = TRUE),
            tBodyGyroJerkMagStd = mean(tBodyGyroJerkMagStd, na.rm = TRUE),
            
            fBodyAccMeanX = mean(fBodyAccMeanX, na.rm = TRUE),
            fBodyAccMeanY = mean(fBodyAccMeanY, na.rm = TRUE),
            fBodyAccMeanZ = mean(fBodyAccMeanZ, na.rm = TRUE),
            fBodyAccStdX = mean(fBodyAccStdX, na.rm = TRUE),
            fBodyAccStdY = mean(fBodyAccStdY, na.rm = TRUE),
            fBodyAccStdZ = mean(fBodyAccStdZ, na.rm = TRUE),
            fBodyAccJerkMeanX = mean(fBodyAccJerkMeanX, na.rm = TRUE),
            fBodyAccJerkMeanY = mean(fBodyAccJerkMeanY, na.rm = TRUE),
            fBodyAccJerkMeanZ = mean(fBodyAccJerkMeanZ, na.rm = TRUE),
            fBodyAccJerkStdX = mean(fBodyAccJerkStdX, na.rm = TRUE),
            
            fBodyAccJerkStdY = mean(fBodyAccJerkStdY, na.rm = TRUE),
            fBodyAccJerkStdZ = mean(fBodyAccJerkStdZ, na.rm = TRUE),
            fBodyGyroMeanX = mean(fBodyGyroMeanX, na.rm = TRUE),
            fBodyGyroMeanY = mean(fBodyGyroMeanY, na.rm = TRUE),
            fBodyGyroMeanZ = mean(fBodyGyroMeanZ, na.rm = TRUE),
            fBodyGyroStdX = mean(fBodyGyroStdX, na.rm = TRUE),
            fBodyGyroStdY = mean(fBodyGyroStdY, na.rm = TRUE),
            fBodyGyroStdZ = mean(fBodyGyroStdZ, na.rm = TRUE),
            fBodyAccMagMean = mean(fBodyAccMagMean, na.rm = TRUE),
            fBodyAccMagStd = mean(fBodyAccMagStd, na.rm = TRUE),
            
            fBodyAccJerkMagMean = mean(fBodyAccJerkMagMean, na.rm = TRUE),
            fBodyAccJerkMagStd = mean(fBodyAccJerkMagStd, na.rm = TRUE),
            fBodyGyroMagMean = mean(fBodyGyroMagMean, na.rm = TRUE),
            fBodyGyroMagStd = mean(fBodyGyroMagStd, na.rm = TRUE),
            fBodyGyroJerkMagMean = mean(fBodyGyroJerkMagMean, na.rm = TRUE),
            fBodyGyroJerkMagStd = mean(fBodyGyroJerkMagStd, na.rm = TRUE),
            tBodyAccMeanX = mean(tBodyAccMeanX, na.rm = TRUE),
            tBodyAccMeanX = mean(tBodyAccMeanX, na.rm = TRUE))
  
  
  #This represents the output table with the resultant table
  subjectactivityavgtable
  
  
  
  
}