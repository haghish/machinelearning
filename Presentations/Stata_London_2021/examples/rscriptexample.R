# This is a regular R script file
print(dim(df))
correlation = cor(df$price, df$mpg)
mat <- as.matrix(cbind(df$price, df$mpg))  # define a new matrix within R
