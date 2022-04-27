library(tidyverse)
library(dplyr)
library(ggplot2)
library(conflicted)
library(plyr)
library(data.table)
library(kableExtra)
library(knitr)

filter <- dplyr::filter
mutate <- dplyr::mutate
summarise <- dplyr::summarise
#load data into R

NA114.data <- read.csv("/Users/darc/Desktop/NA114_20220412.csv")

#select summary variables

summary.cols <- NA114.data %>% 
  select(EventID, Phylum, Class, Order, Family, ScientificName, IndividualCount,
         DepthInMeters, AssociatedTaxa, Substrate)



#SUMMARY OF ANIMAL COUNTS BY PLYUM#
# 1. create phyla list with individual count

phyla.list <- summary.cols %>% 
  select(EventID, Phylum, IndividualCount)
  
# 2. sum of individual count/phyla

sum.phyla <- phyla.list %>% 
  group_by(EventID, Phylum) %>% 
  summarise(IndividualCount = sum(IndividualCount))

# 3. create custom table

sum.phyla %>% 
  kbl() %>% 
  kable_paper("hover", full_width = F)
  



#DETAILED ANIMAL LIST x DIVE#
# 1. create data frame with higher classification

highr.class <- summary.cols %>% 
  select(EventID, Phylum, Class, Order, Family, ScientificName, IndividualCount)

# 2. sum individual count/taxonomic classification

sum.class <- highr.class %>% 
  group_by(EventID, Phylum, Class, Order, Family, ScientificName) %>% 
  summarise(IndividualCount = sum(IndividualCount))


#CORALS ALL DIVES#

cor.list <- highr.class %>% 
  filter(Phylum == "Cnidaria") 

cor.sum <- cor.list %>% 
  group_by(EventID, Phylum, Class, Order, Family, ScientificName) %>% 
  summarise(IndividualCount = sum(IndividualCount))

#SPONGES ALL DIVES#

por.list <- highr.class %>% 
  filter(Phylum == "Porifera")

por.sum <- por.list %>% 
  group_by(EventID, Phylum, Class, Order, Family, ScientificName) %>% 
  summarise(IndividualCount = sum(IndividualCount))


#ASSOCIATES ALL DIVES#

asso.list <- summary.cols %>% 
  select(EventID, Phylum, Class, Order, Family, ScientificName, IndividualCount, AssociatedTaxa, Substrate)


