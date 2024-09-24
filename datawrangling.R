##### Game of Thrones Figures


## Figure 1  gender vs time onscreen

library(ggplot2)       ## load in ggplot
library(wesanderson)   ## load in wes anderson for pretty colors
library(tidyverse)     ## load in tidyverse

got <- read.csv("GameOfThrones.csv") %>%  #rename to got
  mutate(across(where(is.character), tolower))

View(got)


got %>% filter(time.hrs > -1) %>%
  ggplot(aes(x = gender, y = time.hrs)) +
  theme_classic() 
  
  

