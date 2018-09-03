# Clean_Project_DSSpec
This read me file aims to show what steps have been taken in order to get a final tidy data set and the subsequents requirements embedded to this project.
The data used was extracted from the link provided for the active which contains a .zip file. This file was extracted and used all .txt files related to train and test as seen in this repository.

The first step is to read all the relevant files, each one in a different data frame. (Before doing this, each file was explored using TextWrangler so is easy to understand a little bit the data)

Coding is separated into Test and Train sections, focusing in one of those at the time so it is easy to change names, add new variable and more.

The variable "Activities" was added to each of the numbers of the activities using mutate and ifelse function.

Once each data set for train and test,  independently speaking got "SubjId" + "Activity" + all the other variables, then those two data set were merge using rbind.

It is important to mention that before all the stated before, using the file features.txt the names of each column on the data set was changed from Vn to the real measurement.

From this point the mean and std values is obtained and finally data is "melted" and "dcasted" to obtain the final file as requested. 
