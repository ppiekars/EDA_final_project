---
title: "ETA final project - README"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

run_analysis.R script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.

From such prepared data set, it creates a second, independent tidy data set with the average of each variable for each activity and each subject (tidy_data.txt)

There is also a codebook attached.