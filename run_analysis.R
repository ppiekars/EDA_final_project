training <- read.table("./data/train/X_train.txt", header = FALSE)
training_y <- read.table("./data/train/y_train.txt", header = FALSE)
training_subject <- read.table("./data/train/subject_train.txt", header = FALSE)


test <- read.table("./data/test/X_test.txt", header = FALSE)
test_y <- read.table("./data/test/y_test.txt", header = FALSE)
test_subject <- read.table("./data/test/subject_test.txt", header = FALSE)

activity_labels <- read.table("./data/activity_labels.txt", header = FALSE)
features <- read.table("./data/features.txt", header = FALSE)


library(dplyr)

data <- bind_rows(training,test)
names(data) <- features$V2

data <- data[ ,grep("mean|std", names(data), value = TRUE)]

data$label_no <- as.numeric(unlist(bind_rows(training_y, test_y)))
data$subject_no <- as.numeric(unlist(bind_rows(training_subject, test_subject)))


data <- left_join(data, activity_labels, by=c("label_no"="V1"))
data <- rename(data, "label_activity" = "V2")

tidy_data <- data %>% group_by(label_activity, subject_no) %>% summarise_all(list(mean))
