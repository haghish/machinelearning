# Part 3: Using `rcall` interactively


# Using `rcall` from Stata do-file editor

- R code can be executed within Stata do-file editor
    - `rcall [mode] [:] [R-command]` 
- in `rcall 3.0`, the `mode` argument can be 
    - __vanilla__ for non-interactive session
	- for interactive session, no _mode_ is required
	- the _sync_ mode is removed in `rcall` version 3
- When using `rcall` interactively, __ALWAYS__ start a new R session
    - type: `rcall clear` to start a fresh session

# Example 1
## Loading `credit.csv` dataset from R to Stata


- I can load the dataset with `rcall` as follows

~~~
// load the data in a new R session and pass it to Stata
rcall clear
rcall: df<-read.csv("./examples/credit.csv", stringsAsFactor = TRUE)
rcall: st.load(df)

. table default

----------------------
  default |      Freq.
----------+-----------
        1 |        700
        2 |        300
----------------------
~~~

- I could load the CSV data with Stata, without converting strings to factors:
    - `import delimited "./examples/credit.csv"` 

# Working with the C5 R package

![Preparing the data for C5](./images/c5_1.png)


# Working with the C5 R package

![Preparing the data for C5](./images/c5_2.png)

# Summarizing the training model

    . R: summary(model)

- shows the structure of the decision trees
- shows how much different variables are contributed to the model
- confusion matrix of the training dataset

![Preparing the data for C5](./images/c5_3.png)

# Predicting the test dataset

![Predicting the test dataset](./images/c5_4.png)

![Predicted variable](./images/c5_5.png)


# Producing the confusion matrix

![Predicting the test dataset](./images/c5_7.png)

~~~
              predicted default
actual default no yes
           no  55  10
           yes 22  13

~~~

# Using `rcall` from do-file editor is similar to console mode

![Accessing R session from `rcall` console](./images/continuewithconsole.png)

# Return a particular matrix or table to Stata
![Convert the class of object to Matrix to return it to Stata](./images/returnconfusionmatrix.png)

- - - 

![Access the returned matrix in Stata](./images/printmatrix.png)


# Break a complex R object to a number of simple objects

- Complex objects can be thought of lists
    - might include datasets
	- matrices
	- scalars
	- arrays ... 
- You can unclass or slice a complex object into simple objects
- Simple objects must be recognized by Stata
    - numeric matrices
	- scalars
	- datasets
- Such objects will be returned by `rcall` automatically
- If you want to avoid returning an object, just remove it in the R code!

# Break a complex R object to a number of simple objects

![Viewing the model object](./images/complexobject.png)

# Better, faster, and cleaner workflow?

![creating and R script for the analysis](./images/alternative.png)
![executing it in Stata](./images/alternative_execution.png)
