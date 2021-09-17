{smcl}
{browse "https://github.com/haghish/machinelearning/tags":Version: 0.0.2} 
cite:  {browse "https://github.com/haghish/machinelearning":Haghish, E. F. (2021). rcall for all: machine-learning tutorials for Stata users and developers}


{title:missforest}

{p 4 4 2}
imputing missing data with Random Forest. this command utilizes the 
{bf:missForest} package from {bf:R} and embeds it in a {bf:Stata} program
using  {browse "https://github.com/haghish/rcall":{bf:rcall}} package (Haghish, 2019). 
The {bf:missforest} is a powerful command for {bf:EASILY} imputing missing 
data. 

{p 4 4 2}
more importantly, the command is also meant to be a tutorial for Stata developers, 
showing how to embed {bf:R} into {bf:Stata} and how to document {bf:Stata} packages 
with {it:Markdown} language, using  {browse "https://github.com/haghish/markdoc":markdoc package} 
package.  {browse "https://github.com/haghish/machinelearning":visit the project on github and have a look at the source code}! 

{p 4 4 2}
{bf:Join the Resistance!} Fork this  {browse "https://github.com/haghish/machinelearning":repository} on GitHub and contribute to its development or documentation. 


{title:Syntax}

{p 4 4 2}
The Syntax is under development!


{title:Description}

{p 4 4 2}
{bf: {browse "https://cran.r-project.org/web/packages/missForest/missForest.pdf":missforest}} is a free 
and open-source R package for missing data imputation with Random Forest.
The current Stata program embeds this package in a {bf:Stata} program using {bf:rcall} package
(See Haghish, E. F. (2019)  {browse "https://journals.sagepub.com/doi/10.1177/1536867X19830891":Seamless interactive language interfacing between R and Stata}).

{p 4 4 2}
The {bf:missforest} Stata program not only meant to provide the capabilities of Random Forest missing data imputation 
for Stata users, but also meant to be an example programs for developing Stata packages with {bf:R} and {bf:rcall}. 
In addition, {bf:the documentation of the package is written with  {browse "https://github.com/haghish/markdoc":markdoc package}} 
(See Haghish, E. F. (2019)  {browse "https://journals.sagepub.com/doi/full/10.1177/1536867X20931000":Software documentation with markdoc 5.0}) using
the minimalistic {it:Markdown} language, which also can serve as a tutorial for the comunity of Stata developers 
how to save time on software documentation and make it friendlies and easier!


{title:Example}

{p 4 4 2}
Here is an example of doing missing data imputation with the {it:variablewise} option,
which provides the OOB error estimation for each imputed variable:

        . webuse mheart5 
        . missforest, variablewise
        . return list
        . matrix list r(oob)


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


