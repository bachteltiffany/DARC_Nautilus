install.packages("tidyverse")
install.packages("dplR")
install.packages("tidyr")
install.packages("stringr")
install.packages("ggpubr")
install.packages("ggplot2")
install.packages("conflicted")

library("tidyverse")
library("dplR")
library("tidyr")
library("stringr")
library("ggpubr")
library("ggplot2")
library("conflicted")

filter <- dplyr::filter
mutate <- dplyr::mutate

View(X2019_NA_110_images202121710)
library(readr)
X2019_NA110_images20212710 <- read_csv("2019_NA110_images20212710.csv")

images <- readr::read_csv(data.file)