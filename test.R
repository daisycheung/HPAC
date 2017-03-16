#library(gputools)
#library(gmatrix)
#library(gpuR)
require(Matrix)

runs<-3

for(i in seq(1:7)) {
     ORDER = 256*(2^i)
    Rprof()
     A = matrix(rnorm(ORDER^2), nrow=ORDER)
     B = matrix(rnorm(ORDER^2), nrow=ORDER)
#     gpuA = gpuMatrix(A, type="double")
#     gpuB = gpuMatrix(B, type="double")
#    A = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
#    B = gmatrix(rnorm(ORDER^2),ORDER,ORDER)
#    C=gmatrix(0,ORDER,ORDER)
   Rprof(NULL)
  cumulate<-0
  for(j in 1:runs) {
    Rprof(append=TRUE) 
    # cputime <- system.time({C = gpuMatMult(A, B)})[3]
 #   cputime <- system.time({gmm(A,B,C)})[3]
#     cputime <- system.time({gpuC = gpuA %*% gpuB})[3]
     cputime <- system.time({C = A %*% B})[3]
   Rprof(NULL)
     cumulate<-cumulate+cputime
  }
  cputime<-cumulate/runs
  cat("Size: ",ORDER,"Elapsed Time: ",cputime,"\n")
} 
