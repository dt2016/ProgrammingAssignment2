## The two functions makeCacheMatrix() & cacheSolve() - caches the inverse of a matrix
## The functions create a special object to store a matrix and cache its inverse
##Initializes the object, defines function for objects of type makeCacheMatrix()






makeCacheMatrix <- function(x = matrix()) 
{ 

m <- NULL
set <- function(y)
{
x <<- y
m <<- NULL
}
get <- function()x
{
}
setinverse <- function(solve) m <<- solve
getinverse <- function() m 
list( set=set, get=get, setinverse= setinverse, getinverse=getinverse)

}


## This function computes the inverse of the matrix created using the above function : makeCacheMatrix
## If the matrix has not changed, then the inverse is retirved from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m))
{
 message("getting cached data")
}

data <- x$get()
m <- solve(data, ...)

x$setinverse(m)
m
}


## Results of this program 
result <- makeCacheMatrix(matrix(1:4,2,2))
> result$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> result$getinverse()
NULL
> cacheSolve(result)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(result)
getting cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> result$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> result$getinverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
        
