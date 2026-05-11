# 539 Graduate Project – eBird Data Analysis 
## Chloe Hays
## Project Overview 
This project analyzes bird sighting observations collected from the eBird database, developed by the Cornell Lab of Ornithology. The analysis focuses on:
- Bird species observations across four field sites in Rhode Island
- Warbler species distributions across the state
- Shorebird distributions across Rhode Island coastal habitats

The goal of this project is to compare bird species occurrence among different habitat types, including wildlife refuges, urban environments, and private residential properties. These locations were selected because they are sites that will be surveyed during upcoming summer fieldwork. It also seeks to osberve the distribution of migratory bird species across Rhode Island to determine the most freqently spotted warbler and shorebird species. These species were chosen because of their extreme migratory patterns. 

## Research Questions
What bird species are commonly observed at each site?
Do backyard observations differ from observations at public wildlife refuges?
How do warbler and shorebird distributions vary across Rhode Island?

## Data Source
Data was obtained from the eBird database using the rebird R package.
- Source: eBird, Cornell Lab of Ornithology
- Observation Period: Recent sightings collected within the past year
- Location: Rhode Island, USA

## Methods
This project was completed in RStudio using the following tools and packages:
- rebird for downloading eBird observation data
- dplyr for data cleaning and summarization
- ggplot2 for data visualization
- GitHub for version control and project management

Analyses included:
- Species frequency comparisons
- Site-level observation summaries
- Distribution visualizations for warblers and shorebirds

Repository Structure
ebird_analysis.R           # Downloads and prepares eBird dataL166161.R                  # Site-specific analysisL1458029.R                 # Site-specific analysisL13276170.R                # Site-specific analysisAll_Sites.R                # Combined analysis across all siteswarbler_distribution.R     # Warbler distribution analysisshorebird_distribution.R   # Shorebird distribution analysis

## Reproducibility
Run the scripts in the following order:
- (1)ebird_analysis.R
- (2)L166161.R
- (3)L1458029.R
- (4)L13276170.R
- (5)All_Sites.R
- (6)warbler_distribution.R
- (7)shorebird_distribution.R

Required Packages
Install the required R packages before running the analysis:
install.packages(c("rebird", "dplyr", "ggplot2"))

Example Outputs
The project generates:
- Species distribution graphs
- Site comparison visualizations
- Summary statistics of observed bird species

## AI Usage Statement
ChatGPT was used to assist with:
- troubleshooting R and GitHub issues,
- improving code organization and readability
- modifying existing code to incorporate additional location IDs.

All data interpretation, ecological analysis, and written conclusions were completed independently by the author.

## Results
Wildlife refuges had higher species abundance than urbanized and residential environments. Warblers have a larger distribution
than shorebirds. With the Northern Yellow Warbler being the most frequently spotted warbler species. 

## References
Cornell Lab of Ornithology. eBird Basic Dataset.https://ebird.org
