// Missing Data Imputation with Random Forest

*cap prog drop missforest
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

/*
webuse mheart5 
missforest, variablewise
return list
matrix list r(oob)
*/
