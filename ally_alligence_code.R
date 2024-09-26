#Alligence stuff

#packages

library(ggplot2)
library(tidyverse)
library(wesanderson)


got <- read_csv("gameOfThrones.csv") %>%
  mutate(across(where(is.character), tolower))

#need to correct nagatives? or maube just filter out lol

#want to look at if you switch more if lowborn or highborn
got %>% filter(time.hrs > 0) %>%
  ggplot(aes(x = social_status, y = time.hrs)) +
    geom_boxplot() +
    labs(title = "Social Status vs Screentime",
       x = "Social Status",
       y = "Screentime") +
  theme_minimal()
lm(time.hrs ~ social_status, data = got) %>% summary

got$group <- cut(got$allegiance_switched,
                 breaks = c(-Inf, 1, Inf),
                 labels = c(1,2))


got %>% filter(time.hrs > -50) %>%
  ggplot(aes(x = factor(group), y = time.hrs)) +
  geom_boxplot() +
  labs(title = "# of Times Allegiance Switched vs Screentime",
       x = "# of Times Allegiance Switched",
       y = "Screentime") +
  theme_minimal()

lm()

