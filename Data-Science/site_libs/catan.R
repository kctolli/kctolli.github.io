library(tidyverse)
library(mosaic)
library(gsheet)
library(pander)

pandary <- function(x){pander(summary(x))}

tests <- function(x){
  catan$x <- x
  pander(catan %>% group_by(x) %>%
           summarise(minscore = min(End_Score), 
                     avgscore = mean(End_Score), 
                     maxscore = max(End_Score), 
                     deviation = sd(End_Score), 
                     variance = var(End_Score), 
                     scorerange = max(End_Score) - min(End_Score)))
  
  pander(cor(x, catan$End_Score))
  
  boxplot(End_Score ~ x, data=catan)
  
  pandary(aov(End_Score ~ x, data=catan))
  pander(kruskal.test(End_Score ~ x, data=catan))
  pandary(lm(End_Score ~ x, data=catan))
  
  ggplot(catan, aes(x = x, y = End_Score)) +
    geom_point() + geom_smooth(method = "lm", se=FALSE)
}


fileUrl <- "https://docs.google.com/spreadsheets/d/1O6gl8bC4PhokbutpHBL1TQd6TLIo16ZnIEDVYfTEOO0/"

catan <- gsheet2tbl(fileUrl) %>% na.omit() %>% 
  mutate(Won = if_else(End_Score >= 10, 1, 0)) %>% View()

pandary(catan$End_Score)
pandary(catan$Cities)
pandary(catan$Settlements)
pandary(catan$Roads)
pandary(catan$Additional)

tests(catan$Player)
tests(catan$Game)

pandary(aov(End_Score ~ Player + Game + Player : Game, data=catan))
pandary(lm(End_Score ~ Player + Game + Player : Game, data=catan))

ggplot(catan, aes(x = Player, y = End_Score)) +
  geom_point() +
  geom_smooth(aes(color = factor(Game)),method = "lm", se=FALSE)