# Example – identifying risky bank loans
# the currency is recorded in Deutsche Marks (DM).

setwd("~/Documents/GitHub/machinelearning/Presentations/Stata_London_2021/examples/")
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)
credit$default <- as.factor(credit$default)
table(credit$default)
str(credit)
table(credit$checking_balance)
table(credit$savings_balance)
summary(credit$months_loan_duration)
summary(credit$amount)

# prepare the analysis
set.seed(123)
sampled <- sample(1000, 900)
train <- credit[sampled, ]
test  <- credit[-sampled, ]

library(C50)
model <- C5.0(train[-17], train$default)

predict <- predict(model, test)

print(confusion <- table(test$default, predict,
                   dnn = c('actual default', 'predicted default')))

library(gmodels)
CrossTable(test$default, predict,                   
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
             dnn = c('actual default', 'predicted default'))


# Adaptive Boosting (higher sensitivity)
# =========================================================================
(boostedModel <- C5.0(train[-17], train$default, trials = 10))
summary(boostedModel)
predictBoost <- predict(boostedModel, test)
CrossTable(test$default, predictBoost,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))

# Adding cost matrix
# =========================================================================
matrix_dimensions <- list(c("1", "2"), c("1", "2"))
names(matrix_dimensions) <- c("predicted", "actual")
matrix_dimensions

# Suppose we believe that a loan default costs the bank four times as much as a missed opportunity
error_cost <- matrix(c(0, 1, 4, 0), nrow = 2,
                     dimnames = matrix_dimensions)

#  there is no cost assigned when the algorithm classifies a no or yes correctly, 
#  but a false negative has a cost of 4 versus a false positive's cost of 1.
costModel <- C5.0(train[-17], train$default, costs = error_cost)
#summary(costModel)
predictCost <- predict(costModel, test)
CrossTable(test$default, predictCost,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))


# Expanding with boosting and penalty (cost matrix)
# -------------------------------------------------
error_cost <- matrix(c(0, 1, 4, 0), nrow = 2,
                     dimnames = matrix_dimensions)
costModelBoosted <- C5.0(train[-17], train$default, trials = 10, costs = error_cost)
predictCostBoost <- predict(costModelBoosted, test)
CrossTable(test$default, predictCostBoost,                   
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
           dnn = c('actual default', 'predicted default'))


# Using CARET for optimizing the model
# ====================================
library(caret)
ctrl <- trainControl(method = "repeatedcv",
                     number = 10, repeats = 10)

grid_c50 <- expand.grid(.model = "tree",
                        .trials = c(10, 20, 30, 40),
                        .winnow = "FALSE")
set.seed(300)
m_c50 <- train(default ~ ., data = credit, method = "C5.0",
               metric = "Kappa", trControl = ctrl,
               tuneGrid = grid_c50)
m_c50

