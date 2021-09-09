cd "/Users/haghish/OneDrive/OSLO21/Presentations/Stata_London_2021/"

//import delimited "credit.csv",  clear
rdata using "./examples/credit.csv", stringsasfactor

// the 'default' variable is numeric, we want it to be a factor
describe default
label define default 1 "no" 2 "yes"
label values default default
saveold credit, replace





// load the dataset for the analysis
use credit, clear

// cleaning the R environment
R clear

// pass the data to R
R: credit <- st.data()
R: class(credit\$default) //check that it is a factor

summarize
R: str(credit)

table checking_balance
R: table(credit\$checking_balance)

// the variable of interest is 'default'
table default
R: table(credit\$default)

// prepare the analysis
R: set.seed(123);                         ///
  train_sample <- sample(1000, 900);      ///
  train <- credit[train_sample, ];        ///
  test  <- credit[-train_sample, ]

R: library(C50);                          ///
  model <- C5.0(train[-17], train\$default)
  
R: model
R: summary(model)

R: prediction <- predict(model, test)
R: prediction


   
R: library(gmodels);                                              ///
   print(CrossTable(test\$default, prediction,                    ///  
             prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,  ///
             dnn = c('actual default', 'predicted default')))     


