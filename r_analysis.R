library(plyr)
library(dplyr)

setwd("~/Documents/Softwares/R/UCI HAR Dataset")

# part 1

x_train <- read.table("train/X_train.txt") #reading X_train file
y_train <- read.table("train/y_train.txt") #reading Y_train file
subject_train <- read.table("train/subject_train.txt") #reading subject_train file

#similarly, raeding __test files
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set by row binding train and test data sets one below the other
x_data <- rbind(x_train, x_test)

# similarly, create 'y' data set
y_data <- rbind(y_train, y_test)

# similarly, create 'subject' data set
subject_data <- rbind(subject_train, subject_test)



# part 2

# reading features
features <- read.table("features.txt")

# cleaning columnar data - focus on mean or stud in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns, cleaned above
x_data <- x_data[, mean_and_std_features]

# update columns names 
names(x_data) <- features[mean_and_std_features, 2]



# part 3

# reading activity lavels file
activities <- read.table("activity_labels.txt")

# change the values with appropriate activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# change the column name
names(y_data) <- "activity"



# part 4

# give correct column name
names(subject_data) <- "subject"

# create common data frame by column bind all data
all_data <- cbind(x_data, y_data, subject_data)




# part 5

# using ddply to split, apply and return result in data frame - by subject and activity
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# creating new table with averages
write.table(averages_data, "averages_data.txt", row.name=FALSE)

