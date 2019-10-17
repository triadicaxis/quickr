# install.packages("devtools")
# install.packages("readabs")
# devtools::install_github("ianmoran11/tidyABS")

#####################################################################

library(tidyABS) ## Ian Moran
library(readabs) ## Matt Cowgill
library(tidyverse) ## Hadley Wickham

#####################################################################

## Ian's example

df <-
  tidyABS_example("australian-industry.xlsx") %>%
  process_sheet(sheets = "Table_1") %>%
  assemble_table_components()

class(df$value)
#> [1] "character"

unique(df$value[duplicated(df$value)]) %>% head()
#> [1] "482"   "485"   "1005"  "23643" "114"   "104"

df %>% str()

## submitted github issue https://github.com/ianmoran11/tidyABS/issues/13

## more example datasets
tidyABS_example()

df <-
  tidyABS_example("consumer-price-index.xlsx") %>%
  # process_ABS_sheet(sheets = "Table_1") %>%
  assemble_table_components()

#####################################################################

## Matt's example
df <- read_abs("6345.0")
df <- read_abs("5204.0", tables = c("63", "64"))


