# Example – optimizing the C5 model

setwd("~/OneDrive/OSLO21/Presentations/Stata_London_2021/examples")
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)
credit$default <- as.factor(credit$default)

#Quick and dirty (p. 352)
library(caret)
set.seed(300)
m <- train(default ~ ., data = train, method = "C5.0")
p <- predict(m, test)
CrossTable(test$default, p,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))

error_cost <- matrix(c(0, 1, 2, 0), nrow = 2,
                     dimnames = matrix_dimensions)
n <- train(default ~ ., data = train, method = "C5.0", costs = error_cost)
p2 <- predict(n, test)
CrossTable(test$default, p2,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))


# ???
library(C50)
library(caret)

# Building the optimization grid mannualy
# ==============================================================================

# create an object for trainControl()
ctrl <- trainControl(method = "cv", number = 10,
                     selectionFunction = "oneSE")

# create the grid
grid <- expand.grid(.model = "tree",
                    .trials = c(1, 5, 10, 15, 20, 25, 30, 35),
                    .winnow = "FALSE")

set.seed(300)
o <- train(default ~ ., data = train, method = "C5.0",
           metric = "Kappa",
           trControl = ctrl,
           tuneGrid = grid)
p <- predict(o, test)
CrossTable(test$default, p,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))

# Chapter 11: Bagging
# ------------------------------------------------------------------------------
library(ipred)
set.seed(300)
mybag <- bagging(default ~ ., data = credit, nbagg = 25)
bagPred <- predict(mybag, credit)
table(bagPred, credit$default)

# takes 5 minutes, but accuracy was increased up to 80%
set.seed(300)
mybag <- bagging(default ~ ., data = train, nbagg = 10000)
bagPred <- predict(mybag, test)
CrossTable(test$default, bagPred,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))

# using caret package for bagging
library(caret)
set.seed(300)
ctrl <- trainControl(method = "cv", number = 10)
train(default ~ ., data = credit, method = "treebag",
      trControl = ctrl)


# bagged support vector machine model
# ...................................
str(svmBag)
svmBag$fit
ctrl <- trainControl(method = "cv", number = 10)
bagctrl <- bagControl(fit = svmBag$fit,
                      predict = svmBag$pred,
                      aggregate = svmBag$aggregate)
set.seed(300)
svmbag <- train(default ~ ., data = credit, "bag",
                trControl = ctrl, bagControl = bagctrl)
svmbag


# Chapter 11: Boosting
# ------------------------------------------------------------------------------

# boosting with AdaBoost.m1
library(adabag)
set.seed(300)
m_adaboost <- boosting(default ~ ., data = credit)
p_adaboost <- predict(m_adaboost, credit)
head(p_adaboost$class)
p_adaboost$confusion

# a real test... (74% accuracy)
set.seed(300)
m_adaboost <- boosting(default ~ ., data = train, boost=TRUE, mfinal=1000)
p_adaboost <- predict(m_adaboost, test)
p_adaboost$confusion

# this performed better, when all the data was presented (77% accuracy)
set.seed(300)
m_adaboost <- boosting(default ~ ., data = train, boost=FALSE, mfinal=1000)
p_adaboost <- predict(m_adaboost, test)
p_adaboost$confusion


# For a more accurate assessment of performance on unseen data, we need to use another evaluation method
set.seed(300)
adaboost_cv <- boosting.cv(default ~ ., data = credit)
adaboost_cv$confusion
#We can find the kappa statistic using the vcd package as described in Chapter 10
library(vcd)
Kappa(adaboost_cv$confusion)

# this performed extraordinary! let's try it on training data
adaboost_cv <- boosting.cv(default ~ ., data = train)
adaboost_cv$confusion

p_adaboost <- predict(adaboost_cv, test)
p_adaboost$confusion

# Chapter 11: Random Forest
# ------------------------------------------------------------------------------
library(randomForest)
set.seed(300)
rf <- randomForest(default ~ ., data = credit)
rf

# Chapter 11: comparing random forest with C50
# ------------------------------------------------------------------------------
library(caret)
ctrl <- trainControl(method = "repeatedcv",
                     number = 10, repeats = 10)

grid_rf <- expand.grid(.mtry = c(2, 4, 8, 16))
set.seed(300)
m_rf <- train(default ~ ., data = credit, method = "rf",
              metric = "Kappa", trControl = ctrl,
              tuneGrid = grid_rf)

set.seed(300)
grid_c50 <- expand.grid(.model = "tree",
                        .trials = c(10, 20, 30, 40),
                        .winnow = "FALSE")
set.seed(300)
m_c50 <- train(default ~ ., data = credit, method = "C5.0",
               metric = "Kappa", trControl = ctrl,
               tuneGrid = grid_c50)

m_rf
m_c50



