// the 'make.do' file is automatically created by 'github' package.
// execute the code below to generate the package installation files.
// DO NOT FORGET to update the version of the package, if changed!
// for more information visit http://github.com/haghish/github

make machinelearning, replace toc pkg  version(0.0.2)                       ///
     license("MIT")                                                         ///
     author("E. F. Haghish")                                                ///
     email("haghish@uio.no")                                                ///
     url("http://github.com/haghish")                                       ///
     title("seamless R in Stata")                                           ///
     description("Integrating R machine learning algorithms in Stata using rcall 3.0: a tutorial for Stata users and developers") ///
     install("missforest.ado;missforest;")                                  ///
     ancillary("")                                                        
     

/*
Generating the package documentation
====================================

The package documentation is written in Markdown language. The MARKDOC package 
extract these documentation and create the Stata help files as well as Markdown 
documentation for GitHub Wiki. Learn more about MARKDOC here: 
https://github.com/haghish/markdoc

Generating Stata Help Files
---------------------------
*/

// Generate Stata STHLP documentation
// ==================================
markdoc "missforest.ado", export(sthlp) replace 

// Generate the Markdown documentation for GitHub
// ==============================================
markdoc "missforest.ado", mini export(md) replace

// Generate the package Vignette
// =============================
markdoc "vignette.do", export(tex) toc replace master                        ///
        title("Integrating R machine learning algorithms in Stata using rcall 3.0: a tutorial for Stata users and developers") ///
				author("E. F. Haghish")
