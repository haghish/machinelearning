cap prog drop c5
program define c5
  version 14
  syntax [anything] , [seed(numlist max=1)] 
  if "`seed'" == "" local seed 2021
  rcall vanilla: df <- st.data(); ///
        set.seed(`seed');
        
end


c5
