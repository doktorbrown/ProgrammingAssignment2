## Takes a matrix and caches it as a list object that can have the
##get and getinverse methods applied when called from another function

makeCacheMatrix <- function(x = matrix()) {
    #reset m to NULL (to clear cruft?)
    m <- NULL
    #caches the object x into object y and

    m <- x
    #method to return original matrix
    get <- function() m

    #return result of getinverse
    getinverse <- function() 1/m

    #list of methods available to objects inside
    #makeCachMatrix()
    list(get = get, getinverse = getinverse)
}



## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {

    #grab the contents of getinverse method
    #in makeCacheMatrixto in case object already exists
    m<-x$getinverse()
    #test to see if computed inverse does not already exist
    if(!is.null(m)) { #if inverse = FALSE then continue to pass it to "m"
        message("getting the cached data")#inform user of cached data
        return(m)#finished so return m
    }
    #it wasn't cached so get it from makeCacheMatrix get method and invert
    data <- x$get()  #return the orignal matrix
    m <- 1/data  #invert the matrix
    m  #return m
}


##following was used to test
##uncomment to test
# x <- matrix(1:36,9,6)
# a <- makeCacheMatrix(x)
# a$get()
# a$getinverse()
# cacheSolve(a)

