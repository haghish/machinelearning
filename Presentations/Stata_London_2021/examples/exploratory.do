// load the dataset for the analysis
use credit, clear


R clear                   // cleaning the R environment
R: credit <- st.data()    // pass the data to R
R: class(credit\$default) //check that it is a factor

// prepare the train and test datasetså
R: set.seed(123);                         ///
  train_sample <- sample(1000, 900);      ///
  train <- credit[train_sample, ];        ///
  test  <- credit[-train_sample, ]

  
// load the library and create the model
R: library(C50);                          ///
   model <- C5.0(train[-17], train\$default)
  
R: model




R: summary(model)

R: prediction <- predict(model, test)
R: prediction
R: table(test\$default, prediction,      ///
   dnn = c("actual default", "predicted default"))

// the following does not get returned, because it is of class "table", not "matrix"
R: confusion <- table(test\$default, prediction,    ///
   dnn = c("actual default", "predicted default"))
R: class(confusion)
R: confusion <- as.matrix(unclass(confusion), dnn = NULL)
// the matrix will be returned to Stata
R: confusion
return list


