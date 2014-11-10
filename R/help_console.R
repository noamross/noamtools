#'Return the text of a help file as a string
#'
#'This function returns the contents of an R help file to the console
#'as a character vector, printing it for easy reading.  It is intended for
#'dynamic documents where you want to show part of a help
#'file in the course of a tutorial. For this usage, you may wish to temporarily
#'assign \code{help_console} to \code{help} using non-printed code chunk.
#'
#'This function uses non-exported functions in the \code{tools} package, so
#'it may not work with future updates.
#'
#'@param topic The help topic, quoted or not
#'@param format the format of the help topic. HTML and latex may be useful when
#'creating documents of this type, in which case the output should be written
#'"as is" rather than in a code or verbatim environment
#'@param lines Optional. An integer vector specifying which lines to print
#'@param before,after Text to insert before or after the help file, such as
#'@param package A character string containing the package name to search. Necessary if two packages share a function name.
#'\code{<quote>} and \code{</quote>} for printing the text as quoted HTML  
#'@export
#'@import tools
#'@examples help_console(c)
#'txt <- help_console(c)
#'help_console(optim, "html", lines=1:25, before="<quote>", after="</quote>")
help_console <- function(topic, format=c("text", "html", "latex", "Rd"),
                         lines=NULL, before=NULL, after=NULL, package = NULL) {  
  format=match.arg(format)
  if (!is.character(topic)) topic <- deparse(substitute(topic))
  helpfile = utils:::.getHelpFile(help(topic, package = (package)))

  hs <- capture.output(switch(format, 
                              text=tools:::Rd2txt(helpfile),
                              html=tools:::Rd2HTML(helpfile),
                              latex=tools:::Rd2latex(helpfile),
                              Rd=tools:::prepare_Rd(helpfile)
                              )
                      )
  if(!is.null(lines)) hs <- hs[lines]
  hs <- c(before, hs, after)
  cat(hs, sep="\n")
  invisible(hs)
}
