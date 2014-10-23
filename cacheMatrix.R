getinv <- function() inv <- NULL #makes the inverse null by default
makeCacheMatrix <- function(solve) inv <<- solve #sets the inverse to the solved matrix x

## This function computes the inv of the special "matrix" returned by makeCacheMatrix above. If the inv has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inv from the cache.

cacheSolve <- function(x, ...) {
   if(exists("inv")==FALSE){ 
      inv <- getinv()
   } ## checks to see if inv already exists, if not makes it null
   if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
   } ## if it does exist and it's not null, it will retrieve it from memory
   else {
      inv <- solve(x) 
      makeCacheMatrix(inv) #if it doesn't exist, it will solve for the inverse and cache it
      inv}
}


##Uncomment the single-hashed lines below to test the funcions.

#test <- matrix(1:4, nrow=2, ncol=2)
#cacheSolve(test) ##The first time the function runs, it does not print the "getting cached data" message
#cacheSolve(test) ##The second time the function runs, it prints the "getting cached data" message, because the inverse has already been calculated and cached