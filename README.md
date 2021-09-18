Integrating R machine learning algorithms in Stata using rcall 3.0: a tutorial for Stata users and developers
===============

![#f03c15](https://via.placeholder.com/20/FFA500/000000?text=+) __Citation__: 
> Haghish, E. F. (in preparation). Integrating R machine learning algorithms in Stata using rcall 3.0: 
a tutorial for Stata users and developers


If you interested in reading the source code of this package, contributing to this project, or develop your own 
__R__-based Stata packages, I suggest you to read the following articles. These articles provide the background 
to embed __R__ code in __Stata__, write easy-to-read and elegant software documentation, and host your packages
on GitHub. 

![#f03c15](https://via.placeholder.com/10/FFA500/000000?text=+) Haghish, E. F. (2019). [Seamless interactive language interfacing between R and Stata](https://journals.sagepub.com/doi/10.1177/1536867X19830891).  
The Stata Journal. 2019;19(1):61-82.

![#f03c15](https://via.placeholder.com/10/FFA500/000000?text=+) Haghish, E. F. (2020). [Software documentation with markdoc 5.0](https://journals.sagepub.com/doi/full/10.1177/1536867X20931000).  
The Stata Journal. 2020;20(2):336-362.

![#f03c15](https://via.placeholder.com/10/FFA500/000000?text=+) Haghish, E. F. (2020). [Developing, maintaining, and hosting Stata statistical software on GitHub](https://journals.sagepub.com/doi/10.1177/1536867X20976323?icid=int.sj-full-text.similar-articles.1).  
The Stata Journal. 2020;20(4):931-951.

Description
-----------

The `machinelearning` package is a Stata module including several R machine learning (ML) algorithms, implemented in 
Stata using [`rcall`](https://github.com/haghish/rcall) package. The reason for developing this package is twofold:

- Bringing several machine learning R packages to Stata and making them available to the community
- Provide a simplistic tutorial and a real-world example showing how to 
  + embed intricate R code into Stata _Ado programs_ 
  + document Stata _Ado programs_ with Markdown language using [`MarkDoc`](https://github.com/haghish/markdoc) literate programming package 
  + build Stata package using [`MarkDoc`](https://github.com/haghish/markdoc)

Installation
------------

The [__`github package`__](https://github.com/haghish/github) is the only recommended way for installing **`machinelearning`**. Once [__`github`__](https://github.com/haghish/github) is installed, you can install the development version of the package as follows. Currently, the package is _work-in-progress_ 
and there is no stable release yet. 

```js
github install haghish/machinelearning
```

