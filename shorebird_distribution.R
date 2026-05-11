##eBird data analysis for shorebirds in Rhode Island## 

#Step 1:load and store my eBird data using an API key
#eBird requires an API key to access its data,  I obtained it on their website  
Sys.setenv(EBIRD_KEY = "e1ekkpr64q0j") #Sys.setenv stores the API key as an environment variable

##Step 2: load bird observations from Rhode Island##
#now that I have the data I can see which birds have been observed in RI
ri_birds <- ebirdregion("US-RI")
## The returned object (ri_birds) is a dataframe containing
# many bird observations and associated metadata such as:
#   - common name (comName)
#   - scientific name
#   - observation date
#   - location
#   - observer information
#   - species codes
#
# This creates the full dataset that we will later filter.

#now I willfilter through common names to create our list of shorebirds 
shorebirds <- c(
  "Semipalmated Sandpiper",
  "Least Sandpiper",
  "Sanderling",
  "Dunlin",
  "Killdeer",
  "Black-bellied Plover",
  "American Oystercatcher",
  "Greater Yellowlegs",
  "Lesser Yellowlegs",
  "Willet",
  "Ruddy Turnstone",
  "Piping Plover"
)

#filter for observations in RI specifically shorebird_data <- ri_birds %>%
shorebird_data <- ri_birds %>%
  filter(comName %in% shorebirds)

#bar graph by species richness
library(ggplot2)

ggplot(shorebird_data, aes(x = comName, fill = comName)) +
  geom_bar() +
  labs(
    title = "Number of Shorebird Observations",
    x = "Common Name",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


