run_analysis<- function(){
  features <- read.table("features.txt", header = FALSE,col.name = c("id","operation"))
  names <- as.character(features$operation)
  xtrain <- read.table("X_train.txt", header = FALSE, col.name = names)
  xtest <- read.table("X_test.txt", header = FALSE, col.name = names)
  k <- numeric()
  for(i in 1:561){
    if(grepl("mean",name[i])|grepl("Mean",name[i])|grepl("std",name[i])){
      k = c(k,i)
    }
  }
  xtotal <- rbind(xtrain,xtest)[,k]
  ytrain <- read.table("y_train.txt", header = FALSE,col.name = c("activity"))
  ytest <- read.table("y_test.txt", header = FALSE,col.name = c("activity"))
  x<-rbind(ytrain,ytest)
  for( i in 1:10299){
    if(x[i,1]== 1){
      x[i,1] = "WALKING"
    }else{
      if(x[i,1] == 2){
        x[i,1] = "WALKING_UPSTAIRS"
      }else{
        if(x[i,1] ==3){
          x[i,1] = "WALKING_DOWNSTAIRS"
        }else{
          if(x[i,1] == 4){
            x[i,1] = "SITTING"
          }else{
            if(x[i,1] == 5){
              x[i,1] = "STANDING"
            }else{
              if(x[i,1] == 6){
                x[i,1] = "LAYING"
              }
            }
          }
        }
      }
    }
  }
  xalmost <- cbind(x, xtotal)
  tidy <- aggregate(xalmost[,2:87],by=list(as.factor(xalmost$activity)),mean)
  tidy
}
