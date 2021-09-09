// load the dataset for the analysis
use credit, clear
R clear                   // cleaning the R environment
R script "./examples/decisiontree.R", args(credit<-st.data())
return list


