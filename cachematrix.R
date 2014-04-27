# Wraps matrix object, and creates additional
#  fields and functions to store inverse value
#  of the matrix
#
# After calling it, you will get a list in response 
#  with the following functions:
#
#  * set() - clear cache, and assign set a new matrix
#  * get() - get current matrix
#  * setinverse(matrix) - set cached value
#  * getinverse() - get cached value
#
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get        <- function() x
  setinverse <- function(solved) inverse <<- solved
  getinverse <- function() inverse
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# The first argument must be an object returned 
#  from `makeCacheMatrix` function.
#
# All other arguments will be passed directly to `solve`
#  function.
# 
# The method tries to return a cache of inversed matrix,
#  if it not successful it will calculate inverse, store result,
#  and return it.
cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()

  if(!is.null(inverse)) {
    message("getting cached data")
    return(m)
  }

  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
}
