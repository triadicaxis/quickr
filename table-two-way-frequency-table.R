require(stats) # for rpois and xtabs

## Example 1: simple frequency distribution
table(rpois(100, 5))


## Example 2: take 2 vectors of categorical vars and construct a two-way frequency table them 
v1 <- state.division
v2 <- state.region

str(v1)
str(v2)

table(v1, v2)


## Example 3: take a dataframe and construct a two-way frequency table from 2 of its categorical vars 
df <- warpbreaks
with(df, table(wool, tension))


## Example 4: simple two-way contingency table
df <- airquality
str(df)

with(df, table(cut(Temp, quantile(Temp)), Month))


## Example 5: 
a <- letters[1:4]
table(a)
table(a, sample(a))                    # dnn is c("a", "")
table(a, sample(a), deparse.level = 0) # dnn is c("", "")
table(a, sample(a), deparse.level = 2) # dnn is c("a", "sample(a)")
