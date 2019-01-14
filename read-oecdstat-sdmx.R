# install.packages("rsdmx")
library(rsdmx)

link <- "https://stats.oecd.org/restsdmx/sdmx.ashx/GetData/STIO_2016/AUS+OECD/all?startTime=2006&endTime=2016"
df <- as.data.frame(readSDMX(link))
View(df)

