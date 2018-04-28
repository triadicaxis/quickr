## choose files:
file.choose() ## to browse for a file

## get and set working directory:
getwd()
setwd()
setwd(getwd()) ## set the working directory to current

## list files:
list.files() ## list all files and folders in the working directory, simple version
list.files(recursive = TRUE) ## lists files only, not directories

## create and delete directories:
dir.create("MyFolder", showWarnings = TRUE, recursive = FALSE) ## create a folder in the working directory
file.exists("MyFolder") ## check if the folder exists in the working directory
unlink("MyFolder", recursive = TRUE) ## delete a folder and its contents in the working directory

## file creation and manipulation from within the current working directory:
file.create(c("mytext.txt", "mypic.png", "mydata.csv", "myscript.R")) ## create various new files
file.exists("myscript.R") ## to check if a file with that name exists
file.rename(from="mytext.txt", to="mytext_2.txt") ## to rename a file
file.copy(from="mydata.csv", to="mydata_2.csv") ## to copy a file to another file
file.remove("mydata_2.csv") ## to delete a file

## recursive: should the listing also go into nested directories?
list.files(path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE) ## list all files in working directory
dir(path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE) ## alternatively

## example 1: delete all files with the pattern "old" in file name
myfiles <- list.files(pattern = "old") ## with regular expressions
do.call(file.remove,list(myfiles))

## example 1: delete all .csv files
myfiles <- list.files(pattern = "\\.csv$") ## the \\ means literally ".csv", and the $ is the escape from using a literal expression
do.call(file.remove,list(myfiles))

## example 3: delete all files in the current working directory
myfiles <- list.files(pattern = ".") ## the . means "all objects" in regular expressions, that's why we had to use the \\ and $ in previous example
do.call(file.remove,list(myfiles))

## copy and paste file from one directory to another, create subdir if it doesn't exist.
## if file is already in subdir, don't do anything

fun1 <- function(from, to) {
  todir <- dirname(to)
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  file.copy(from = from,  to = to)
}

fun1(from = "C:/Users/black/Desktop/MainDir/test.txt", 
     to = "C:/Users/black/Desktop/MainDir/SubDir/test.txt")

## compare the two files
all.equal(readLines("C:/Users/black/Desktop/MainDir/test.txt"), 
          readLines("C:/Users/black/Desktop/MainDir/SubDir/test.txt"))

## compare the two files ALTERNATIVE
library(tools)
identical(md5sum("C:/Users/black/Desktop/MainDir/test.txt"), 
          md5sum("C:/Users/black/Desktop/MainDir/SubDir/test.txt")) 

## compare the two files ALTERNATIVE 2
file.info("C:/Users/black/Desktop/MainDir/test.txt")==file.info("C:/Users/black/Desktop/MainDir/SubDir/test.txt")

## create a folder inside a function
mydata <- data.frame(x=1:10)
analysis <- function(object){
  dir.create(as.character(as.list(match.call())[2]))
}
analysis(mydata) # will create a directory 'mydata' as a subdirectory of the current working directory.

## check existence of directory and create if doesn't exist:

dir.create(file.path(mainDir, subDir)) ## optionally dir.create(file.path(mainDir, subDir), showWarnings = FALSE)
setwd(file.path(mainDir, subDir))

## check existence of directory and create if doesn't exist ALTERNATIVE:

mainDir <- "c:/path/to/main/dir" # in linux try "~/Documents/Dir"
subDir <- "NewFolder"

if (file.exists(subDir)){
    setwd(file.path(mainDir, subDir))
} else {
    dir.create(file.path(mainDir, subDir))
    setwd(file.path(mainDir, subDir))
}

## more file manipulation functions
## https://stat.ethz.ch/R-manual/R-devel/library/base/html/files.html

file.create(..., showWarnings = TRUE)
file.exists(...)
file.remove(...)
file.rename(from, to)
file.append(file1, file2)
file.copy(from, to, overwrite = recursive, recursive = FALSE, copy.mode = TRUE, copy.date = FALSE)
file.symlink(from, to)
file.link(from, to)

file permissions:
## http://astrostatistics.psu.edu/su07/R/html/base/html/files.html
## https://stat.ethz.ch/R-manual/R-devel/library/base/html/files2.html
