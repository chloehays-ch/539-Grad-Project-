#establish a dataset with all of the sites I will be analyzing
sites_data <- recent_ebird %>%
  filter(locId %in% c("L1458029", "L13276170", "L166161", "L735002"))
#count the total number of sightings per site
site_summary <- sites_data %>%
  count(locId, sort = TRUE)
#count species richness per site
richness <- sites_data %>%
  group_by(locId) %>%
  summarise(species_richness = n_distinct(comName))
#formualte bargraph
ggplot(richness, aes(x = locId, y = species_richness, fill = locId)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Site ID", y = "Number of Species",
       title = "Species Richness Across Sites") +
  guides(fill = "none")

#count species per site
species_site <- sites_data %>%
  count(locId, comName)
#heatmap?
ggplot(species_site, aes(x = locId, y = comName, fill = n)) +
  geom_tile() +
  theme_minimal() +
  labs(x = "Site", y = "Species", fill = "Sightings",
       title = "Bird Species Across Sites") +
  theme(axis.text.y = element_text(size = 6))

#clean summary - top species per site
sites_data %>%
  group_by(locId, comName) %>%
  summarise(total = n(), .groups = "drop") %>%
  arrange(locId, desc(total))
