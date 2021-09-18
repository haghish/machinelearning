[Version: 0.0.2](https://github.com/haghish/machinelearning/tags) 
cite: [Haghish, E. F. (2021). rcall for all: machine-learning tutorials for Stata users and developers](https://github.com/haghish/machinelearning)

missforest
==========

imputing missing data with Random Forest. this command utilizes the 
__missForest__ package from __R__ and embeds it in a __Stata__ program
using [__rcall__](https://github.com/haghish/rcall) package (Haghish, 2019). 
The __missforest__ is a powerful command for __EASILY__ imputing missing 
data. 

more importantly, the command is also meant to be a tutorial for Stata developers, 
showing how to embed __R__ into __Stata__ and how to document __Stata__ packages 
with _Markdown_ language, using [markdoc package](https://github.com/haghish/markdoc) 
package. [visit the project on github and have a look at the source code](https://github.com/haghish/machinelearning)! 

__Join the Resistance!__ Fork this [repository](https://github.com/haghish/machinelearning) on GitHub and contribute to its development or documentation. 

Syntax
------

The Syntax is under development!
            
Description
===========

__[missforest](https://cran.r-project.org/web/packages/missForest/missForest.pdf)__ is a free 
and open-source R package for missing data imputation with Random Forest.
The current Stata program embeds this package in a __Stata__ program using __rcall__ package
(See Haghish, E. F. (2019) [Seamless interactive language interfacing between R and Stata](https://journals.sagepub.com/doi/10.1177/1536867X19830891)).

The __missforest__ Stata program not only meant to provide the capabilities of Random Forest missing data imputation 
for Stata users, but also meant to be an example programs for developing Stata packages with __R__ and __rcall__. 
In addition, __the documentation of the package is written with [markdoc package](https://github.com/haghish/markdoc)__ 
(See Haghish, E. F. (2019) [Software documentation with markdoc 5.0](https://journals.sagepub.com/doi/full/10.1177/1536867X20931000)) using
the minimalistic _Markdown_ language, which also can serve as a tutorial for the comunity of Stata developers 
how to save time on software documentation and make it friendlies and easier!

Example
-------

Here is an example of doing missing data imputation with the _variablewise_ option,
which provides the OOB error estimation for each imputed variable:

            . webuse mheart5 
            . missforest, variablewise
            . return list
            . matrix list r(oob)

Author
------

__E. F. Haghish__  
Department of Psychology  
University of Oslo  
haghish@uio.no  
[machinelearning homepage](https://github.com/haghish/machinelearning)   
Package Updates on [Twitter](http://www.twitter.com/Haghish)  

- - -

This help file was dynamically produced by MarkDoc Literate Programming package
