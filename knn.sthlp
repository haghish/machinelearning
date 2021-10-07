{smcl}
{browse "https://github.com/haghish/machinelearning/tags":Version: 0.0.3} 
cite:  {browse "https://github.com/haghish/machinelearning":Haghish, E. F. (2021). Integrating R machine learning algorithms in Stata using rcall 3.0}


{title:Imputing missing data using k-nearest neighbors algorithm (kNN)}

{p 4 4 2}
The program uses {it:nearest neighbor averaging} to impute missing data. 
this command utilizes the {bf:impute.knn} function from {bf:impute} R package
(Hastie et. all, 2021) and embeds it in a {bf:Stata} program
using  {browse "https://github.com/haghish/rcall":{bf:rcall}} package (Haghish, 2019). 
The {bf:kNN} is a powerful and extremely fast imputation method. It is especially 
useful for large datasets, where multiple imputation or Random Forest imputation 
methods are not feasible, due to excessive computational resoures they need.

{p 4 4 2}
more importantly, the command is also meant to be a tutorial for Stata developers, 
showing how to embed {bf:R} into {bf:Stata} and how to document {bf:Stata} packages 
with {it:Markdown} language, using  {browse "https://github.com/haghish/markdoc":markdoc package} 
package.  {browse "https://github.com/haghish/machinelearning":visit the project on github and have a look at the source code}! 
to learn more, fork this  {browse "https://github.com/haghish/machinelearning":repository} on GitHub, read the source, 
and if you find it interestng, contribute to its development or documentation on GitHub. 


{title:Syntax}

{p 4 4 2}
{bf:knn} [{it:varlist}], k(10)  rowmax(real 0.5) colmax(real 0.8)


{p 4 4 2}{bf:Options}

{p 4 4 2}
the main options are the following:

{col 5}Option{col 14}Description
{space 4}{hline}
{col 5}k{col 14}Number of neighbors to be used in the imputation (default=10)
{col 5}rowmax{col 14}The maximum percent missing data allowed in any row (default 50%, see below)
{col 5}colmax{col 14}The maximum percent missing data allowed in any column (default 80%, see below)
{space 4}{hline}
{p 4 4 2}
For any rows with more than {it:rowmax} percentage of missing, the overall mean per 
variable is used for imputation. However, if any variable has more than {it:colmax} 
percentage of missing, an error is returned. You may drop these variables or increase 
the {it:colmax} percentage. 


{title:Description}

{p 4 4 2}
under development ... feel free to contribute on GitHub


{title:Installation}

{p 4 4 2}
The {bf:impute} R package is hosted on 
{browse "https://bioconductor.org/packages/release/bioc/html/impute.html":BioConductor}
and should not be installed from CRAN. run the following code to install the 
dependencies within Stata

        . rcall: install.packages("BiocManager", repos="http://cran.uk.r-project.org")
        . rcall: BiocManager::install("impute")


{title:Example}

{p 4 4 2}
Here is an example of doing missing data imputation with {bf:knn}. The imputed
dataset will be loaded in Stata automatically.

{p 4 4 2}
{it:example 1}

        . webuse mheart5 
        . knn , k(5)

{p 4 4 2}
{it:example 2} 

{p 4 4 2}
		. qui sysuse auto, clear
        . qui replace foreign = . in 1
        . qui replace foreign = . in 15
        . qui replace length = . in 68
        . knn price-foreign


{title:Author}

{p 4 4 2}
{bf:E. F. Haghish}    {break}
Department of Psychology    {break}
University of Oslo    {break}
haghish@uio.no    {break}
{browse "https://github.com/haghish/machinelearning":machinelearning homepage}     {break}
Package Updates on  {browse "http://www.twitter.com/Haghish":Twitter}    {break}

{space 4}{hline}

{p 4 4 2}
This help file was dynamically produced by {help markdoc:MarkDoc Literate Programming package}


