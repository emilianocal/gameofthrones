##### Game of Thrones Figures


## Figure 1

library(ggplot2)       ## load in ggplot
library(wesanderson)   ## load in wes anderson for pretty colors
library(tidyverse)     ## load in tidyverse

got <- read.csv("GameOfThrones.csv") %>%  #rename to got
  mutate(across(where(is.character), tolower))

View(got)


