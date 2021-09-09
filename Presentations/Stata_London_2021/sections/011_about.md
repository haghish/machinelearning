# Overview

- Part 1: Introduction
    - Introduction to __`rcall`__ package
    - Why do we need language interfacing?
    - Language interfacing for statistical analysis
	- How does `rcall` work?
	- Interactive vs non-interactive workflows
	- Installing `rcall`
	- `rcall` syntax and arguments 
- Part 2: Decision trees
    - a very brief introduction to decision trees
	- Pros and cons
- Part 3: Using `rcall` interactively
    - Interactive workflow
	- Using decision trees algorithms with `rcall` 
	- covering tips about using `rcall` interactively
- Part 4: using `rcall` for writing Stata packages
    - Examples of embedding R in Stata packages

# References

## Data
- [Statlog (German Credit Data) Data Set](https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data))
- <https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)>
- The dataset is included in the presentation repository 
    - `./examples/credit.csv` 
- data is about identifying risky bank loans, includes 1000 Obs.
- The variable of interest is `default` i.e. loan goes to default:
    - 1 = NO (70%) and 2 = YES (30%)

## Machine learning (ML) examples
- Solely focus on decision trees, using `C5` algorithm
- Machine learning with R, Brett Lantz
- <https://www.packtpub.com/product/machine-learning-with-r-third-edition/9781788295864>

# Notes 

## Download the presentation, code, and data
- <https://github.com/haghish/machinelearning>

## `R` is `rcall`'s abbreviation
- `rcall` command can be abbreviated as `R`
- In this presentation `rcall` and `R` commands are used interchangeably 

## Why teaching `rcall` with machine learning?
- ML models often require follow ups and refining
- The workflow is often _interactive_
    - the dataset is split into __training__ and __test__ datasets
    - the model(s) is developed on a training dataset
	- the model(s) are tested on the test dataset
	- often many models are compared, fine-tuned, and optimized
- They are idea for demonstrating the interactive workflow with `rcall` 	


# Part 1: Introduction to `rcall` package

# Why language interfacing matters?

- Definition
    - facilitate communication between programs written in different languages
	- facilitate sharing objects between programs
	- Interfacing is __different from automation__
	- We can write a script to execute multiple instructions:
	- e.g. Calling MPlus, R, Stata from shell script 
	- Stata supports executing shell script and automation
	- Interfacing typically allows __object communication__
- Popularity
    - Saving resources
	- Avoiding _reinventing the wheel_ 
- Reproducibility
    - There is no statistical software that does everything
	- We might need a different program for a part of the analysis
	- Interfacing helps to keep the analysis in one place

# Language interfacing for statistical analysis


- Interfacing is common in computer sciences
    - e.g. running a Java library within Python
	- e.g. running C++ within an R program to execute a loop  
	- e.g. running MATA within Stata
- Embedding a different language inside a program requires a strict structure
- Statistical analysis is interactive
    - Interfacing for regular data analysis should be seamless
	- We need to be able to integrating different statistical programs for daily use

# How does `rcall` work?

- `rcall` is a general interfacing program to embed R within Stata
- It provides a seamless procedure for using R in Stata
    - Can be used for interactive data analysis within Stata
	- Can also be used for embedding R in Stata programs and packages
- It facilitate object communications between Stata and R
    - dataset 
	- matrices
	- scalars
	- variables
	- macros
- When calling R, the results will be available to Stata as objects 


# `rcall` workflows

![`rcall` modes](./images/rcallmodes.png)


# Interactive vs non-interactive workflows

- In interactive sessions R will preserve all objects existing in the memory
    - consequent commands that are executed in the same environment
	- This is similar to working interactively in Rstudio
	- Desired when R is used interactively for data analysis
- Non-interactive sessions do not have any memory
    - Every command is executed in a new environment
	- After the execution, the environment is removed
	- Restrict the session to a specific computation
	- Desired when R is embedded in Stata programs 


# Installing `rcall` 

- `rcall` is hosted on GitHub. 
- The only recommended installation method is using the __`github`__ package
- First, install the __`github`__ package:

~~~
        net install github, from("https://haghish.github.io/github/")
~~~

- Then install the latest `rcall` stable release  

~~~
        github install haghish/rcall, stable
~~~

- You can alternatively install the latest development version

~~~
        github install haghish/rcall
~~~

- `rcall` required R package will be installed automatically
- The dependencies can also be installed manually within R
- See the `dependency.do` file in the GitHub repo
- To update `rcall`, type: `github update rcall` 

# Syntax

1. `rcall [subcommand]` 
2. `rcall script "filename.R" [, args() vanilla ]` 
3. `rcall [mode] [:] [R-command]` 
    - console
	- interactive
	- non-interactive (vanilla)

# Data communication

- `rcall` offers several functions for passing dataset, variables, matrices, and scalars to R
- datasets can also be loaded from R environment to Stata
- `rcall` returns matrices and scalars automatically from R to Stata

![`rcall` subcommands](./images/functions.png)


# Console mode
- Is useful for casual or exploratory work
- type `rcall` to enter the simulated R environment
- type `end` to exit the simulated environment

![`rcall` modes](./images/example-console.png)

# Console mode
![example of working in console mode](./images/console_example.png)


# Logging R code

![`rcall` history](./images/rhistory.png)



# Subcommands

- Commands for setting up and monitoring R within Stata
![`rcall` subcommands](./images/subcommands.png)


# Script subcommand

- rcall can also source an R script file:
    - `rcall script "filename.R" [, args() vanilla ]` 
- the `args()` can be used to give instructions or define objects in R, prior to sourcing
- e.g. pass dataset, matrices, variables, scalars, and macros to R
- the `script` subcommand is the simplest way for running R within Stata programs
    - In this case, the `vanila` option is recommended

# Example 1

![rscriptexample.R file](./images/rscriptexample.png)


~~~
clear
sysuse auto
rcall script: ./examples/rscriptexample.R  , args(df<-st.data()) vanilla
~~~

# Example 1

![Example of running an R script within Stata](./images/rscriptexample_results.png)



