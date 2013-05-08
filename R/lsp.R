#'List all functions in a package
#'@param package Which package to list functions from
#'@param all.names Include hidden functions (starting with ".")? Defaults to
#'\code{FALSE}
#'@param pattern A regex pattern to limit the results
#'@export
lsp <-function(package, all.names = FALSE, pattern)
{
  namesp <- deparse(substitute(package))
  ls(
    name = paste("package", namesp, sep = ":"),
    all.names = all.names,
    pattern = pattern
  )
}

#Some alternatives
#http://yusung.blogspot.com/2007/08/get-invisible-functions-or-internal.html
#lsf.str to get the function calls, as well.
#use ls(asNamespace("package")) to get EVERYTHING available to :::
