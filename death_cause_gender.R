library(tidyverse)
library(ggplot2)

#Importing csv file into a dataframe
updated_death_categories <- read.csv("GOT_updated_death_categories.csv")
#View(updated_death_categories)

#making a table of frequency of deaths by various causes by gender.
table_gender_death <-  table(updated_death_categories$gender, updated_death_categories$death_category)
#print(table_gender_death)

#converting the table into a dataframe and adding column names
dtf = as.data.frame(table_gender_death)
names(dtf) = c("Gender", "Death", "Frequency")
#print(dtf)

#making a separate data frame to calculate %female deaths per category.
female_deaths <- filter(dtf, Gender == 'female') 
female_deaths <-  mutate(female_deaths, Percentage = Frequency*100/sum(Frequency))
#print(female_deaths)

#making a separate data frame to calculate %male deaths per category.
male_deaths <- filter(dtf, Gender == 'male') 
male_deaths <-  mutate(male_deaths, Percentage = Frequency*100/sum(Frequency))
#print(male_deaths)

#concatenating the male and female data frames
death_gender <- rbind(female_deaths, male_deaths)
#print(death_gender)

#plot
gender_death_plot <- death_gender |> ggplot(aes(x = Death, y = Percentage)) +
  geom_bar(stat = 'identity', aes(fill = Gender), position = 'dodge') +
  scale_fill_brewer(palette = "Set1") +
  ylim(0, 100)+
  labs(title = "Percentage of male and female characters who died due to various causes")+
  theme_minimal()
  
print(gender_death_plot)
ggsave(gender_death_plot, filename = "death_cause_gender.png")
