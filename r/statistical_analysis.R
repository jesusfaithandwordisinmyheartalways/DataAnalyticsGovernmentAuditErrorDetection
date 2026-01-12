library(tidyverse)

df <- read.csv("data/processed/cleaned_transactions.csv")

summary(df$amount)

ggplot(df, aes(amount)) +
  geom_histogram(bins = 50) +
  theme_minimal()


  