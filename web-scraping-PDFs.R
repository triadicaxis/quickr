# load packages
library(RCurl)
library(XML)
library(stringr)
library(plyr)


### Scenario: download list of binary files (PDF files)
# now: download PDF files on Maryland legislative district maps from http://planning.maryland.gov/Redistricting/2010/legiDist.shtml

# prepare filenames
url <- "http://planning.maryland.gov/Redistricting/2010/legiDist.shtml"
links <- getHTMLLinks(url)
filenames <- links[str_detect(links, "2010maps/Leg/Districts_")]
filenames_list <- str_extract_all(filenames, "Districts.+pdf")
basename(filenames)

# write download function
downloadPDF <- function(filename, baseurl, folder, handle) {
  dir.create(folder, showWarnings = FALSE)
  fileurl <- str_c(baseurl, filename)
  if (!file.exists(str_c(folder, "/", filename))) {
    pdf_file <- getBinaryURL(fileurl, curl = handle)
    writeBin(pdf_file, str_c(folder, "/", filename))
    Sys.sleep(1)
  }
}

# execute download
handle <- getCurlHandle()
handle <- getCurlHandle(useragent = str_c(R.version$platform, R.version$version.string, sep=", "), httpheader = c(from = "eddie@datacollection.com"))
l_ply(filenames_list, downloadPDF,
      baseurl = "planning.maryland.gov/PDF/Redistricting/2010maps/Leg/",
      folder = "elec12_maryland_maps",
      handle = handle)

# check results
length(list.files("./elec12_maryland_maps"))
list.files("./elec12_maryland_maps")[1:5]

