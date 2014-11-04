setwd("~/UCI HAR Dataset/test")
SubjectTest <- read.table("subject_test.txt")
Xtest <- read.table("X_test.txt")
Ytest <- read.table("y_test.txt")

setwd("~/UCI HAR Dataset/test/Inertial Signals")
BodyAccXtest <- read.table("body_acc_x_test.txt")
BodyAccYtest <- read.table("body_acc_y_test.txt")
BodyAccZtest <- read.table("body_acc_z_test.txt")
BodyGyroXtest <- read.table("body_gyro_x_test.txt")
BodyGyroYtest <- read.table("body_gyro_y_test.txt")
BodyGyroZtest <- read.table("body_gyro_z_test.txt")
TotalAccXtest <- read.table("total_acc_x_test.txt")
TotalAccYtest <- read.table("total_acc_y_test.txt")
TotalAccZtest <- read.table("total_acc_z_test.txt")

testData <- data.frame(SubjectTest,Ytest,Xtest,BodyAccXtest,BodyAccYtest,BodyAccZtest,BodyGyroXtest,BodyGyroYtest,BodyGyroZtest,TotalAccXtest,TotalAccYtest,TotalAccZtest)   

head(testData)
summary(testData)
str(testData)


setwd("~/UCI HAR Dataset/train")
SubjectTrain <- read.table("subject_train.txt")
Xtrain <- read.table("X_train.txt")
Ytrain <- read.table("y_train.txt")

setwd("~/UCI HAR Dataset/train/Inertial Signals")
BodyAccXtrain <- read.table("body_acc_x_train.txt")
BodyAccYtrain <- read.table("body_acc_y_train.txt")
BodyAccZtrain <- read.table("body_acc_z_train.txt")
BodyGyroXtrain <- read.table("body_gyro_x_train.txt")
BodyGyroYtrain <- read.table("body_gyro_y_train.txt")
BodyGyroZtrain <- read.table("body_gyro_z_train.txt")
TotalAccXtrain <- read.table("total_acc_x_train.txt")
TotalAccYtrain <- read.table("total_acc_y_train.txt")
TotalAccZtrain <- read.table("total_acc_z_train.txt")


trainData <- data.frame(SubjectTrain,Ytrain,Xtrain,BodyAccXtrain,BodyAccYtrain,BodyAccZtrain,BodyGyroXtrain,BodyGyroYtrain,BodyGyroZtrain,TotalAccXtrain,TotalAccYtrain,TotalAccZtrain)   

head(trainData)
summary(trainData)
str(trainData)

FinalData <- rbind(testData,trainData) ##Merges the training and the test sets to create one data set.
## Use rbind and not merge because we want additional rows, not to merge based on a certain column/row
str(FinalData) 

meanData <- vector()
stdData <- vector()
for(i in 1:ncol(FinalData)){
   tempMean <- mean(FinalData[,i],na.rm=T);
   meanData <- append(tempMean, meanData);
   tempStd <- sd(FinalData[,i],na.rm=T);
   stdData <- append(tempStd, stdData);
} ##Extracts only the measurements on the mean and standard deviation for each measurement. 

summary(meanData)
summary(stdData) 

FinalData[,2]<-gsub(1,"WALKING",FinalData[,2])
FinalData[,2]<-gsub(2,"WALKING_UPSTAIRS",FinalData[,2])
FinalData[,2]<-gsub(3,"WALKING_DOWNSTAIRS",FinalData[,2])
FinalData[,2]<-gsub(4,"SITTING",FinalData[,2])
FinalData[,2]<-gsub(5,"STANDING",FinalData[,2])
FinalData[,2]<-gsub(6,"LAYING",FinalData[,2])

FinalData[,2] #Uses descriptive activity names to name the activities in the data set
attach(FinalData)

TidyData <- data.frame()

for(subject in 1:30){  
   row1<- c(subject,"WALKING")
   row2<- c(subject,"WALKING_UPSTAIRS")
   row3<- c(subject,"WALKING_DOWNSTAIRS")
   row4<- c(subject,"SITTING")
   row5<- c(subject,"STANDING")
   row6<- c(subject,"LAYING")
   for(column in 3:ncol(FinalData)){
      mean1 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      mean2 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      mean3 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      mean4 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      mean5 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      mean6 <- mean(FinalData[V1==subject & V1.1=="WALKING",column],na.rm=TRUE)
      row1 <- append(mean1,row1)
      row2 <- append(mean2,row2)
      row3 <- append(mean3,row3)
      row4 <- append(mean4,row4)
      row5 <- append(mean5,row5)
      row6 <- append(mean6,row6)
   }
   TidyData <- rbind(TidyData,row1,row2,row3,row4,row5,row6)
}

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

head(TidyData)
TidyData[1,]

write.table(TidyData,"tidydata.txt",row.name=FALSE)
#?write.table
