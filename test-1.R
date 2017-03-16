#library(gputools)
library(gmatrix)

runs<-3

for(i in seq(1:7)) {
     ORDER = 256*(2^i)
 
#     A = matrix(rnorm(ORDER^2), nrow=ORDER)
#     B = matrix(rnorm(ORDER^2), nrow=ORDER)
#    A = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
#    B = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
#    C=gmatrix(0,ORDER,ORDER)
  cumulate<-0
  for(j in 1:runs) { 
    # cputime <- system.time({C = gpuMatMult(A, B)})[3]
    cputime <- system.time({A = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
    B = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
    C=gmatrix(0,ORDER,ORDER)
    gmm(A,B,C)})[3]
     cumulate<-cumulate+cputime
  }
  cputime<-cumulate/runs
  cat("Size: ",ORDER,"Elapsed Time: ",cputime,"\n")
} 
