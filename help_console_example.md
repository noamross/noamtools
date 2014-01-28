% Printing R help files in the console or in knitr documents
% Noam Ross
% 13-06-18 10:57:22


Yesterday, I was creating a `knitr` document based on a script, and was looking
for a way to include content from an R help file.  The script,
which was a teaching document, had a `help()` command for when the author wanted
to refer readers to R documentation.  I wanted that text in my final document,
though.

There's no standard way to do this in R, but with some help from
[Stack Overflow](http://stackoverflow.com/questions/7493843/how-to-write-contents-of-help-to-a-file-from-within-r)
and [Scott Chamberlain](https://gist.github.com/SChamberlain/5801605), I figured
out I needed some functions hidden in the depths of the `tools` package.  So I
wrote this function:

    help_console <- function(topic, format=c("text", "html", "latex", "Rd"),
                             lines=NULL, before=NULL, after=NULL) {  
      format=match.arg(format)
      if (!is.character(topic)) topic <- deparse(substitute(topic))
      helpfile = utils:::.getHelpFile(help(topic))
    
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

`help_console` prints the help file to the console or lets you assign the help
file text to a character.  Below, I use it to dynamically print the start of
the help file for the `optim()` function as quoted HTML (note that the `knitr` 
chunk has the option `results='asis')`:


```r
help_console(optim, "html", lines = 1:25, before = "<blockquote>", after = "</blockquote>")
```

<blockquote>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title>R: General-purpose Optimization</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="R.css">
</head><body>

<table width="100%" summary="page for optim"><tr><td>optim</td><td align="right">R Documentation</td></tr></table>

<h2>General-purpose Optimization</h2>

<h3>Description</h3>

<p>General-purpose optimization based on Nelder&ndash;Mead, quasi-Newton and
conjugate-gradient algorithms. It includes an option for
box-constrained optimization and simulated annealing.
</p>


<h3>Usage</h3>

<pre>
optim(par, fn, gr = NULL, ...,
      method = c("Nelder-Mead", "BFGS", "CG", "L-BFGS-B", "SANN", "Brent"),
      lower = -Inf, upper = Inf,
      control = list(), hessian = FALSE)
</blockquote>


The function is part of my [`noamtools` package on
GitHub](https://github.com/noamross/noamtools/blob/master/R/help_console.R), 
where I keep various convenience functions.  Enjoy, and fork if you have
improvements!
