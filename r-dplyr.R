## https://www.youtube.com/watch?v=sVISY_27znA

library(tidyverse)

df <- mtcars
df <- rownames_to_column(df, "car_name")

## 1. filter (gives specific rows)

df %>% filter(mpg > 20) ## single condition
df %>% filter(mpg > 20, cyl == 6) ## &
df %>% filter(mpg > 20 | cyl == 6) ## or

## 2. select (gives specific columns)

df %>% select(car_name, mpg) ## include
df %>% select(-mpg, -carb) ## exclude
df %>% select(cyl, mpg, car_name) ## reorder
df %>% select(cyl, everything()) ## reorder just one column

## 3. arrange (sort data by columns)

df %>% arrange(mpg, car_name) ## by multiple columns
df %>% arrange(desc(mpg)) ## descending

## 4. mutate (add new columns)

df %>% mutate(avg = mean(mpg))
df %>% mutate(avg = mean(mpg), four_cyl = cyl == 4)

## 5. group_by/summarise

df %>% group_by(cyl) %>% summarise(avg_mpg = mean(mpg))
df %>% group_by(cyl) %>% summarise(avg_mpg = mean(mpg), count = n())
