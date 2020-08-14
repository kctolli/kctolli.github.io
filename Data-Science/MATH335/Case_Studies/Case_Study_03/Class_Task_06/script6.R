############# Charts to Show a Distribution ############
library(ggplot2)
#Think of violin plots as sideways density plots
idata <- ggplot(iris,aes(x=Species, y=Sepal.Length, fill=Species))
p<-ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) 

p+geom_col()
idata+geom_col()
#What do you notice?
#What do you wonder?
#Can we create a chart that answers some of the "wonder questions"?


#What's wrong with bar charts?


# They only show ONE statistic or summary measure. When audiences see bar graphs of means, they erroneously judge values that fall inside a bar (i.e., below the mean) as more probable than values equidistant from the mean but outside a bar (Newman & Scholl, 2012). This bias doesn't affect violin plots because the region inside the violin contains all of the observed data. I'd guess that observers will correctly intuit that values in the wider parts of the violin are more probable than those in narrower parts (this is a good thing).

#You can always overlay additional info like a mean, median, or std. dev.


#Try the violin plot as an alternative
p+ geom_violin()

#Or try an alternative: the violin scatter plot. This shows all the points of the data, but follows the same general logic of a violin plot. This is also called a beeswarm plot
library(ggbeeswarm)
p + geom_beeswarm()
p + geom_quasirandom()
p+geom_jitter() #compare to jitter


#Use the mpg dataset, create a violin plot for 'hwy' for each class of car, with a beeswarm plot overlayed
mpgviz <- ggplot(data=mpg, mapping = aes(x=class, y=hwy)) 

ex1 <- mpgviz +  
  geom_???????() + 
  geom_?????????()
ex1

####### Example 2, review############
#Now recreate the plot above, but switch the axes so the violin plots are horizontal and facet by `drv` (4 wheel, front wheel or rear wheel)
????? + 
  ?????? +
  ??????
mpgviz + geom_violin() + geom_quasirandom()


