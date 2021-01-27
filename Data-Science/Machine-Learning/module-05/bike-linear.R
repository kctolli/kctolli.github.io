# - instant: record index 
# - dteday : date 
# - season : season (1:winter, 2:spring, 3:summer, 4:fall) 
# - hr : hour (0 to 23) 
# - holiday : weather day is holiday or not
# - workingday : if day is neither weekend nor holiday is 1, otherwise is 0. 
# + weathersit : 
# - 1: Clear, Few clouds, Partly cloudy, Partly cloudy 
# - 2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist 
# - 3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds 
# - 4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog 
# - temp_c : temperature in Celsius. 
# - feels_like_c: Feels like temperature in Celsius. 
# - hum: humidity percentage
# - windspeed: Wind speed.
# - casual: count of casual users 
# - registered: count of registered users 

library(mosaic) 
library(pander)
library(tidyverse)
library(DT) 

pandary <- function(x){pander(summary(x))}

bike <- read_csv("https://raw.githubusercontent.com/byui-cse/cse450-course/master/data/bikes.csv") %>% 
  na.omit() %>%  
  mutate(total_rentals = casual + registered) %>% 
  select(- casual, - registered, - X1, - instant)

View(bike)

simple <- function(dat, y, x){
  
  # Preform Regression
  
  mylm <- lm(y ~ x, data = dat)
  sumlm <- pandary(mylm)
  
  # Create Plot
  
  myplot <- ggplot(dat, aes(y = y, x = x)) +
    geom_point(color = "black") +
    geom_smooth(method = "lm", se = FALSE, color = "blue") +
    theme_bw()
  
  # Create List and Return List
  
  mylist <- list("lm" = sumlm, "plot" = myplot)
  return(mylist)
}

multiple <- function(dat, y, x1, x2){
  
  # Preform Regression
  
  mylm <- lm(y ~ x1 + x2 + x1:x2, data = dat)
  sumlm <- pandary(mylm)
  
  # Create Plot
  
  X2 <- as.factor(x2)
  
  myplot <- ggplot(dat, aes(y = y, x = x1, color = X2)) +
    geom_point(color = "black") +
    geom_smooth(method = "lm", se = FALSE) +
    theme_bw()
  
  # Create List and Return List
  
  mylist <- list("lm" = sumlm, "plot" = myplot)
  return(mylist)
}

logistic <- function(dat, y, x){
  
  # Preform Regression
  
  myglm <- glm(y ~ x, data = dat)
  sumglm <- pandary(myglm)
  
  # Create Plot

  myplot <- ggplot(dat, aes(y = y, x = x)) +
    geom_point() +
    geom_smooth(method = glm,
                method.args = list(family = binomial), 
                se = FALSE) +
    theme_bw()
  
  # Create List and Return List
  
  mylist <- list("lm" = sumglm, "plot" = myplot)
  return(mylist)
}

daybike <- bike %>% 
  group_by(dteday, workingday, season) %>% 
  summarise(total_rentals = sum(total_rentals))

logistic(daybike, daybike$workingday, daybike$total_rentals)

simple(bike, bike$total_rentals, bike$season)

simple(bike, bike$total_rentals, bike$hum)

simple(bike, bike$total_rentals, bike$weathersit)

simple(bike, bike$total_rentals, bike$windspeed)

multiple(bike, bike$total_rentals, bike$temp_c, bike$workingday)

multiple(bike, bike$total_rentals, bike$temp_c, bike$season)

multiple(bike, bike$total_rentals, bike$windspeed, bike$weathersit)


