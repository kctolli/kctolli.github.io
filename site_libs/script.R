# Variables

here <- here::here() ## set here file path
user <- "kctolli" ## set user
datapath <- "./site_libs/data/" ## data path for website

# Basic Functions

load_libraries <- function(){
  knitr::opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE) ## Chunk Displays
  pacman::p_load(tidyverse, glue, pacman, pander, lubridate)
}

readcsv <- function(file){
  library(tidyverse)
  csv <- read_csv(file) %>% na.omit()
  detach("package:tidyverse", unload = TRUE)
  return(csv)
}

# R to HTML Functions

pagebreak <- function(){pander::pander('<hr /> <div style="clear:both;"></div>')}

print_newline <- function(){pander::pander("\n")}
print_h1 <- function(h1){pander::pander(glue::glue("# {h1} \n\n\n"))}
print_h2 <- function(h2){pander::pander(glue::glue("## {h2} \n\n\n"))}
print_h3 <- function(h3){pander::pander(glue::glue("### {h3} \n\n\n"))}
print_h4 <- function(h4){pander::pander(glue::glue("#### {h4} \n\n\n"))}
print_h5 <- function(h5){pander::pander(glue::glue("##### {h5} \n\n\n"))}
print_h6 <- function(h6){pander::pander(glue::glue("###### {h6} \n\n\n"))}
print_pic <- function(img){pander::pander(glue::glue("![]({img}) \n\n\n"))}

user_stats <- function(){
  pander::pander(glue::glue('<h2>User Stats</h2><div align="center"><img style="max-width:100%;" height="160" align="center"
  src="https://github-readme-stats.vercel.app/api/top-langs/?username={user}&layout=compact&theme=gruvbox" /></div>'))
}

nav <- function(){
  pander::pander('
  <script src="./site_libs/script.js"></script>

  <hr/><div style="clear:both;"></div>
  <nav class="info"><p>How to navigate this website: </p><ul>
  <li><span style="color:blue;">Blue</span> text - Clickable (Click to see pop up links or new pages)</li>
  <li><span style="color:gray;">Gray</span> text - Hoverable (Hover to get more information)</li>
  </ul></nav>

  <button class="btn" onclick="darkmode()"><i class="fas fa-adjust">Toggle Dark Mode</i></button>
  <hr/><div style="clear:both;"></div>')
}

## CSS
w3css <- function(){pander::pander('<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">')}
bootstrap3 <- function(){pander::pander('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">')}
bootstrap4 <- function(){pander::pander('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">')}

### colors
gray <- function(){pander::pander('style="color:gray;"')}
white <- function(){pander::pander('style="color:white;"')}
px0 <- function(){pander::pander('style="padding-left:0px;"')}
px20 <- function(){'style="display:none;padding-left:20px;"'}

# Section Templates

section <- function(cv, section_id, glue_template){
  section_data <- dplyr::filter(cv, section == section_id)
  print(glue::glue_data(section_data, glue_template))
}

print_resume_section <- function(path, section_id){
  
  cv <- read_csv(glue("{path}entries.csv")) %>% filter(in_resume) 
  
  if(cv$start %in% cv$end){

    glue_template <- "
### {title}

{institution}

{loc}

{end}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"
  } else {

    glue_template <- "
### {title}

{institution}

{loc}

{start} <br> | <br> {end}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"
  }

  section(cv, section_id, glue_template)
}

print_work <- function(path){
  cv <- readcsv(glue::glue("{datapath}entries.csv")) 
  
  section_id = 'experience'

  glue_template <- "
## {institution}

#### {time}

### {title}

{startmonth} {start} - {endmonth} {end} --- {loc}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"

  section(cv, section_id, glue_template)
}

print_project <- function(path){
  cv <- readcsv(glue::glue("{path}entries.csv")) 
  
  section_id = 'projects'

  if(cv$start %in% cv$end){

    glue_template <- "
### {title}

{end} --- Spent {time} hours

- {description_1}
- {description_2}
- {description_3}
\n\n\n"

  } else {

  glue_template <- "
### {title}

{start} - {end} --- Spent {time} hours

- {description_1}
- {description_2}
- {description_3}
\n\n\n"

  }

  section(cv, section_id, glue_template)
}

print_TA <- function(path){
  cv <- readcsv(glue::glue("{path}entries.csv")) 
  
  section_id = 'teaching'

  glue_template <- "
#### {title}

{startmonth} {start} - {endmonth} {end} --- {loc}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"

  section(cv, section_id, glue_template)
}

print_tutor <- function(){
  string <- "javascript:showhide('tutor')"

  pander::pander(glue::glue('
  ### Computer Science Tutor

  April 2018 - August 2018 --- Rexburg, ID

  <ul><div style="padding-left:0px;">
  <span class="tooltipr"><a href={string}><li>Tutored many classes</li></a></span>
  <div id="tutor" style="display:none;padding-left:20px;">
    Including:

    + Object-Oriented Programming with Data Structures using Python
    + Fundamentals of Digital Systems w/ Lab
    + Introduction to Engineering
    + Introduction to Electrical and Computer Engineering

  </div></div>
  <li>Taught students topics from these classes</li>
  <li>Lead group and individual appointments and discussions</li>
  </ul>
  '))
}


# Basic Templates

print_pos <- function(path, section_id){

  cv <- readcsv(glue::glue("{path}pos.csv"))
  
  glue_template <- "
- {name}\n"

  section(cv, section_id, glue_template)
}

print_solo <- function(path, section_id){
  
  cv <- readcsv(glue::glue("{path}solo.csv"))
  
  glue_template <- "
- {name} - [#{number}](https://www.sololearn.com/Certificate/{number}/pdf/)\n"
  
  print(glue::glue_data(cv, glue_template))
}

print_contact <- function(info){
  print(glue::glue_data(info, "<i class='fa fa-{icon}'></i> [{contact}]({link}) \n\n"))
}

print_skills <- function(path){
  skills <- readcsv(glue::glue("{path}skills.csv"))
  print(glue::glue_data(skills, "- {skill} \n"))
}

print_soc <- function(path){
  soc <- readcsv(glue::glue("{path}society.csv"))
  print(glue::glue_data(soc, "- {group} associated with {loc} ({start} - {end}) \n"))
}

print_highlights <- function(path){
  highlights <- readcsv(glue::glue("{path}highlights.csv"))
  print(glue::glue_data(highlights, "- [{Text}]({Link}) \n"))
}

# Licensing and Copyright

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('<i class="far fa-copyright"></i> 2020 - {current_year} -- Kyle Tolliver'))
}

copyright_current <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('<i class="far fa-copyright"></i> {current_year} -- Kyle Tolliver'))
}

licence <- function(file){
  pander::pander(glue::glue('
  <ul>

  <li>[Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io).
  <li>Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.Rmd) and [Yaml](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/_site.yml) files. </li>
  <li>Website is developed in [R](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/script.R), [HTML](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.html), [CSS](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/site.css) and [Javascript](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/script.js). </li>

  </ul>

  '))
}

footer <- function(file){
  pagebreak <- pagebreak()
  copyright <- copyright()
  licence <- licence(file)
  string <- "javascript:showhide('copyright')"

  pander::pander(glue::glue('
  {pagebreak}<footer><div style="padding-left:0px;">
  <span class="tooltipr"><a href={string}><p style="color:blue;">{copyright}</p></a></span>
  <div id="copyright" style="display:none;padding-left:20px;">{licence}
  </div></div></footer>
  '))
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

  ### Knit the HTML version
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = FALSE), output_file = glue::glue("{file}.html"))

  ### Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = tmp_html_cv_loc)

  ### Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc, output = glue::glue("{file}.pdf"))
}

## Render Everything

render_all <- function(){
  render_web()
  setwd("./site_libs/resume")
  render_resume()
  setwd("../..")
}