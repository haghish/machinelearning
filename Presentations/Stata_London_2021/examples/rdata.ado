// Don't use this program at home! This is an example for loading data
//     from R to Stata
// -------------------------------------------------------------------

program define rdata
  version 14
  syntax using/ , [stringsasfactor] 
  confirm file `"`using'"'
  
  //is R recognized by rcall? 
  //what is the minimum required R version 
  rcall_check , rversion(4.1)
  rcall_check ggplot2>=2.1.0 , r(4.1.0) rcall(3.0)

  // should strings be converted as factors?
  if "`stringsasfactor'" != "" local strfactor ", stringsAsFactors=TRUE"
  
  // load the data in a new R session and pass it to Stata
  rcall vanilla: df<-read.csv("`macval(using)'"`strfactor'); st.load(df)
  
  // in case of error, the program will stop and R's or Stata's error is returned
  // otherwise, r(rc) =  0 is returned
  if `r(rc)' == 0 {
		di as txt "(write something here...)"
	}
  
end


cd "/Users/haghish/OneDrive/OSLO21/Presentations/Stata_London_2021/"

//import delimited "credit.csv",  clear
rdata using "./examples/credit.csv", stringsasfactor
