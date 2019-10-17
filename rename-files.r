#!/usr/bin/env Rscript

rm(list = ls())

home <- "/home/blue/Documents/work/ais"

##########################################################

setwd(home)

## solution: http://r.789695.n4.nabble.com/recursively-rename-dir-and-files-td4705667.html
## solution accepted, user modified it, i just simplified syntax, works nicely!

rename1 <- function(path = ".",
                    old = "\\s|_|,",
                    new = "-",
                    lower = TRUE) {

  f <- list.files(path, full.names = TRUE) ## base case, list files
  
  if (lower) {
    for (i in f)
      file.rename(i, gsub(old, new, tolower(i)))
  } else {
    for (i in f)
      file.rename(i, gsub(old, new, i))
  }
  
  d <- list.dirs(path, full.names = TRUE, recursive = FALSE) ## recursive part, list directories
  
  if (length(d)) {
    for (j in d)
      rename1(j,
              old = old,
              new = new,
              lower = lower)
  }
}

## execute function
rename1() ## first pass
rename1(old = "\\.-|-\\.", new = "-") ## second pass
rename1(old = "--|---", new = "-") ## third pass

##########################################################

#EOF