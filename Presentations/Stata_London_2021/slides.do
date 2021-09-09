* execute it in the project directory ...

cd "/Users/haghish/Documents/GitHub/machinelearning/Presentations/Stata_London_2021"


* Presentation slides (based on the book's content)
* ==========================================================

qui log using slides, replace
//IMPORT ./sections/011_about.md
//IMPORT ./sections/012_decisiontrees.md
//IMPORT ./sections/012_interactive.md
//IMPORT ./sections/013_noninteractive.md
qui log c


markdoc slides, export(slide) replace                   ///
	title("Integrating R Machine Learning Algorithms in Stata using rcall")  ///
  subtitle("A Tutorial")                                ///
	affiliation("University of Oslo")                     ///
	address("Department of Psychology")                   ///
	author("E. F. Haghish") bcolor(crane)                 ///
	btheme(AnnArbor) bcodesize(footnotesize)              ///
	bwidth(140) bheight(110)
	
