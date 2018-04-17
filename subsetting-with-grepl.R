# Create a dataframe
df <- data.frame( ABC_1 = runif(3),
                  ABC_2 = runif(3),
                  XYZ_1 = runif(3),
                  XYZ_2 = runif(3))

#      ABC_1     ABC_2     XYZ_1     XYZ_2
#1 0.3792645 0.3614199 0.9793573 0.7139381
#2 0.1313246 0.9746691 0.7276705 0.0126057
#3 0.7282680 0.6518444 0.9531389 0.9673290

#  Use grepl
df[ ,grepl("BC_", names(df))]
#      ABC_1     ABC_2
#1 0.3792645 0.3614199
#2 0.1313246 0.9746691
#3 0.7282680 0.6518444

#  grepl returns logical vector like this which is what we use to subset columns
grepl("ABC", names(df))
#[1]  TRUE  TRUE FALSE FALSE
# To answer the second part, I'd make the subset data.frame and then make a vector that indexes the rows to keep (a logical vector) like this...

set.seed(1)
df <- data.frame( ABC_1 = sample(0:1,3,repl = TRUE),
ABC_2 = sample(0:1,3,repl = TRUE),
XYZ_1 = sample(0:1,3,repl = TRUE),
XYZ_2 = sample(0:1,3,repl = TRUE) )

# We will want to discard the second row because 'all' ABC values are 0:
#  ABC_1 ABC_2 XYZ_1 XYZ_2
#1     0     1     1     0
#2     0     0     1     0
#3     1     1     1     0


df1 <- df[ ,grepl("ABC", names(df))]

ind <- apply(df1, 1, function(x) any(x > 0))

df1[ind, ]
#  ABC_1 ABC_2
#1     0     1
#3     1     1