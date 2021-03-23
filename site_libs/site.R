source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/js.R")
source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/css.R")
source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/html.R")
source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/render.R")
source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/gsheets.R")
source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/copyright.R")

# Variables / Basic Functions

here <- here::here() ## set here file path

load_libraries <- function(){
  pacman::p_load(tidyverse, pacman, glue, pander, lubridate, knitr, rmarkdown) ## Load Packages
  opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE) ## Chunk Displays
}

# Section Templates

section <- function(cv, section_id, glue_template){print(glue::glue_data(filter(cv, section == section_id), glue_template))}

## Glue Templates

print_resume_section <- function(section_id){
  
  cv <- entries %>% filter(in_resume) 
  
  # if(cv$start %in% cv$end){

    glue_template <- "
### {title}

{institution}

{loc}

{end}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"
#   } else {
# 
#     glue_template <- "
# ### {title}
# 
# {institution}
# 
# {loc}
# 
# {start} <br> | <br> {end}
# 
# - {description_1}
# - {description_2}
# - {description_3}
# \n\n\n"
#   }

  section(cv, section_id, glue_template)
}

print_resume_education <- function(){
  pander::pander("
### Brigham Young University - Idaho

Bachelor of Science in Software Engineering

Rexburg, ID

2017 <br> | <br> 2020

+ Minor: Computer Engineering and Data Science
+ Coursework: Advanced Embedded Systems, Digital System Design, <br />Computer Architecture, Circuit Analysis, Machine Learning, 
<br />Intermediate Stats, Data Intuition, Data Wrangling, Database Development, Applied Development, System Security, 
Project Management, Linear Algebra, Discrete Math, Differential Calculus  
")  
}

print_work <- function(section_id = 'experience'){

  if (section_id == 'experience'){
    
  glue_template <- "
## {institution}

#### {time}

### {title}

{startmonth} {start} - {endmonth} {end} --- {loc}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"} else if (section_id == 'ta'){
  
  glue_template <- "
#### {title}

{startmonth} {start} - {endmonth} {end} --- {loc}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"} else {glue_template <- "Section Error"}

  section(entries, section_id, glue_template)
}

print_project <- function(){
  
  section_id = 'projects'

  glue_template <- "
### {title}

{start} - {end} --- Spent {time} hours

- {description_1}
- {description_2}
- {description_3}
\n\n\n"

  section(entries, section_id, glue_template)
}

print_tutor <- function(){
  string <- "javascript:showhide('tutor')"

  pander::pander(glue::glue('
  ### Computer Science Tutor

  April 2018 - August 2018 --- Rexburg, ID

  <ul><div style="padding-left:0px;">
  <span class="tooltipr"><a href={string}><li>Tutored many classes</li></a></span>
  <div id="tutor" style="display:none;padding-left:20px;">

    + Object-Oriented Programming with Data Structures using Python
    + Fundamentals of Digital Systems w/ Lab
    + Introduction to Engineering
    + Introduction to Electrical and Computer Engineering

  </div></div><li>Taught students topics from these classes</li>
  <li>Lead group and individual appointments and discussions</li></ul>'))
}

## Basic Templates

print_contact <- function(file){
  
  if (file == "resume"){info <- dplyr::filter(contact, in_resume)}
  else if (file == "index"){info <- dplyr::filter(contact, in_index)}
  else {info <- contact}
  
  print(glue::glue_data(info, "<i class='fa fa-{icon}'></i> [{contact}]({link}) \n\n"))
}

print_disclaimer <- function(){
  pander::pander('Member of [Tau Beta Pi](https://tbp.org) <br /> Engineering Honor Society <br /> Idaho Delta chapter at BYU-Idaho.
    \n\n\nThis resume was made with <br /> the R package [pagedown](https://github.com/rstudio/pagedown).')}

print_pos <- function(section_id){section(pos, section_id, "- {name}\n")}
print_solo <- function(){print(glue::glue_data(solo, "- {name} - [#{number}](https://www.sololearn.com/{link}/pdf)\n"))}
print_skills <- function(){print(glue::glue_data(skills, "- {skill} \n"))}
print_soc <- function(){print(glue::glue_data(society, "- {group} associated with {loc} ({start} - {end}) \n"))}
print_highlights <- function(){print(glue::glue_data(highlights, "- [{Text}]({Link}) \n"))}
print_portfolio <- function(){pander::pander('<p class="info">This website is setup as a personal portfolio.</p>')}

# Utilities

nav <- function(){
  pagebreak <- pagebreak()
  showhide <- showhide()
  darkmode <- darkmode()
  yaml <- yaml_css()
  site <- site_css()
  
  pander::pander(glue::glue('
  {site}{yaml}{showhide}{darkmode}{pagebreak}<nav class="info"><p>How to navigate this website: </p><ul>
  <li><span style="color:blue;">Blue</span> text - Clickable (Click to see pop up links or new pages)</li>
  <li><span style="color:gray;">Gray</span> text - Hoverable (Hover to get more information)</li></ul>
  <button class="btn" onclick="darkmode()"><i class="fas fa-adjust">Toggle Dark Mode</i></button></nav>
  {pagebreak} \n\n\n'))
}

footer <- function(file){
  pagebreak <- pagebreak()
  copyright <- copyright(2020)
  string <- "javascript:showhide('copyright')"
  site_libs <- "https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/"
  
  licence <- pander::pander(glue::glue('<ul>
  <li>[Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io).
  <li>Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.Rmd) and [Yaml](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/_site.yml) files. </li>
  <li>Website is developed in [R]({site_libs}site.R) with HTML, CSS and Javascript. </li>
  </ul>'))

  pander::pander(glue::glue('{pagebreak}<footer><div style="padding-left:0px;">
  <span class="tooltipr"><a href={string}><p style="color:blue;">{copyright}</p></a></span>
  <div id="copyright" style="display:none;padding-left:20px;">{licence}</div></div></footer>'))
}

site_css <- function(){
  pander::pander('<style>
/*
Site Styles
*/

a {color: blue;}
ul {text-align: left;}

.info {font-size: 80%; font-style: italic; font-family: "Arial";}

body {background-color: white; color: black; font-family: "Helvetica";}
footer{clear:both; margin: auto;}
.dark-mode {background-color: black; color: white;}

hr{border-top: 1px solid black;}
.dark-mode hr {border-top: 1px solid white;}

.navbar{background-color: white;}
.dark-mode .navbar{background-color: black;}

.tocify{background-color: white; color: black; font-family: "Times";}

.btn {
  background-color: white;
  border: none;
  color: blue;
  padding: 5px 10px;
  margin: 2px;
  border-radius: 4px;
  cursor: pointer;   
  font-family: "Georgia";
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
.dark-mode .btn{background-color: black;}
.btn:hover {background-color: blue; color: white;}
</style>')
} 