// -------------------------------------------------------------------------
// Documentation written for markdoc package: https://github.com/haghish/markdoc 
// To export STHLP file, RUN THE FOLLOWING COMMAND: 
//     . markdoc missforest.ado, export(sthlp) replace 
// =========================================================================

/***
[Version: 0.0.2](https://github.com/haghish/machinelearning/tags) 
cite: [Haghish, E. F. (2021). rcall for all: machine-learning tutorials for Stata users and developers. 

rcall
=====
seamless interactive __[R](https://cran.r-project.org/)__ in Stata.
The command automatically returns {help return:rclass} R objects with
_integer_, _numeric_, _character_, _logical_, _matrix_, _data.frame_, _list_, and _NULL_
classes to Stata. It also allows passing Stata variable, dataset,
macro, scalar, and matrix to R as well as load a dataframe from R
to Stata automatically,
which provides an automated reciprocal communication between Stata and R. 
in addition to robust automated data communication between Stata and R, __rcall__ also 
includes several modes for integrating R into Stata, including:
1. __interactive__: executing R code within Stata do-file editor (allowing reproducible data analysis practice)
2. __console__: simulating R console within Stata console for interactive exploratory analysis
3. __vanilla__: embedding R base function and R packages within Stata programs defensively
for more information and examples visit [rcall homepage](http://www.haghish.com/packages/Rcall.php) and 
its [GitHub repository](https://github.com/haghish/rcall). note that __rcall__ is only 
hosted on GitHub and must be installed using the [github command](https://github.com/haghish/github).

Syntax
------

under development!
        
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

Visit [machinelearning homepage](https://github.com/haghish/machinelearning) for more examples and
documentation. 

__Feel freevto fork this repository on GitHub and contribute to its development or documentation__. 

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


program define missforest
  version 14
  syntax [anything], [seed(int 2021) maxiter(int 10) ntree(int 100) VARiablewise ///
         mtry(numlist max=1) NOreplacement]
  
  rcall_check missForest>=1.4 , r(4.1.0) rcall(3.0)
  
  // syntax adjustments for R
  // ------------------------
  if !missing("`variablewise'") local variablewise "TRUE"
  else local variablewise "FALSE"
  if "`mtry'" != "" local mtry ", mtry=`mtry'"
  if "`noreplacement'" != "" local noreplacement ", replace=FALSE"
  
  rcall vanilla: df <- st.data();                ///
        set.seed(`seed');                        ///
        require(missForest);                     ///
        imp <- missForest(df,                    ///
                    maxiter = `maxiter',         ///
                    ntree = `ntree',             ///
                    variablewise =`variablewise' ///
                    `mtry'                       ///
                    `noreplacement'              ///
                    );                           ///
        oob <- imp\$OOBerror;                    ///
        if ("`variablewise'" == "TRUE")          ///
           names(oob) <- colnames(imp\$ximp);    ///
        oob <- as.matrix(oob, ncol=1);           ///
        colnames(oob) <- "OOB";                  ///
        df <- imp\$ximp;                         ///
        st.load(df);
        
end

