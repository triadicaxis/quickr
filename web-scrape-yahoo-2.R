#!/usr/bin/Rscript

getData = function(instrument,lookback=365){
  # instrument tells the stock ticker
  # default lookback is 365 days
  
  # Format the start date
  starty = format(Sys.time()-60*60*24*lookback,"%Y")
  startm = format(Sys.time()-60*60*24*lookback,"%m")
  startd = format(Sys.time()-60*60*24*lookback,"%d")
  
  # Format the stop date
  endy = format(Sys.time(),"%Y")
  endm = format(Sys.time(),"%m")
  endd = format(Sys.time(),"%d")
  
  # Create a url. Using Y! Finance here
  # You can use any site which offers this data
  url = paste("http://ichart.finance.yahoo.com/table.csv?s=",
              instrument,"&a=",
              startm,"&b=",
              startd,"&c=",
              starty,"&d=",
              endm,"&e=",
              endd,"&f=",
              endy,"&g=d&ignore=.csv",
              sep="")
  
  # The destination file to write out this data
  # Use the pid of the process
  # Its a simple way to get uniqueness
  destfile = paste("out.txt.",Sys.getpid())
  print(url)
  cat("Fetching data from Y! Finance for ",
      instrument," Ranging ",
      starty,startm," -> ",
      endy,endm,"\n")
  
  # Fetch that data
  status = download.file(url,destfile,method="auto",quiet=TRUE,cacheOK=FALSE)
  if(status != 0){
    # Some error. Stop!
    unlink(destfile)
    stop(paste("Download error, status ",status))
  }
  nlines = length(count.fields(destfile,sep="\n"))
  if(nlines == 1){
    # Site didn't return data
    unlink(destfile)
    stop(paste("No data available for",instrument))
  }
  # Read the data in as a table
  data = read.table(file=destfile,sep=",",header=T,as.is=T)
  # Delete the temporary file
  unlink(destfile)
  # Return the data
  data
}

argv = commandArgs(trailingOnly=T)
if(length(argv) != 1){
  cat("Usage: this-file.r \n")
  q()
}

# Get 60 days look back data
x = getData(argv[1],60)

# Check to see if its there
head(x)