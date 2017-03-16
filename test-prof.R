library(gputools)
#library(gmatrix)
#library(gpuR)
#require(Matrix)

    ORDER = 8192 
    Rprof()
     A = matrix(rnorm(ORDER^2), nrow=ORDER) #gpuR nvblas gputools
     B = matrix(rnorm(ORDER^2), nrow=ORDER) #gpuR nvblas gputools
#     gpuA = gpuMatrix(A, type="double")  #gpuR
#     gpuB = gpuMatrix(B, type="double")  #gpuR
#    A = gmatrix(rnorm(ORDER^2),ORDER,ORDER) #gmatrix
#    B = gmatrix(rnorm(ORDER^2),ORDER,ORDER) #gmatrix
#    C=gmatrix(0,ORDER,ORDER) #gmatrix
   Rprof(NULL)
   Rprof(append=TRUE) 
     cputime <- system.time({C = gpuMatMult(A, B)})[3] #gputools
#    cputime <- system.time({gmm(A,B,C)})[3]  #gmatrix w/o 
 #    cputime <- system.time({gpuC = gpuA %*% gpuB})[3] #gpuR
#     cputime <- system.time({C = A %*% B})[3]  #nvblas
   Rprof(NULL)
#   summaryRprof(filenames="Rprof.out",chunksize=5000,memory=c("none","both","tseries","stats"),index=2,diff=TRUE,exclude=NULL)
  cat("Size: ",ORDER,"Elapsed Time: ",cputime,"\n")
