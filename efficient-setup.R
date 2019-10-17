## https://csgillespie.github.io/efficientR/set-up.html
## https://r4ds.had.co.nz/
## http://adv-r.had.co.nz/
## https://bookdown.org/yihui/blogdown/
## https://www.datascienceatthecommandline.com/



## check and install the latest R version
installr::updateR() 

## batch install packages
pkgs = c("raster", "leaflet", "rgeos") # package names
install.packages(pkgs)

## batch load packages
pkgs = c("raster", "leaflet", "rgeos") # package names
inst = lapply(pkgs, library, character.only = TRUE) # load them

## batch update packages
update.packages(ask = FALSE) # update installed CRAN packages

## editing .Rprofile and .Renviron
file.exists("~/.Rprofile") # che if it exists
file.edit("~/.Rprofile") # edit .Rprofile in HOME
file.edit(".Rprofile") # edit project specific .Rprofile

user_renviron = path.expand(file.path("~", ".Renviron"))
file.edit(user_renviron) # open with another text editor if this fails

## file formats
library(rio) ## read many different formats .csv, .feather, .json, .dta, .xls, .xlsx
df = mtcars

# .. native binaries (best)
save(df, file = "mydata.RData") ## write, R native binary for storing multiple objects
load("mydata.RData") # read into df
saveRDS(df, "mydata.Rds") ## write, R native binary for storing a single object
dat = readRDS("mydata.Rds") ## read into dat

# .. CSV
write.csv(df, "mydata.csv") ## write CSV using base package
dat = read.csv("mydata.csv") ## read into dat using base package
dat = data.table::fread("mydata.csv") ## read into dat using data.table package
dat = readr::read_csv("mydata.csv") ## read into dat using readr package

# .. feather
feather::write_feather(df, "mydata.feather") ## 
dat = feather::read_feather("mydata.feather") ##

remotes::install_github('rstudio/pagedown')
install.packages("remotes")

## tibbles
tb = tibble::tibble(df)
tb

## the here package
pkgs = c("here", "tibble", "magrittr") # package names
inst = lapply(pkgs, library, character.only = TRUE) # load them

tb = data.table::fread(here("01_Pubs", "OECD_MSTI", "Data_Raw", "OECD_MSTI_2018_2_RAW_S00.csv")) %>% 
  tibble() ## read data

