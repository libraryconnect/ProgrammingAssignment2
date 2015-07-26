## These two functions calculate the inverse of a matrix and cache the result
## to descrease processing time. 

## makeCachematrix just creates a list that stores the functions and data.
## This has to be run first. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  z <<- list(get = get,
             setsolve = setsolve,
             getsolve = getsolve)
  print("Done")
}


## cacheSolve checks if there is a cached result before calculating a new
## result.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- z$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- z$get()
  m <- solve(data)
  z$setsolve(m)
  m
}