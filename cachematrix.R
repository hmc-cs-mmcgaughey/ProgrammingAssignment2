## Stores a matrix along with its inverse (if computed)
## so that finding the inverse many times is computationally
## less expensive

## Stores a matrix along with its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  list(set = set, get = get, 
       setmean = setmean,
       getmean = getmean)
}


## Gets the inverse of a matrix x if already computed
## otherwise computes the matrix inverse and stores it
## assumes that x is always invertible
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
