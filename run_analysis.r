run_analysis <- function(){
  features <- read.table("features.txt", header = FALSE,col.name = c("id","operation"))
  names <- as.character(features$operation)
  xtrain <- read.table("X_train.txt", header = FALSE, col.name = names)
  xtest <- read.table("X_test.txt", header = FALSE, col.name = names)
  k <- numeric()
  for(i in 1:561){
    if(grepl("mean",names[i])|grepl("Mean",names[i])|grepl("std",names[i])){
      k = c(k,i)
    }
  }
  xtotal <- rbind(xtrain,xtest)[,k]
  ytrain <- read.table("y_train.txt", header = FALSE,col.name = c("activity"))
  ytest <- read.table("y_test.txt", header = FALSE,col.name = c("activity"))
  x<-rbind(ytrain,ytest)
  for( i in 1:10299){
    if(x[i,1]== 1){
      x[i,1] = "WALKING"}else{if(x[i,1] == 2){
x[i,1] = "WALKING_UPSTAIRS"}else{if(x[i,1] ==3){
x[i,1] = "WALKING_DOWNSTAIRS"}else{if(x[i,1] == 4){
x[i,1] = "SITTING"}else{if(x[i,1] == 5){
x[i,1] = "STANDING"}else{if(x[i,1] == 6){
x[i,1] = "LAYING"
}}}}}}}
  subtrain <- read.table("subject_train.txt",header = FALSE, col.name= c("subject"))
  subtest <- read.table("subject_test.txt",header = FALSE, col.name= c("subject"))
  xalmost <- cbind(rbind(subtrain,subtest),x, xtotal)
  tidy <- aggregate(xalmost[,3:87],by=list(xalmost$subject,xalmost$activity),mean)
  tidy <- rename(tidy, subject = Group.1,activity = Group.2) 
  tidy
}
