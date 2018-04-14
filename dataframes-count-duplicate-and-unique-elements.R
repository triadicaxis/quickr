## example 1.
## count duplicate elements using table(), returns a list with two columns: Var and Freq
dfCountries <- data.frame(table(unlist(dat$Country)))
dfIndicators <- data.frame(table(unlist(dat$Var)))
dfIndustries <- data.frame(table(unlist(dat$Code)))

## example 2.
## count the number of unique elements. Mimick table() above.
dfAll <- data.frame(names(dat)[2:5],
                    c(length(unique(dat$Country)),
                      length(unique(dat$Var)),
                      length(unique(dat$Code)),
                      length(unique(dat$Year))))
names(dfAll) <- c("Variable:", "Frequency:")