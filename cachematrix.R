## Coursera May 2014 Hopkins R Programming class with Roger Peng
## Fred Schmidt (https://github.com/rosenschmidt) begun 2014-05-17
## THIS IS Programming Assignment 2 which is week 3 of the course


## I believe week 3 is mostly about manipulating items without loops,
## e.g. apply, lapply, tapply, etc but something about the descriptions
## given in the assignment make me think we'll use some quirk of
## lexical scoping when we're doing some kind of iterative optimization
## to computationally find the inverse of a matrix. We shall see.
## But first, does my commit work at all?

## This function creates a special "matrix object that can
## cache its inverse. I have no idea yet what this means;
## I'm just editing the R file to make sure I know how to work
## github's commit

makeCacheMatrix <- function(x = matrix()) {

}


## This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed),
## then cacheSolve should retrieve the inverse from the cache.
## As of this writing, I have no idea what all that means; mostly
## I'm just testing whether I understand the github commit
## and have both a local repository and am pushing this up to
## my github.com repository, rosenschmidt/ProgrammingAssignment2

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

}
