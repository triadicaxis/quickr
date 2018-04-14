#!/usr/bin/env R

######################################

## clear workspace and set directory

rm(list=ls())
setwd("~/R Quick Code") ## update as needed!!

######################################

## read CSV containing all packages I want

df <- read.table("packages.csv", header=TRUE, sep=",", stringsAsFactors=FALSE, na.strings=c("NA", "", " "))
names(df) <- "package_name"

######################################

## packages I want vs. packages I have

want <- df$package_name
have <- as.vector(installed.packages()[,"Package"])

add <- !(want %in% have)
add <- want[add]

######################################

## install packages I want and don't yet have
install.packages(add)

## create a TXT file with code for the administrator to run
## TBC

######################################

## after installed, update file packages.csv for the new expanded list of installed packages
df.new <- as.data.frame(as.vector(installed.packages()[,"Package"]))
names(df.new) <- "package_name"

## export CSV
setwd("~/R Quick Code") ## update as needed!!
write.table(df.new, "packages.csv", sep=",", row.names=FALSE)
