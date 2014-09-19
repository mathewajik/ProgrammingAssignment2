# Since matrix inversion is usually a costly computation, there may be some
# benefit to caching the inverse of a matrix rather than compute it repeatedly.
# The following functions are used to cache the inverse of a matrix.

# This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inverseMatrix) inverse <<- inverseMatrix
    getinverse <- function() inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# This function computes the inverse of the special "matrix" returned by
# makeCacheMatrix above. If the inverse has already been calculated
# (and the matrix has not changed), then the cachesolve retrieves the inverse
# from the cache.
cacheSolve <- function(x, ...) {
    inverseMatrix <- x$getinverse()
    if(!is.null(inverseMatrix)) {
        message("Getting cached data...")
        return(inverseMatrix)
    }
    data <- x$get()
    inverseMatrix <- solve(data)
    x$setinverse(inverseMatrix)
    inverseMatrix
}
