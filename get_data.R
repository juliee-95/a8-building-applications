# Separate file that will get specific dataset required for histograms
library(dplyr)
# Load iris dataset
data(iris)

# Function will filter out dataset with specific species
df <- function(species) {
  df1 <- iris %>% filter(Species %in% paste(species))
}

# Function will select the dataset with specific quality of specific species
df2 <- function(df1, qualities) {
  df2 <- df1 %>% select(contains(qualities))
}