################################################################################
#
#  THIS IS Programming Assignment 2 which is week 3 of the course
#
#  Coursera.org May 2014 Hopkins R Programming class with Roger Peng
#  Fred Schmidt (https://github.com/rosenschmidt) begun 2014-05-17
#  Columbia, Missouri USA fred@rosenschmidt.org
#
################################################################################

## This .R file creates two functions which together,
## operate very much like a C++ class. 

## In R-speak, this first function simply returns a list of functions.
## See bottom of file for some more elaborate description and observations.

## I provide an example of USING this function pair in NOTE 3, 
## at the bottom of this file.


################################################################################

#  makeCacheMatrix (1 of 2 in the pair)

makeCacheMatrix <- function(x = matrix()) {

   ## Returns a list of four functions, and creates two cached variables.
   ## By default, the inverse is set to NULL; if no argument is
   ## supplied, the matrix is set to a 1x1 NA

   # 1a,b First, set the internal cached copy of the inverset to null. 

   xinv <- NULL

   # Afaik, the "x =" in the function definition creates and sets
   # the internally cached copy of the matrix, x


   # the next four actions seem to be analogous to creating 
   # member functions of a class in C++

   # 2a - function to set the internal cache of the matrix to y

   set <- function(y)
     {
      # here we use the <<- operator, not the <- operator as above.
      x    <<- y
      xinv <<- NULL 
     }

   # 2b - function to return the internal cache of the matrix

   get <- function() x



   # 2c - function to "set" the inverse. 

   setinverse <- function(solve) xinv <<- solve
   
   # Here, "solve" is simply a variable name - the fact that it's called
   # "solve" seems to have no meaning whatsoever.


   # 2d - function to get the inverse

   getinverse <- function() xinv


   # 3 - so what gets returned is the four functions in a list,
   # not x or xinv....  magically, x and xinv get stored somewhere
   # inacccessible to a user, who must use the four "member" functions
   # to get or set the matrix and its inverse.

   list( set = set,
         get = get,
         setinverse=setinverse,
         getinverse=getinverse)
}


################################################################################

#   cacheSolve (2 of 2 in the pair)

cacheSolve <- function(x, ...) {

   ## Return a matrix that is the inverse of 'x'
   ## Compute it if it hasn't been yet.

   # note THIS xinv is local to this function, and is not [quite] 
   # the cached one!

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


################################################################################

# NOTES

# NOTE 1: This assigment is not difficult to execute, but is DEEP.
# The function pair seems to create create and use a simple R object,
# namely a list of functions, but these functions seem to have,
# magically, an internal copy of the matrix and its inverse.
# That is what I meant above when I said that, to my mind, it behaves
# like a C++ class - each call to makeCachematrix() creates a function list
# that has its OWN COPY OF A MATRIX and ITS INVERSE.


# NOTE 2: I believe this magic is accomplished due to lexical scoping.
# Each time makeCacheMatrix() is called, x and xinv are referred to,
# which I BELIEVE creates variables of that name within the scope
# of this function, and due to lexical scoping, are unique to the 
# time of creation (call of makeCacheMatrix). Or so I think.

# NOTE 3: EXAMPLE USAGE
#   - execute this R script. e.g. source("cachematrix.R")
#   - a <- makeCacheMatrix(matrix(3,3,rnorm(9))
#   - b <- makeCacheMatrix(matrix(4,4,rnorm(16))
#   - cacheSolve(a)
#   - cacheSolve(b)
# You can now manipulate a and b separately with their set(), for e.g.
#   - eye1 <- round(a$get() %*% a$getinverse(),5)
#   - eye2 <- round(b$get() %*% b$getinverse(),5)
#
 
#####END OF FILE################################################################
