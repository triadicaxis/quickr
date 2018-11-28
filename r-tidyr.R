## https://www.youtube.com/watch?v=RbUWwuJeUC8

library(tidyr)

df <- mtcars
df <- rownames_to_column(df, "car_name")

## separate (split a column into two)
separate(df, car_name, c("Make", "Model"), sep = " ") ## ignore warnings

## unite (merge two columns into one)
unite(df, "new_col", c(gear, carb), sep = "/")

## gather (stack data when one variable is in the header)
gather(df, key, value, c(vs, am))

## spread (unstack data to bring one variable to the header)
spread(df, cyl, mpg)
