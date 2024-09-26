library(tidyverse)
library(ggplot2)

#Importing csv file into a dataframe
updated_death_categories <- read.csv("GOT_updated_death_categories.csv")
#View(updated_death_categories)

#making a table of frequency of deaths by various causes by social status.
table_status_death <-  table(updated_death_categories$social_status, updated_death_categories$death_category)

#converting the table into a dataframe and adding column names
dtf1 = as.data.frame(table_status_death)
names(dtf1) = c("Status", "Death", "Frequency")


#making a separate data frame to calculate %high born deaths per category.
high_deaths <- filter(dtf1, Status == 'highborn') 
high_deaths <-  mutate(high_deaths, Percentage = Frequency*100/sum(Frequency))

#making a separate data frame to calculate %low born deaths per category.
low_deaths <- filter(dtf1, Status == 'lowborn') 
low_deaths <-  mutate(low_deaths, Percentage = Frequency*100/sum(Frequency))


#concatenating the high born and low born data frames
death_status <- rbind(high_deaths, low_deaths)
print(death_status)

#plot
status_death_plot <- death_status |> ggplot(aes(x = Death, y = Percentage)) +
  geom_bar(stat = 'identity', aes(fill = Status), position = 'dodge') +
  scale_fill_brewer(palette = "Set1") +
  ylim(0, 100)+
  labs(title = "Percentage of male and female characters who died due to various causes")+
  theme_minimal()

print(status_death_plot)
ggsave(gender_death_plot, filename = "death_cause_status.png")