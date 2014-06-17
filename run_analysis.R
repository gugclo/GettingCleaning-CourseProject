setwd("/Users/GaryLo/Desktop/Data Science Specialization/Getting and Cleaning Data/Course Project")
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## Download and unzip files if they do not exist in working directory.
if (file.exists("Dataset.zip")&file.exists("UCI HAR Dataset")){
    #skip download and unzip step
}else{
    download.file(url,"Dataset.zip",method="curl")
    unzip("Dataset.zip")    
}

## Read in training and test data.
x_train=read.table("UCI HAR Dataset/train/X_train.txt")
y_train=read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
x_test=read.table("UCI HAR Dataset/test/X_test.txt")
y_test=read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test = read.table("UCI Har Dataset/test/subject_test.txt")

## Name and label data
featureNames = read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
featureNames = featureNames[,2]
names(x_train) = featureNames
names(x_test) = featureNames
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")

## Column bind features(input variables) to labels(output variables)
trainData = cbind(x_train,subject_train,y_train)
testData = cbind(x_test,subject_test,y_test)
names(trainData)[562] = "Subject"
names(trainData)[563] = "ActivityNum"
names(testData)[562] = "Subject"
names(testData)[563] = "ActivityNum"

## Convert y to their factor activity labels (Walking, Walking_Upstairs, etc)
## merge() reorders everything!!!
trainData = merge(trainData,activity_labels,by.x = "ActivityNum", by.y = "V1")
testData = merge(testData,activity_labels,by.x = "ActivityNum", by.y = "V1")

## reordering columns.  renaming activity label
trainData = trainData[c(featureNames,1,563,564)]
testData = testData[c(featureNames,1,563,564)]
names(trainData)[562] = "ActivityNum"
names(testData)[562] = "ActivityNum"
names(trainData)[564] = "Activity"
names(testData)[564] = "Activity"

## Row bind the training and test data.
allData = rbind(trainData,testData)

## Find feature names that contain "-mean()"
featureNames = names(allData)[1:561]
meanMatch = grep("-mean()",x=featureNames,fixed=TRUE)
length(meanMatch)

## Find feature names that contain "-std()"
stdevMatch = grep("-std()",x=featureNames,fixed=TRUE)
length(stdevMatch)

## Create vector of indices for columns to include in final data set.
meanORstdev = c(meanMatch,stdevMatch)
meanORstdev = sort(meanORstdev)

## Check featureNames match names(allData)
sum(featureNames == names(allData)[1:561])

## subset of final data
finalData = allData[,c(meanORstdev,563,564)]
finalData$SubjectActivity = paste(finalData$Subject,"-",finalData$Activity)

## Creating data frame of means for each subject-activity combo from finalData.
subjVector = rep(1:30,each=6)
actVector = rep(activity_labels[,2],times=30)
subjActVector = paste(subjVector,"-",actVector)

df <- data.frame(matrix(ncol = ncol(finalData), nrow = length(subjVector)))
names(df) = c(names(allData)[meanORstdev],"Subject","Activity","SubjectActivity")
df$Subject = subjVector
df$Activity = actVector
df$SubjectActivity = subjActVector

## Populating df with mean values for each of the 66 selected variables.
## df should only have 40 fully populated rows.  There are only 40 combinations
## of Subject-Activity that exist.
for (i in 1:nrow(df)){
    if (nrow(finalData[finalData$SubjectActivity == df$SubjectActivity[i],])==0){
        # no observations with subject-activity combination, SKIP
    }else{
        subset = finalData[finalData$SubjectActivity == df$SubjectActivity[i],]
        for (j in 1:length(meanORstdev)){
            df[i,j]=mean(subset[,j])
        }
    }
}

## Output data frame to a text file.
write.table(df,"df.txt")
write.csv(df,"df2.csv")
