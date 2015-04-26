# GnCD_Project

Description of how the R script works:

* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Set wd of rstudio as this unzipped folder
* Write the R script (note, the files and the script are in the same directory now)
* Source the script. 
* The output file is generated in the same directory, called averages_data.txt
* Use data <- read.table("averages_data.txt") 

Since we are required to get the average of each variable for each activity and each subject,
and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
