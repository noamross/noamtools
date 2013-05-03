#'List all functions in a package
#'@param package Which package to list functions from
#'@param all.names Include hidden functions (starting with ".")? Defaults to
#'\code{FALSE}
#'@param pattern A regex pattern to limit the results
#'@export
lsp <-function(package, all.names = FALSE, pattern)
{
  package <- deparse(substitute(package))
  ls(
    pos = paste("package", package, sep = ":"),
    all.names = all.names,
    pattern = pattern
  )
}