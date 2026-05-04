library(tidyverse)
install.packages("auk")
library(auk)
install.packages("rebird")
library(rebird)
library(dplyr)
recent<-ebirdregion("US-RI")
#necessay packages

#I had to obtain a key from the eBird website in order to acces the data, and then I had to filter the data for the state 
#RI
recent <- ebirdregion("US-RI", key = "e1ekkpr64q0j")
#Show me a glimpse of the data
head(recent)
#shows me the graph 
view(recent)
#see what file I have loaded
ls()
#see the names of the columns to determine how I filter my data 
names(recent)
library(dplyr)
#I filtered for sightings but because my data is recent nothing came up for this sight
site_data <- recent %>%
  filter(locId == "L735002")
unique(site_data$comName)
#this showed me all of the locations with recent observations 
unique(recent$locId)

library(dplyr)

site_data <- recent %>%
  filter(locId == "L393285")
#confirming data exists for this site and that this site exists in my data set recent
nrow(site_data)
"L393285" %in% recent$locId
#rename
recent_ebird <- recent

unique(site_data$comName)
site_data %>%
  count(comName, sort = TRUE)
library(ggplot2)

ggplot(site_data, aes(x = comName)) +
  geom_bar(fill = "steelblue") +
  labs(x = "Species", y = "Number of Observations",
       title = "Bird Observations at Site L393285") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
site_data$howMany
#only one gray catbird was reported at Lincoln Woods State Park in Providence, this is only
#recent data, and is also not entirely surprising considering the urban environment 
