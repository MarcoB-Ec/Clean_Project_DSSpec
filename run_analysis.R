# Loading Packages 

library(dplyr)
library(readr)
library(reshape2)

#Data set loading

X_test <- read.table('X_test.txt', header = FALSE)
y_test <- read.table('y_test.txt', header = FALSE) 
X_train <- read.table('X_train.txt', header = FALSE) 
y_train <- read.table('y_train.txt', header = FALSE) 
Subject_train <- read.table('subject_train.txt', header = FALSE) 
Subject_test <- read.table('subject_test.txt', header = FALSE) 
activity <- read.table('activity_labels.txt', header = FALSE )
activity[,2] <- as.character(activity[,2])
features <- read.table('features.txt', header = FALSE )
features[,2] <- as.character(features[,2])

# Naming data variables 
#Test data sets
names(Subject_test) <- c("SubjId")
names(X_test) <- features[,2]
names(y_test) <- c("Act.Numb")

#Train data sets
names(Subject_train) <- c("SubjId")
names(X_train) <- features[,2]
names(y_train) <- c("Act.Numb")

#Adding to activities number a character name

y_test <- mutate(y_test, Activity = ifelse(y_test$Act.Numb == 1, activity[1,2], 
                                ifelse(y_test$Act.Numb == 2, activity[2,2], 
                                       
                                    ifelse(y_test$Act.Numb == 3, activity[3,2], 
                                           
                                          ifelse(y_test$Act.Numb == 4, activity[4,2],
                                                 
                                                ifelse(y_test$Act.Numb == 5, activity[5,2],
                                                       
                                                      ifelse(y_test$Act.Numb == 6, activity[6,2], "")))))))
y_train <- mutate(y_train, Activity = ifelse(y_train$Act.Numb == 1, activity[1,2], 
                                             
                                            ifelse(y_train$Act.Numb == 2, activity[2,2], 
                                                   
                                                   ifelse(y_train$Act.Numb == 3, activity[3,2], 
                                                          
                                                          ifelse(y_train$Act.Numb == 4, activity[4,2],
                                                                 
                                                                 ifelse(y_train$Act.Numb == 5, activity[5,2],
                                                                        
                                                                        ifelse(y_train$Act.Numb == 6, activity[6,2], "")))))))

#Binding Test and Train Data set indepently

#Test
Fin.Test <- cbind(Subject_test, Activity = y_test[,2], X_test)

#Train

Fin.Train <- cbind(Subject_train, Activity = y_train[,2], X_train)

#Binding all together 

Full.Final <- rbind(Fin.Test, Fin.Train)

#Extract mean and standard related variables only
names(Full.Final)

Sort.m.std <- grep(".mean|.std", names(Full.Final))

Sort_ColumsNums <- c(1,2,Sort.m.std)

Final_Mn_Std <- Full.Final[,Sort_ColumsNums]

#Rename variables for a descriptive name

names(Final_Mn_Std) <- gsub('[()-]', '', names(Final_Mn_Std))

#Second data set casted by activity, subject and mean of each variable

Melt.Data <- melt(Final_Mn_Std, id = c("SubjId", "Activity"))

SecDataSet <- dcast(Melt.Data, SubjId + Activity ~ variable, mean )

SecDataSet.Final <- write.table(SecDataSet, file = "Tidy.txt", row.names = FALSE, quote = FALSE)



