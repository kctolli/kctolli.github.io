---
title: "Task 11"
subtitle: "Strings and grep"
author: "Kyle Tolliver"
date: "March 16, 2020"
output:
  html_document:  
    keep_md: true
    toc: true
    toc_float: true
    code_folding: hide
    fig_height: 6
    fig_width: 12
    fig_align: 'center'
---






```r
# Use this R-Chunk to import all your datasets!
let <- readr::read_lines("https://byuistats.github.io/M335/data/randomletters.txt") 
letnum <- readr::read_lines("https://byuistats.github.io/M335/data/randomletters_wnumbers.txt")
```

## Background

Using global regular expression print (grep) and regular expressions (regex) to find character string patterns is a valuable tool in data analysis and is available with all operating systems and many different programming languages. It is a powerful tool once it is understood. The recently developed library(stringr) package makes these tools much easier to use. The three tasks below can be completed in many different ways. As a challenge, my code to complete this entire task less than 10 lines.

## Reading

* Chapter 14: R for Data Science - Strings
* RVerbalExpressions package

## Tasks

[X] Use the readr::read_lines() function to read in each string - randomletters.txt and randomletters_wnumbers.txt

[X] With the randomletters.txt file, pull out every 1700 letter (e.g. 1, 1700, 3400, …) and find the quote that is hidden - the quote ends with a period

[X] With the randomletters_wnumbers.txt file, find all the numbers hidden and convert those numbers to letters using the letters order in the alphabet to decipher the message

[X] With the randomletters.txt file, remove all the spaces and periods from the string then find the longest sequence of vowels.

[X] Save your .R script to your repository and be ready to share your code solution at the beginning of class

## Data Wrangling



```r
letter1700 <- let %>% 
  str_split("") %>% 
  unlist() %>% 
  .[c(1, seq(0, str_count(let), 1700))] %>% 
  str_flatten() %>% 
  str_remove_all('\\..*$')

letter1700
```

```
## [1] "the plural of anecdote is not data"
```


```r
numlet <- letnum %>% 
  str_extract_all('[:digit:]+') %>% 
  unlist() %>% 
  as.integer() %>% 
  letters[.] %>% 
  paste(collapse = '')
  
numlet
```

```
## [1] "expertsoftenpossessmoredatathanjudgment"
```


```r
spacelet <- let %>% 
  str_remove_all('\\.') %>% 
  str_remove_all('[:space:]') %>% 
  str_locate('[aeiou]')
  
spacelet
```

```
##      start end
## [1,]     7   7
```

## In Class    
### Partner Practice


```r
aeletters <- str_extract_all(letters, c("a", "e")) 
str_length(aeletters)
```

```
##  [1]  1 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12
## [26] 12
```

```r
jim <- str_count(letters, "jim")
jim
```

```
##  [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
```

```r
multiples <- str_extract_all(letters, "(.)\\1\\1")
multiples
```

```
## [[1]]
## character(0)
## 
## [[2]]
## character(0)
## 
## [[3]]
## character(0)
## 
## [[4]]
## character(0)
## 
## [[5]]
## character(0)
## 
## [[6]]
## character(0)
## 
## [[7]]
## character(0)
## 
## [[8]]
## character(0)
## 
## [[9]]
## character(0)
## 
## [[10]]
## character(0)
## 
## [[11]]
## character(0)
## 
## [[12]]
## character(0)
## 
## [[13]]
## character(0)
## 
## [[14]]
## character(0)
## 
## [[15]]
## character(0)
## 
## [[16]]
## character(0)
## 
## [[17]]
## character(0)
## 
## [[18]]
## character(0)
## 
## [[19]]
## character(0)
## 
## [[20]]
## character(0)
## 
## [[21]]
## character(0)
## 
## [[22]]
## character(0)
## 
## [[23]]
## character(0)
## 
## [[24]]
## character(0)
## 
## [[25]]
## character(0)
## 
## [[26]]
## character(0)
```

```r
aaa <- str_locate_all(letters, "aaa")
aaa
```

```
## [[1]]
##      start end
## 
## [[2]]
##      start end
## 
## [[3]]
##      start end
## 
## [[4]]
##      start end
## 
## [[5]]
##      start end
## 
## [[6]]
##      start end
## 
## [[7]]
##      start end
## 
## [[8]]
##      start end
## 
## [[9]]
##      start end
## 
## [[10]]
##      start end
## 
## [[11]]
##      start end
## 
## [[12]]
##      start end
## 
## [[13]]
##      start end
## 
## [[14]]
##      start end
## 
## [[15]]
##      start end
## 
## [[16]]
##      start end
## 
## [[17]]
##      start end
## 
## [[18]]
##      start end
## 
## [[19]]
##      start end
## 
## [[20]]
##      start end
## 
## [[21]]
##      start end
## 
## [[22]]
##      start end
## 
## [[23]]
##      start end
## 
## [[24]]
##      start end
## 
## [[25]]
##      start end
## 
## [[26]]
##      start end
```

```r
split <- str_split(letters, "")
split
```

```
## [[1]]
## [1] "a"
## 
## [[2]]
## [1] "b"
## 
## [[3]]
## [1] "c"
## 
## [[4]]
## [1] "d"
## 
## [[5]]
## [1] "e"
## 
## [[6]]
## [1] "f"
## 
## [[7]]
## [1] "g"
## 
## [[8]]
## [1] "h"
## 
## [[9]]
## [1] "i"
## 
## [[10]]
## [1] "j"
## 
## [[11]]
## [1] "k"
## 
## [[12]]
## [1] "l"
## 
## [[13]]
## [1] "m"
## 
## [[14]]
## [1] "n"
## 
## [[15]]
## [1] "o"
## 
## [[16]]
## [1] "p"
## 
## [[17]]
## [1] "q"
## 
## [[18]]
## [1] "r"
## 
## [[19]]
## [1] "s"
## 
## [[20]]
## [1] "t"
## 
## [[21]]
## [1] "u"
## 
## [[22]]
## [1] "v"
## 
## [[23]]
## [1] "w"
## 
## [[24]]
## [1] "x"
## 
## [[25]]
## [1] "y"
## 
## [[26]]
## [1] "z"
```
