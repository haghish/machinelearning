# Example – optimizing the C5 model

setwd("~/OneDrive/OSLO21/Presentations/Stata_London_2021/examples")
credit <- read.csv("credit.csv", stringsAsFactors = TRUE)
credit$default <- as.factor(credit$default)

library(C50)
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
