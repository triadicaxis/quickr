## The grep, grepl, regexpr and gregexpr functions are used for searching for matches, while sub and gsub for performing replacement.
data <- data.frame(animal = sample(c("cat","dog","bird", 'doggy','kittycat'), 50, replace = TRUE))
data

## Use pattern matching to keep or discard
ifelse(grepl("dog|cat", data$animal), "keep", "discard")

## The regular expression "dog|cat" tells the regular expression engine to look for 
## either "dog" or "cat", and return the matches for both.

## REMEMBER:
## & means AND, where both must be true
## | means OR, where either one must be true
## && means AND, where if the first is false, the other is automatically ignored (don't use with ifelse!)
## || means OR, where if the first is true, the other is automatically ignored (don't use with ifelse!)
