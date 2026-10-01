# Hashem, Ian

rm(list = ls())

library(tidyverse)

fastfoodData <- read.csv("datasets/fastfood.csv", stringsAsFactors = TRUE)

summary(fastfoodData)

dqMcdData <- fastfoodData %>%
  filter(restaurant == "Dairy Queen", restaurant == "Mcdonalds")

summary(dqMcdData)

dqMcdData %>%
  group_by(restaurant) %>%
  summarize(mean_protein   = mean(protein),
            median_protein = median(protein),
            sd_protein = sd(protein),
            iqr_protein = IQR(protein),
            min_protein = min(protein),
            max_protein = max(protein)
  )

ggplot(data = dqMcdData, aes(x = restaurant, y = protein)) +
  geom_boxplot()

#Mcdonalds has a more skewed distribution of protein as it appears its mean protein value
# is 40.3 while its median is 33. This shows that higher values are pulling the mean upward.
# This also shows us that Mcdonalds has a larger standard deviation of 29.5 compared to 11.5
# for dairyqueen, and its maxium protein value is 186 compared to 49 for Dairy Queen. The boxplot
# also shows several higher outliers for Mcdonalds which supports the plot of its protein distribution
# being more right skewed.
