## This function creates a special "matrix" object that can cache its inv.

getinv <- function() inv <- NULL
setinv <- function(solve) inv <<- solve

makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
   set <- function(y) {
      x <<- y
      m <<- NULL
   }
   get <- function() x
   list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}



## This function computes the inv of the special "matrix" returned by makeCacheMatrix above. If the inv has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inv from the cache.


cacheSolve <- function(x, ...) {
   if(exists("inv")==FALSE){ 
      inv <- getinv()
   } ## checks to see if inv already exists
   if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
   } ## if it does exist and it's not null, it will retrieve it from memory
   inv <- solve(x) 
   setinv(inv) #if it doesn't exist, it will solve for the inverse and set the inverse
   inv
}


test <- matrix(1:4, nrow=2, ncol=2)

makeCacheMatrix(test)
cacheSolve(test)
cacheSolve(test)
