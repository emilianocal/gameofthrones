##### Game of Thrones Figures


## Figure 1  gender vs time onscreen

library(ggplot2)       ## load in ggplot
library(wesanderson)   ## load in wes anderson for pretty colors
library(tidyverse)     ## load in tidyverse

got <- read.csv("GameOfThrones.csv") %>%  #rename to got
  mutate(across(where(is.character), tolower))

View(got)


got %>% filter(time.hrs > -1) %>%
  ggplot(aes(x = gender, y = time.hrs, fill = gender)) +
  geom_boxplot() +
  labs(title="Screentime vs Gender",x="Gender", y = "Screentime") +
  guides(fill="none")
  
  
got$group <- cut(got$died,
                 breaks = c(-Inf, 0, Inf),
                 labels = c("Survived", "Died"))

got %>% filter(time.hrs > -1) %>%
  ggplot(aes(x = factor(group), y = time.hrs, fill = group)) +
  geom_boxplot() +
  labs(title="Screentime vs Death",x="Did the character die?", y = "Screentime") +
  guides(fill="none")
