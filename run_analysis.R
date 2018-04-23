
########################################################################
###Merges the training and the test sets 
###to create one data set.

#change to working directory
setwd("C:/Users/anne/Desktop/DataScienceFiles/UCI HAR Dataset")

#Read from train, test and subject tabeles
x_train <- read.table('./train/x_train.txt',header=FALSE)
y_train <- read.table('./train/y_train.txt',header=FALSE)
subject_train <- read.table('./train/subject_train.txt',header=FALSE)

x_test <- read.table('./test/x_test.txt',header=FALSE)
y_test <- read.table('./test/y_test.txt',header=FALSE)
subject_test <- read.table('./test/subject_test.txt',header=FALSE)

#Combine data
x_DS <- rbind(x_train, x_test)
y_DS <- rbind(y_train, y_test)
subject_DS <- rbind(subject_train, subject_test)


##########################################################################
###Extracts only the measurements on the mean and 
###standard deviation for each measurement.

x_DS_mean_std <- x_DS[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(x_DS_mean_std) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 

########################################################################
###Uses descriptive activity names to name 
###the activities in the data set
y_DS[, 1] <- read.table("activity_labels.txt")[y_DS[, 1], 2]
names(y_DS) <- "Activity"


##########################################################################
###Appropriately label the data set with descriptive activity names.
names(subject_DS) <- "Subject"

Merge_DS <- cbind(subject_DS,y_DS,x_DS_mean_std)

# Defining descriptive names for all variables.

names(Merge_DS) <- make.names(names(Merge_DS))
names(Merge_DS) <- gsub('Acc',"Acceleration",names(Merge_DS))
names(Merge_DS) <- gsub('GyroJerk',"AngularAcceleration",names(Merge_DS))
names(Merge_DS) <- gsub('Gyro',"AngularSpeed",names(Merge_DS))
names(Merge_DS) <- gsub('Mag',"Magnitude",names(Merge_DS))
names(Merge_DS) <- gsub('^t',"TimeDomain.",names(Merge_DS))
names(Merge_DS) <- gsub('^f',"FrequencyDomain.",names(Merge_DS))
names(Merge_DS) <- gsub('\\.mean',".Mean",names(Merge_DS))
names(Merge_DS) <- gsub('\\.std',".StandardDeviation",names(Merge_DS))
names(Merge_DS) <- gsub('Freq\\.',"Frequency.",names(Merge_DS))
names(Merge_DS) <- gsub('Freq$',"Frequency",names(Merge_DS))


#########################################################################
###From the data set in step 4, creates a second, 
###independent tidy data set with the average of 
###each variable for each activity and each subject.

Tidy_DS<-aggregate(. ~Subject + Activity, Merge_DS, mean)
Tidy_DS<-Tidy_DS[order(Tidy_DS$Subject,Tidy_DS$Activity),]
write.table(Tidy_DS, file = "tidydata.txt",row.name=FALSE)

