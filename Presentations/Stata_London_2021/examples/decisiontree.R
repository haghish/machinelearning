# credit object must be defined before execution
# ----------------------------------------------
credit$default <- as.factor(credit$default)

# set seed and define the train and test datasets
set.seed(123)
train_sample <- sample(1000, 900)
train <- credit[train_sample, ]
test  <- credit[-train_sample, ]

library(C50)
model <- C5.0(train[-17], train$default)

prediction <- predict(model, test)
table(test$default, prediction, 
      dnn = c("actual default", "predicted default"))
