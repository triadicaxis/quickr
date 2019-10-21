# Load packages
library(rsdmx)

# Download SDMX Files: stat.data.abs.gov.au -> [select data set] -> [Export] -> [SDMX] -> text from "SDMX DATA URL"
download.file("http://stat.data.abs.gov.au/restsdmx/sdmx.ashx/GetData/ABS_IT_INNOVATION/H0+01+02+03+04+05.9999+PB1+PB2+PB3+PB4.TOTAL+A+B+C+D+E+F+G+H+I+J+K+L+M+N+Q+R+S.0.A.2018/all?",
               "dat0.xml")

# Read in SDMX file
dat1 <- rsdmx::readSDMX(file = "dat0.xml", isURL = FALSE)

# Read in as dataframe
dat2 <- as.data.frame(dat1)

# Print df
View(dat2)