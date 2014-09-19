source("cachematrix.R")

x <- matrix(c(1,2, 11,12), nrow = 2, ncol = 2)
cmat <- makeCacheMatrix(x)
cacheSolve(cmat)
