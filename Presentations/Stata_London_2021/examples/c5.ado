program define c5, rclass
  version 14
  syntax [anything] 

  //make sure R is accessible to rcall
  //make sure R is at least version 4.1.0
  //make sure rcall is at least version 3.0.3
  //make sure C50 is at least version 0.1.5
  rcall_check C50>=0.1.5 , r(4.1.0) rcall(3.0.3)
  rcall vanilla: hw = "Hello World"
  return add // will pass the objects returned by rcall to the mother environment
end
