// -------------------------------------------------------------------------
// Documentation written for markdoc package: https://github.com/haghish/markdoc 
// To export STHLP file, RUN THE FOLLOWING COMMAND: 
//     . markdoc knn.ado, export(sthlp) replace 
// =========================================================================

/***
[Version: 0.0.3](https://github.com/haghish/machinelearning/tags) 
cite: [Haghish, E. F. (2021). Integrating R machine learning algorithms in Stata using rcall 3.0](https://github.com/haghish/machinelearning)

Imputing missing data using k-nearest neighbors algorithm (kNN)
===============================================================

The program uses _nearest neighbor averaging_ to impute missing data. 
this command utilizes the __impute.knn__ function from __impute__ R package
(Hastie et. all, 2021) and embeds it in a __Stata__ program
using [__rcall__](https://github.com/haghish/rcall) package (Haghish, 2019). 
The __kNN__ is a powerful and extremely fast imputation method. It is especially 
useful for large datasets, where multiple imputation or Random Forest imputation 
methods are not feasible, due to excessive computational resoures they need.

more importantly, the command is also meant to be a tutorial for Stata developers, 
showing how to embed __R__ into __Stata__ and how to document __Stata__ packages 
with _Markdown_ language, using [markdoc package](https://github.com/haghish/markdoc) 
package. [visit the project on github and have a look at the source code](https://github.com/haghish/machinelearning)! 
to learn more, fork this [repository](https://github.com/haghish/machinelearning) on GitHub, read the source, 
and if you find it interestng, contribute to its development or documentation on GitHub. 

Syntax
------

__knn__ [_varlist_], k(10)  rowmax(real 0.5) colmax(real 0.8)


### Options

the main options are the following:

| Option  | Description                                                                                      |
|---------|--------------------------------------------------------------------------------------------------|
| k       | Number of neighbors to be used in the imputation (default=10)                                    |
| rowmax  | The maximum percent missing data allowed in any row (default 50%, see below)                     |
| colmax  | The maximum percent missing data allowed in any column (default 80%, see below)                  |

For any rows with more than _rowmax_ percentage of missing, the overall mean per 
variable is used for imputation. However, if any variable has more than _colmax_ 
percentage of missing, an error is returned. You may drop these variables or increase 
the _colmax_ percentage. 

Description
===========

under development ... feel free to contribute on GitHub

Installation
------------

The __impute__ R package is hosted on 
[BioConductor](https://bioconductor.org/packages/release/bioc/html/impute.html)
and should not be installed from CRAN. run the following code to install the 
dependencies within Stata

        . rcall: install.packages("BiocManager", repos="http://cran.uk.r-project.org")
        . rcall: BiocManager::install("impute")

Example
-------

Here is an example of doing missing data imputation with the _variablewise_ option,
which provides the OOB error estimation for each imputed variable:

_example 1_

        . webuse mheart5 
        . knn , k(5)

_example 2_ 

		. qui sysuse auto, clear
        . qui replace foreign = . in 1
        . qui replace foreign = . in 15
        . qui replace length = . in 68
        . knn price-foreign

Author
------

__E. F. Haghish__  
Department of Psychology  
University of Oslo  
haghish@uio.no  
[machinelearning homepage](https://github.com/haghish/machinelearning)   
Package Updates on [Twitter](http://www.twitter.com/Haghish)  

- - -

This help file was dynamically produced by {help markdoc:MarkDoc Literate Programming package}
***/


program knn, rclass
  
  version 12
  
  // Syntax processing
  // ------------------------------------------------------------
  syntax [varlist], [seed(int 2021) k(int 10) rowmax(real 0.5) colmax(real 0.8)]

  // make sure that:
  //    1. rcall can use R,rcall version 3.0.7 or higher is installed
  //    2. R version 3.5.0 or higher is installed
  //    3. impute R package version 1.56 or higher is installed
  //    4. readstata13 R package 0.9 or higher is installed
  rcall_check impute>=1.56 readstata13>=0.9, r(3.5.0) rcall(3.0.7)
  
  // Make sure all variables are numeric
  quietly ds `varlist', has(type string)
  if "`r(varlist)'" != "" {
	error 108
  }
  
  quietly keep `varlist'
  
  // drop labels to avoid having them in R as factors
  foreach var of varlist * {
  	label values `var'
  }

  // syntax adjustments for R
  // ------------------------
  rcall vanilla: df <- st.data();                ///
        df <- data.matrix(df);                   ///
        set.seed(`seed');                        ///
        require(impute);                         ///
        imp <- impute.knn(df,                    ///
                    k = `k',                     ///
                    rowmax = `rowmax',           ///
                    colmax =`colmax'             ///
                    );                           ///
        df <- as.data.frame(imp\$data);          ///
        st.load(df)     

end




