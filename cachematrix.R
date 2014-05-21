## Coursera May 2014 Hopkins R Programming class with Roger Peng
## THIS IS Programming Assignment 2 which is week 3 of the course

## Fred Schmidt (https://github.com/rosenschmidt) begun 2014-05-17

## Fred Schmidt Columbia Missouri fred@rosenschmidt.org


## This function creates a special "matrix" object that can
## cache its inverse. It is a function that creates functions, afaik.
## See NOTE below for some more elaborate description and observations.

makeCacheMatrix <- function(x = matrix()) {

   ## returns some kind of object which seems to be a cache of the data,
   ## its inverse, and the list of member-like functions.
   ## the inverse is set to NULL; if no argument is supplied,
   ## the matrix is set to a 1x1 NA


   # set the internal ccached copy of the inverset to null. 

   xinv <- NULL

   # QUESTION: Why only one <- and not <<- ?
   # what is making x and xinv behave equivalently to a C static
   # variable? Well no, experimentation shows x and xinv are uniques
   # to each INSTANCE of makeCacheMatrix....


   # the next four actions seem to be analogous to creating 
   # member functions of a class in C++

   # sets the internal cache of the matrix to y

   set <- function(y)
     {
      # here we use the <<- operator, not the <- operator as above.
      # Why <<- here and <- above?
      x    <<- y
      xinv <<- NULL 
     }

   # returns the internal cache of the matrix

   get <- function() x



   # "sets" the inverse, by which we mean compute it
   # I don't get the syntax here, i.e. exactly how the above works

   setinverse <- function(solve) xinv <<- solve
   
   getinverse <- function() xinv


   # so what gets returned is the four functions, not x or xinv....
   # where do x and xinv get stored?

   list( set = set,
         get = get,
         setinverse=setinverse,
         getinverse=getinverse)
}


# This function computes the inverse of the special "matrix"
# returned by makeCacheMatrix above. If the inverse has already 
# been calculated (and the matrix has not changed),
# then cacheSolve should retrieve the inverse from the cache.
# NOTE in order for the above to be true, you can only change x
# by using the set function....

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

   
   xinv <- x$getinverse()
   if(!is.null(xinv))
     {
      message("getting cached data")
      return(xinv)
     }
   data <- x$get()
   xinv <- solve(data,...)
   x$setinv(xinv)

}

# This assigment is not difficult to execute, but is DEEP.
# The function pair seems to create a new object, which is a matrix 
# but with functions somehow attached to it in some clever way.

# Also, we are using this cached space with absolutely NO EXPLANATION
# from the video lectures. I guess they are expecting us to do some
# independent research at this point. That's a lot, on top of
# the depth and complexity of lapply, tapply, apply, etc.

# ##### END OF FILE ############################################################
