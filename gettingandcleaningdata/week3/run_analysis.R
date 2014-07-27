#STEP 1:
#Merges the training and the test sets to create one data set.
#Set working dirctory
#setwd('/Users/hpham/Documents/workspace/R/')
setwd('./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/')

#Read in train data
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#Read in test data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test<- read.table("./test/subject_test.txt")

#Merge training and test data
x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)


#STEP 2:
#Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table('./features.txt')
#Change the names so they can be column names later
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
mean <- grep(".*Mean.*", features[, 2])
std <- grep(".*Std.*", features[, 2])
mean_std <- c(mean, std)
x_merged <- x_merged[,mean_std]


#STEP 3:
#Uses descriptive activity names to name the activities in the data set
activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[y_merged[, 1], 2]
y_merged[, 1] <- activityLabel


#STEP 4:
#Appropriately labels the data set with descriptive variable names.
colnames(x_merged) <- features[c(mean, std),]$V2
names(y_merged) <- "activity"
names(subject_merged) <- "subject"
#Merge everything into 1 data set:
data_merged <- cbind(subject_merged,y_merged,x_merged)


#STEP 5:
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#according to the description, there are 30 subjects and 6 activities. Therefore there are 30*6 rows
columnLen <- dim(data_merged)[2]
result <- matrix(NA, nrow=30*6, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(data_merged)
row <- 1
for(i in 1:30) { #rotate through 30 subjects
  for(j in 1:6) { #rotate through 6 activities
    result[row, 1] <- sort(unique(subject_merged)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == data_merged$subject
    bool2 <- activity[j, 2] == data_merged$activity
    result[row, 3:columnLen] <- colMeans(data_merged[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "tidy_data.txt", sep="\t")
