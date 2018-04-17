## create some files in the working directory
file.create(c("mytext.txt", "mypic.png", "mydata.csv", "myscript.R"))

## concatenate filepath
path <- paste(getwd(), "/New Folder", sep="")

## create new directory
dir.create(path, showWarnings = FALSE, recursive = FALSE)

## method 1. cut and paste files across
myfiles <- list.files(pattern = "my", full.names = TRUE) # "my" is just the common pattern for all the files I created
file.copy(from=myfiles, to="New Folder", recursive = FALSE, copy.mode = TRUE)
# file.remove(myfiles) # if you want to delete the files from the original location