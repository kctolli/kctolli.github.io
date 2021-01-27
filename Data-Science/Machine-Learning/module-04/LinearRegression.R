library(mosaic)
library(car)
library(DT)
library(pander)
library(tidyverse)

regress <- function(dat, x){
  mylm <- pander(summary(lm(popularity ~ x, data = dat)))
  mylm
  
  ggplot(dat, aes(y = popularity, x = x)) +
    geom_point() +
    geom_smooth(method = "lm", se=FALSE) +
    theme_bw()
}

spotify <- read_csv("https://raw.githubusercontent.com/byui-cse/cse450-course/master/data/spotify/data.csv") %>% 
  na.omit() %>% 
  select(-release_date, -id, -name) %>% 
  filter(year >= 1980) %>% 
  select(- `" "`)

View(spotify)

write.csv(spotify, "./CSE450/module-04/new_spotify.csv")

lm_year <- regress(spotify, spotify$year)
lm_year

