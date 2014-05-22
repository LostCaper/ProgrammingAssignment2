## This series of functions creates and stores an inverse matrix.

## This function returns a list with 4 components.
makecacheMatrix <- function(x = matrix()) {
        inversematrix <- NULL
        set <- function(y) {
                x <<- y
                inversematrix <<- NULL
        }
        get <- function() x
        setinv_matrix <- function(inv_matrix) inversematrix <<- inv_matrix
        getinv_matrix <- function() inversematrix
        list(set = set, get = get,
             setinv_matrix = setinv_matrix,
             getinv_matrix = getinv_matrix)
}



## This function stores the inverse matrix for later recall.
cacheSolve <- function(x, ...) {
        inversematrix <- x$getinv_matrix()
        if(!is.null(inversematrix)) {
                message("getting cached data")
                return(inversematrix)
        }
        data <- x$get()
        inversematrix <- solve(data, ...)
        x$setinv_matrix(inversematrix)
        inversematrix
}

##This tested it to make sure it worked.
out<-makecacheMatrix(matrix(c(2,3,4,5),2))
cacheSolve(out)

