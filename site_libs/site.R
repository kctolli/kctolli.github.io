library(googlesheets4, tidyverse)

gs4_deauth()

# Variables

here <- here::here() ## set here file path
current_year <- lubridate::year(Sys.Date()) ## sys year 

# Basic Functions

load_libraries <- function(){
  pacman::p_load(tidyverse, pacman, glue, pander, lubridate, knitr, rmarkdown) ## Load Packages
  opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE) ## Chunk Displays
}

readcsv <- function(file){return(read_csv(file) %>% na.omit())}
gsheet <- function(url){return(read_sheet(url) %>% na.omit())}

# Google Sheets Data Frames

datapath <- "https://drive.google.com/drive/folders/13pa4_5Shqhr20sFWfhEOWuxXnKcYqJRj?usp=sharing" ## Gdrive Path

solo <- gsheet("https://docs.google.com/spreadsheets/d/1ssrsSZjXRcv4Ylv6qdQABOZMul2GIsGLaJtRrzvitYA/edit#gid=1793356435")
society <- gsheet("https://docs.google.com/spreadsheets/d/1uX9-huAPB4NhljQ1gg20MF8qxQymxDtlQRZCpjwab7Q/edit#gid=684122786")
skills <- gsheet("https://docs.google.com/spreadsheets/d/15zrT7H7h0ElvXTdjjYGgx141UmHj3hTkhNc80YM_0Fg/edit#gid=1706649799")
pos <- gsheet("https://docs.google.com/spreadsheets/d/1abShAJWxWnrEIIbDx3IGbv6fEERrRXGp73gaNpp889c/edit#gid=1221874779")
highlights <- gsheet("https://docs.google.com/spreadsheets/d/1yVMadV6xJDm9pTY5VjbEeamzvUdH4GzR804npZP6y1s/edit#gid=1033572211")
entries <- gsheet("https://docs.google.com/spreadsheets/d/1xWg3dkO6oB2Krr24fCuxDsR0aFu8jVw35FGHvvsY5g0/edit#gid=1584869514")
contact <- gsheet("https://docs.google.com/spreadsheets/d/1TR2Bfxfzh6dWtnAbuhYM6JtU7rWTe_cLW68olas__fk/edit#gid=729993551")

# R to HTML Functions

print_newline <- function(){pander::pander("\n")}
print_h1 <- function(h1){pander::pander(glue::glue("# {h1} \n\n\n"))}
print_h2 <- function(h2){pander::pander(glue::glue("## {h2} \n\n\n"))}
print_h3 <- function(h3){pander::pander(glue::glue("### {h3} \n\n\n"))}
print_h4 <- function(h4){pander::pander(glue::glue("#### {h4} \n\n\n"))}
print_h5 <- function(h5){pander::pander(glue::glue("##### {h5} \n\n\n"))}
print_h6 <- function(h6){pander::pander(glue::glue("###### {h6} \n\n\n"))}
print_pic <- function(img){pander::pander(glue::glue("![]({img}) \n\n\n"))}
print_img <- function(pic){pander::pander(glue::glue('<img src = {pic} alt = "Picture Error" class = "img"> \n\n\n'))}
print_strong <- function(p){pander::pander(glue::glue('<strong>{p}</strong>'))} 
pagebreak <- function(){pander::pander('<hr /><div style="clear:both;"></div>')}


# R Style
gray <- function(){pander::pander('style="color:gray;"')}
white <- function(){pander::pander('style="color:white;"')}
px0 <- function(){pander::pander('style="padding-left:0px;"')}
px20 <- function(){pander::pander('style="display:none;padding-left:20px;"')}

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
  
  pander::pander(glue::glue('
  <script src="./site_libs/site.js"></script>
  {pagebreak}<nav class="info"><p>How to navigate this website: </p><ul>
  <li><span style="color:blue;">Blue</span> text - Clickable (Click to see pop up links or new pages)</li>
  <li><span style="color:gray;">Gray</span> text - Hoverable (Hover to get more information)</li></ul>
  <button class="btn" onclick="darkmode()"><i class="fas fa-adjust">Toggle Dark Mode</i></button></nav>
  {pagebreak} \n\n\n'))
}

copyright <- function(start){
  if (start <= current_year){
  if (current_year != start) {str <- glue::glue('{start} - {current_year} -- Kyle Tolliver')}
  else {str <- glue::glue('{current_year} -- Kyle Tolliver')}}
  else {str <- 'Time Error'}
  pander::pander(glue::glue('<i class="far fa-copyright"></i>{str}'))
}

footer <- function(file){
  pagebreak <- pagebreak()
  copyright <- copyright(2020)
  string <- "javascript:showhide('copyright')"
  
  licence <- pander::pander(glue::glue('<ul>
  <li>[Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io).
  <li>Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.Rmd) and [Yaml](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/_site.yml) files. </li>
  <li>Website is developed in [R](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site.R), HTML, [CSS](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/site.css) and [Javascript](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site.js). </li>
  </ul>'))

  pander::pander(glue::glue('{pagebreak}<footer><div style="padding-left:0px;">
  <span class="tooltipr"><a href={string}><p style="color:blue;">{copyright}</p></a></span>
  <div id="copyright" style="display:none;padding-left:20px;">{licence}</div></div></footer>'))
}

# Renders

## Knit the HTML version of web pages
render_web <- function(){
  rmarkdown::render("index.rmd", params = list(pdf_mode = FALSE), output_file = "index.html")
  rmarkdown::render("pos.rmd", params = list(pdf_mode = FALSE), output_file = "pos.html")
  rmarkdown::render("projects.rmd", params = list(pdf_mode = FALSE), output_file = "projects.html")
  rmarkdown::render("skills.rmd", params = list(pdf_mode = FALSE), output_file = "skills.html")
  rmarkdown::render("work.rmd", params = list(pdf_mode = FALSE), output_file = "work.html")
}

## Knit the Resume to html and pdf
render_resume <- function(){
  file <- "resume" # Resume file name
  tmp_html <- fs::file_temp(ext = ".html") # Create a temp html file
  
  ### Knit the HTML version
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = FALSE), output_file = glue::glue("{file}.html"))

  ### Knit the PDF version to temporary html location
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = tmp_html)

  ### Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html, output = glue::glue("{file}.pdf"))
  
  file.remove(tmp_html)
}

## Render Everything

render_all <- function(){
  render_web()
  setwd("./site_libs/resume")
  render_resume()
  setwd("../..")
}
