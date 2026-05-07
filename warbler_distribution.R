#load all of the necessary packages
library(rebird)
library(tidyverse)
library(dplyr)
library(ggplot2)

#load my data from eBird using the API key I was given 
Sys.setenv(EBIRD_KEY = "e1ekkpr64q0j")

#now that I have the data I can see which birds have been observed in RI
ri_birds <- ebirdregion("US-RI")

#inspect names and codes to use in data analysis 
names(ri_birds)
dim(ri_birds)
view(ri_birds)

#filtering now for the most common birds in Rhode Island 
ri_birds %>%
  count(comName, sort = TRUE)

##now I want to look at the recent population distribution of warblers##
#filters for any bird with warbler in the common name 
warblers <- ri_birds %>%
  filter(grepl("warbler", comName, ignore.case = TRUE))

#what my filtering yielded 
head(warblers)

#count how many warbler observations there are - 21 in total 
nrow(warblers)

##Time to visualize our data##

#let's make a graph that shows seasonal activiy of warblers 
warblers %>% #we are taking the warbler dataset and piping (passing) it to the next function
  ggplot(aes(x = obsDt)) + #initialize plot
  geom_density(fill = "steelblue", alpha = 0.5) + #creates a smooth curve showing density over time
  labs( #labs controls all of the text on the plot
    title = "Seasonal Spring Activity of Warblers in Rhode Island",
    x = "Date",
    y = "Observation density",
    caption = "Figure 1. Temporal distribution of warbler observations in Rhode Island derived from eBird data. 
    Increased observation density likely corresponds to spring migration periods."
  ) +
  theme_minimal() #this controls the visuals 

#We can also graph this so that we're looking at the different species of warbler that were sighted overtime

ggplot(warblers, aes(x = obsDt, y = comName, color = obsDt)) + #this is our dataset and the variable we will be plotting
  geom_point(alpha = 0.7, size = 2) + #geom_point handles our points on the graph
  scale_color_gradientn(  #this code handles assigning different colors to different dates
    colors = c("navy", "skyblue", "orange", "red"),
    name = "Observation Date"
  ) +
  labs( #adds the labels onto the graph
    title = "Warbler observations over time",
    x = "Date",
    y = "Species"
  ) +
  theme_minimal() #cleans up the graph

# now let's make a graph of the spacial distribution of warblers

ggplot(warblers, aes(x = lng, y = lat, color = comName)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Spatial Distribution of Warbler Observations",
    x = "Longitude",
    y = "Latitude"
  ) +
  theme_minimal()
