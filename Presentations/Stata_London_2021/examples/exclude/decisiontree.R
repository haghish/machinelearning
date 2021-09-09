# Example – identifying risky bank loans
# the currency is recorded in Deutsche Marks (DM).
#setwd("~/OneDrive/OSLO21/Presentations/Stata_London_2021/examples")
#credit <- read.csv("credit.csv")

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
train_sample <- sample(1000, 900)
credit_train <- credit[train_sample, ]
credit_test  <- credit[-train_sample, ]

library(C50)
credit_model <- C5.0(credit_train[-17], credit_train$default)

credit_pred <- predict(credit_model, credit_test)
library(gmodels)
CrossTable(credit_test$default, credit_pred,                   
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  
             dnn = c('actual default', 'predicted default'))
