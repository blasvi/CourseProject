# CourseProject
1 - import features, using read.table function, this way its possible to name its columns, in the case named as id and operation
2 - create a character vector from operation column
3 - import both x_train and x_test using read.table function, naming columns with the character vector from (2)
4 - perform a test in the character vector from (2): if in any of its elements the words "mean", "std" or "Mean" are present store
its number on a numeric vector k
5 - create a new variable xtotal, with merged x_train and x_test, only considering the columns that are listed on k, uting rbind function
6 - import both y_train and y_test using read.table function, naming the column "activity", merge both using rbind(same order as 5), creating ytotal
7 - loop trough the vector and substitute numeric values for names as listed on activity_labels
8 - merge   xtotal, and ytotal using cbind
9-compute the mean by factor(activity) using the aggregate function, storing the new data frame on the variable tidy
10 - return tidy;
 FILES USED : features, X_test,X_train, y_test,y_train
