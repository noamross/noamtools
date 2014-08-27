#'@import yaml stringi
#'
yaml_print = function(obj, paginate = TRUE, nlines=20, number = TRUE) {
  cat("Object '", deparse(substitute(obj)), "' of class: ",
      paste(class(obj), collapse=", "),"\n", sep="")
  yobj=yaml::as.yaml(obj)
  linebreaks = stri_locate_all_fixed(yobj, '\n')[[1]][,1]
  if(!paginate) {
    cat(yobj)
  } else {
    linebreaks = stri_locate_all_fixed(yobj, '\n')[[1]][,1]
    pagebreaks = linebreaks[seq(from=nlines, to=length(linebreaks), by=nlines)]
    pages = substring(yobj, c(1, pagebreaks+1), c(pagebreaks-1, nchar(yobj)))
    for(i in 1:length(pages)) {
      cat(pages[i])
      if(i < length(pages)) {
        input = readline("Press <Enter> for more, or <Esc> to end: ")
        if(nchar(input) == 0) {
          invisible(NULL)
        }
      }
    }
  }
}

#'@export
pp = function(obj) yaml_print(obj)
    