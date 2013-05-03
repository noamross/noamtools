\name{lso}
\alias{lso}
\title{List objects in the workspace}
\usage{
  lso(..., n = 20)
}
\arguments{
  \item{n}{number of objects to list}

  \item{...}{arguments to pass to \code{.ls.objects}}
}
\description{
  This function lists objects in the workspace in
  decreasing order of size, showing their memory usage and
  length/rows/columns as necessary.  This is the shorthand
  version. \code{.ls.objects} has more options.  This is
  taken from
  \url{http://stackoverflow.com/a/4951004/1757441}.
}

