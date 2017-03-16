#library(gputools)
library(gmatrix)

     ORDER = 8192 
# Rprof() 
    cputime <- system.time({A = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
    B = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
    C=gmatrix(0,ORDER,ORDER)
    gmm(A,B,C)})[3]
# Rprof(NULL)
  cat("Size: ",ORDER,"Elapsed Time: ",cputime,"\n")
