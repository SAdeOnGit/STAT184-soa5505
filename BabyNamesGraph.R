install.packages('remotes')
remotes::install_github("mdbeckman/dcData")
library(tidyverse)
library(dcData)
library(esquisse)
#Look at the Baby Names
view(BabyNames)

#Separate baby names by the ones we want
CutBabyNames <- BabyNames %>%
  filter (name %in% c('Isaac', 'Hazel', 'Cynthia')) %>%
  group_by(year, name) %>%
  summarize(count = sum(count), .groups = 'drop')

ggplot(
  data = CutBabyNames,
  mapping = aes(
    x = year,
    y = count,
    color = name,
    shape = name
  )
) +
  geom_point(size = 1.5) +
  labs(
    x = "Year",
    y = "Number of Babies with that Name",
    color = "name",
    shape = 'name',
    title = 'Number of babies with the same name by Year'
  ) +
  scale_color_manual(
    values = c("#F33FA1", "#A1C1B1", "#11E1F2")
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom"
  )
