install.packages(dyplr)
library(dplyr)
## Part 1 & 4
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)[,2];

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subjectId");
testX <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features);
testY <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "activityId");
testData <- cbind(testSubject, testX, testY);

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subjectId")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features)
trainY <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "activityId")
trainData <- cbind(trainSubject, trainX, trainY)

allData <- rbind(testData, trainData)

## Part 2
meanStdData <- allData[, c("subjectId",names(allData %>% select(matches("mean\\.\\.\\.|std\\.\\."))),"activityId")]

## Part 3
activityMeanStdData <- merge(meanStdData, read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityId", "activity")), "activityId")

## Part 5
tidyData = aggregate(activityMeanStdData[,!names(activityMeanStdData) %in% c("activity","activityId","subjectId")], list(activity=activityMeanStdData$activity, subjectId=activityMeanStdData$subjectId),mean)
write.table(tidyData, 'tidyDataSet.txt', row.names=FALSE)
  
