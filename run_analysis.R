# Loading Packages 

library(dplyr)
library(readr)

#Data set loading

X_test <- read.table('X_test.txt', header = FALSE)
y_test <- read.table('y_test.txt', header = FALSE) 
X_train <- read.table('X_train.txt', header = FALSE) 
y_train <- read.table('y_train.txt', header = FALSE) 
Subject_train <- read.table('subject_train.txt', header = FALSE) 
Subject_test <- read.table('subject_test.txt', header = FALSE) 

