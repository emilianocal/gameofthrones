setwd("GOT_assignment/Fork_gameofthrones/")
getwd()

library(tidyverse)
GOT <- read.csv("gameOfThrones.csv")

head(GOT)
View(GOT)

#Data wrangling using the stringr package https://rafalab.dfci.harvard.edu/dsbook-part-1/wrangling/string-processing.html
#We just need to change all the "Male"s and "Female"s to lowercase.

library(stringr)
gender_updated = str_to_lower(GOT$gender)
death_description_updated = str_to_lower(GOT$death_description)
GOT_updated <- GOT |>
  mutate(gender = gender_updated, death_description = death_description_updated)
View(GOT_updated)

#Adding a "not available" to the last row in "death category".
death_categories[207, 8] = "not available"
ncol(death_categories)

write.csv(death_categories, file = "GOT_updated_death_categories.csv")
write.csv(GOT_updated, file = "GOT_updated.csv")


