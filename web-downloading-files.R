# Clear memory and set working directory:
rm(list=ls())
setwd("C:/Users/Owner/Documents/Education/Coursera/2_R_Programming")
getwd()
ls()

# Check if a directory named Lectures exists. If not, create one. And then create any other required directories:
if (!file.exists("Lectures")) {
  dir.create("Lectures")
}

# Download the video lecture for the tutorial:
# See https://class.coursera.org/getdata-012/lecture/9 at 4:30
fileURL1 <- "https://class.coursera.org/rprog-012/lecture/download.mp4?lecture_id=5"

# Download the 
download.file(fileURL1, destfile = "./Lectures/Background_L1.mp4") # See 5:16 that in Windows you don't use method = "curl"
list.files("./Lectures")


Download.Date <- date()
Download.Date