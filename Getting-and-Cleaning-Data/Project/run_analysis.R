# Programmed by Jibin Liu
# 2/22/2015

library(reshape2)
#1. Merges the training and the test sets to create one data set.
# Read and merge subjects data.
subject <- rbind(read.table("./test/subject_test.txt"), 
                 read.table("./train/subject_train.txt"))

# Read and merge training and test sets.
dataset <- rbind(read.table("./test/X_test.txt"), 
                 read.table("./train/X_train.txt"))

# Read and merge activities lables.
label <- rbind(read.table("./test/y_test.txt"), 
                   read.table("./train/y_train.txt"))

# Combine merged dataset into one data frame.
df <- cbind(subject, label, dataset)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
featuresColumn <- grep("mean|std", features[[2]]) #extract columns of mean and std.
df2 <- df[, c(1, 2, c(featuresColumn + 2))] #subset df

#3. Uses descriptive activity names to name the activities in the data set.
activityLabel <- read.table("activity_labels.txt")
activityLabel[, 2] <- as.character(activityLabel[, 2])
df2[, 2] <- activityLabel[df2[, 2], 2]

#4. Appropriately labels the data set with descriptive variable names.
names(df2)[c(1, 2)] <- c("subject", "activity")
featuresName <- features[featuresColumn, 2]
names(df2)[3:81] <- as.character(featuresName)

#5. From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

# Melt the data frame to seperate subjects/activities with measurements
df2Melt <- melt(df2, id = c("subject", "activity"),
                measure.vars = names(df2)[3:81])
# Calcualte mean value of each measurements of each activity and each subject.
df3 <- dcast(df2Melt, subject + activity ~ variable, mean)

# Output
write.table(df3, file = "exp_data.txt", row.name = FALSE)
