The function “makeCacheMatrix” creates a special “matrix” object that can cache its inverse. It contains 4 functions: set, get, setmean ,getmean.
(1)get function - returns the vector x stored in the main function.
(2)set function - changes the vector stored in the main function.
(3)setmean and getmean are functions that simply store the value of the input in a variable m into the main function makeVector (setmean) and return it (getmean).
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set= set, get= get,
       setinverse= setinverse,
       getinverse= getinverse)
}
The function “cacheSolve” computes the inverse of the special “matrix” (which is the input of cachemean) returned by makeCacheMatrix.
cacheSolve <- function(x, ...){
  m <- x$getinverse()
  if (!is.null(m)){
    message("getting cache data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
Below is an example 
> a <- diag(7,3)
> a
[,1] [,2] [,3]
[1,]    7    0    0
[2,]    0    7    0
[3,]    0    0    7
> CachedMarix <- makeCacheMatrix(a)
> cacheSolve(CachedMarix)
[,1]      [,2]      [,3]
[1,] 0.1428571 0.0000000 0.0000000
[2,] 0.0000000 0.1428571 0.0000000
[3,] 0.0000000 0.0000000 0.1428571
> 
