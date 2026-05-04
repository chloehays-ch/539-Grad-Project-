#load dataset for this location
L13276170 <- recent_ebird %>%
  filter(locId == "L13276170")
#species observed
unique(L13276170$comName)
#number of sightings
L13276170 %>%
  count(comName, sort = TRUE)
#colored bar graph
ggplot(L13276170, aes(x = comName, fill = comName)) +
  geom_bar() +
  theme_minimal() +
  labs(x = "Species", y = "Number of Records",
       title = "Bird Sightings at Private Residence - Narragansett (L13276170)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  guides(fill = "none")

