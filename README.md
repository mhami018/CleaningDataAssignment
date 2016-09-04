# CleaningDataAssignment
The objective of this project is to create a tidy data set from data collected from a samsung phone. 

#Files in the Repository
* Codebook - This discuss the structure and layout of the dataset
* ReadME - the discuss the layout of the files and the R script
* run_analysis.R Script - The is the script to create the tidy data set

#Run_analysis.R Script Rundown
* Read the subject identifer lables table and renamed the column to Subject ID
* Read the traning set labels and changed the first column name activity and made it a factor variable
* Read the data sets for the training data and replaced the columns names to the feature list
* Afterwards, I combined the subject identifer, training labels and dataset into one table
* I also completed the above steps for the test data set as well
* Afterwards, I combined the test and trained data sets
* Subsetted the data for the mean and std values of the required signals
* Renamed the columens to useful names
* Grouped the data by Subject Id and Activity
* Lastly, obtained the mean of each column per subject and Activity
