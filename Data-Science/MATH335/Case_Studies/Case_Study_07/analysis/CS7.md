---
title: "CASE STUDY 7"
author: "Kyle Tolliver"
date: "February 28, 2020"
output:
  html_document:
    code_folding: hide
    fig_align: center
    fig_height: 6
    fig_width: 12
    keep_md: yes
    toc: yes
    toc_float: yes
subtitle: Counting names in scripture
editor_options:
  chunk_output_type: console
---






```r
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
```


```r
# Use this R-Chunk to import all your datasets!
scriptures <- read.csv("../../data/lds-scriptures.csv") %>% 
  na.omit()

scripture_print <- scriptures %>% 
  group_by(volume_id, volume_title) %>% 
  summarise(long_script = str_c(scripture_text, collapse = ""))

mormonsbook <- scripture_print %>% filter(volume_id == 3)
  
book_of_mormon <- scriptures %>%   
  filter(volume_id == 3) %>%  
  select(-volume_id, -volume_long_title, -book_long_title, -volume_subtitle, -book_subtitle, -volume_short_title, -volume_lds_url, -book_lds_url) %>% 
  mutate(volume_verse_id = verse_id - 31102) %>% 
  mutate(volume_chapter_id = chapter_id - 1189) %>% 
  mutate(volume_book_id = book_id - 66) %>% 
  select(-verse_id, -chapter_id, -book_id) %>% 
  select(-verse_short_title, -book_short_title, -chapter_number, -verse_number) 

bmnames <- read_rds(gzcon(url("https://byuistats.github.io/M335/data/BoM_SaviorNames.rds")))%>% 
  mutate(book_title = Book) %>% 
  select(-Book) %>% 
  mutate(verse_title = reference) %>% 
  select(-reference) %>% 
  separate(chapter_verse, c("chapter_number", "verse_number"), ":") %>% 
  select(-chapter_number, -verse_number, -book_title, -verse_title)
```

## Background

In 1978 Susan Easton Black penned an article in the Ensign title Even statistically, he is the dominant figure of the Book of Mormon. which makes some statistical claims about the Book of Mormon. With our “string” skills we are going to check her result and build an improved statistic using using number of words between references.

## Tasks

### Before Class

[ ] Get the scripture and savior name data into R

* [X] Download the data from http://scriptures.nephi.org/downloads/lds-scriptures.csv.zip
* [X] Read in the .csv file that was in the zip file and examine the structure of the data
* [X] Use read_rds(gzcon(url("https://byuistats.github.io/M335/data/BoM_SaviorNames.rds"))) to download and load the Savior names table into R
* [ ] Use the list of Savior names and the Book of Mormon verses to figure out the average number of words between references to the Savior

[ ] Find each instance of a Savior name in the Book of Mormon

* [ ] Split on those instances and then count the number of words between each instance
* [ ] Use the example code below for some hints on how to tackle this task
* [ ] Report the average number of words between each Savior name

[X] Create an .Rmd file with 1-2 paragraphs summarizing your graphic that shows how the distance between Savior names is distributed across the Book of Mormon

[X] Compile your .md and .html file into your git repository

### After Class

[ ] Find two other student’s compiled files in their repository and provide feedback using the issues feature in GitHub (If they already have three issues find a different student to critique)

[ ] Address 1-2 of the issues posted on your project and push the updates to GitHub


```r
# your script might use the following functions
stringr::str_detect()
stringr::str_locate_all()
stringr::str_replace_all()
stringr::str_extract_all()
stringi::stri_stats_latex()
```

## Data Wrangling


```r
#Use this R-Chunk to clean & wrangle your data!
bmnames1 <- bmnames$name %>%
  str_trim() %>%
  unlist() %>%
  str_flatten(collapse = "|")

mormonsbook <- mormonsbook %>%
  mutate(scripture = str_replace_all(long_script, bmnames1, "Jesus"))

jesus_book_of_mormon <-  mormonsbook$scripture %>%
  str_split("Jesus") %>%
  unlist()

#names()

jesusoccurs <- jesus_book_of_mormon %>%
  mutate(scripture = str_parse(V1)) %>%
  pull(scripture) %>%
  str_locate_all("Jesus") %>%
  stri_stats_latex() %>%
  enframe() %>%
  filter(name == "Words") %>%
  pull(value)

displaystuff <- c("Book of Mormon", "How often the Savior's name occurs", jesusoccurs, "Average of the occurences", jesusoccurs / 6604)

displaystuff
```

## Data Visualization


```r
# Use this R-Chunk to plot & visualize your data!
```

## Conclusions

I have worked on this for hours and got this far. I was trying to find the average occurences of the Jesus's Name. I was unable to figure that out. I planned to subtract the number of occurences from the total number of work in the Book of Mormon.

