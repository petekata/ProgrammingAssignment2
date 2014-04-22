# this function takes matrix as argument and returns special marix object
# which is list based, and used by the cache function to compute 
# inverse

makeCacheMatrix <- function(x = matrix()) {
  
  compute_inverse <- NULL
  set_inverse <- function(y){
    compute_inverse <<- y
  }
  get_matrix <- function() x
  
  get_inverse <- function() compute_inverse
  
  list(set_inverse = set_inverse,get_inverse = get_inverse,get_matrix = get_matrix)

}



# returns cached matrix inverse, when spsecial matrix object passed as argument
cacheSolve <- function(x, ...) {
  matrix_inverse <- x$get_inverse()
  if (!is.null(matrix_inverse)){
      message("returning from cache")
      matrix_inverse
  }
  tmp_matrix <- solve(x$get_matrix())
  x$set_inverse(tmp_matrix)
  
  tmp_matrix

}
