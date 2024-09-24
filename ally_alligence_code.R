#Alligence stuff

#packages

library(ggplot2)
library(tidyverse)
library(wesanderson)


got <- read_csv("gameOfThrones.csv") %>%
  mutate(across(where(is.character), tolower))

#want to look at if you switch more if lowborn or highborn
got %>% filter(time.hrs > 0) %>%
  ggplot(aes(x = social_status, y = time.hrs)) +
    geom_boxplot() +
    labs(title = "Social Status vs Lifespan",
       x = "Social Status",
       y = "Lifespan") +
  theme_minimal()

got %>% filter(time.hrs > -50) %>%
  ggplot(aes(x = gender, y = time.hrs)) +
  geom_boxplot() +
  labs(title = "Social Status vs Lifespan",
       x = "Social Status",
       y = "Lifespan") +
  theme_minimal()

lm()

