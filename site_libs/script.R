# Variables

here <- here::here() ## set here file path
user <- "kctolli" ## set user
datapath <- "./site_libs/data/" ## data path for website

# Basic Functions

pagebreak <- function(){pander::pander('<hr /> <div style="clear:both;"></div>')}

load_libraries <- function(){
  knitr::opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE)
  pacman::p_load(tidyverse, glue, pacman, pander)
  
}

# R to HTML Functions

user_stats <- function(){
  pander::pander(glue::glue('<div align="center"><img style="max-width:100%;" height="160" align="center" 
  src="https://github-readme-stats.vercel.app/api/top-langs/?username={user}&layout=compact&theme=gruvbox" /></div>'))
}

nav <- function(){
  pander::pander('
  <script src="./site_libs/script.js"></script>
  
  <hr/><nav class="info"><p>How to navigate this website: </p><ul>
  <li><span style="color:blue;">Blue</span> text - Clickable (Click to see pop up links or new pages)</li>
  <li><span style="color:gray;">Gray</span> text - Hoverable (Hover to get more information)</li>
  </ul></nav>
  
  <button class="btn" onclick="darkmode()"><i class="fas fa-adjust">Toggle Dark Mode</i></button><hr/>
  ')
}

# Section Templates

section <- function(cv, section_id, glue_template){
  section_data <- dplyr::filter(cv, section == section_id)
  print(glue::glue_data(section_data, glue_template))
}

print_section <- function(cv, section_id){
  
  if(cv$start == cv$end){
    
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

print_work <- function(cv){
  
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

print_project <- function(cv){
  
  section_id = 'projects'

  if(cv$start == cv$end){
  
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

print_TA <- function(cv){
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

print_pos <- function(cv, section_id){
  
  glue_template <- "
- {name}\n"
  
  section(cv, section_id, glue_template)
}

print_contact <- function(info){
  print(glue::glue_data(info, "<i class='fa fa-{icon}'></i> [{contact}]({link}) \n\n"))
}

print_skills <- function(path){
  skills <- readr::read_csv(glue::glue("{path}skills.csv"))
  print(glue::glue_data(skills, "- {skill} \n"))
}

print_soc <- function(path){
  soc <- readr::read_csv(glue::glue("{path}society.csv"))
  glue::glue_data(soc, "- {group} associated with {loc} ({start} - {end}) \n")
}

print_highlights <- function(path){
  highlights <- read_csv(glue("{path}highlights.csv"))
  glue_data(highlights, "- [{Text}]({Link}) \n")
}

# Licensing and Copyright

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© 2020 - {current_year} -- Kyle Tolliver'))
}

licence <- function(file){
  pander::pander(glue::glue("
- [Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io). 
- Website is made using [Rstudio](https://rstudio.com/) with [Rmd](./{file}.Rmd) and [Yaml](./_site.yml) files. 
- Website is developed in [R](./site_libs/script.R), HTML, [CSS](./site_libs/site.css) and [Javascript](./site_libs/script.js)."))
}

# Renders

## Knit the HTML version of all pages
render_all <- function(){
  rmarkdown::render("index.rmd", params = list(pdf_mode = FALSE), output_file = "index.html")
  rmarkdown::render("pos.rmd", params = list(pdf_mode = FALSE), output_file = "pos.html")
  rmarkdown::render("projects.rmd", params = list(pdf_mode = FALSE), output_file = "projects.html")
  rmarkdown::render("skills.rmd", params = list(pdf_mode = FALSE), output_file = "skills.html")
  rmarkdown::render("work.rmd", params = list(pdf_mode = FALSE), output_file = "work.html")
}

## Knit the Resume to html and pdf
render_resume <- function(){
  file <- "resume" # Resume file name
  
  # Knit the HTML version
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = FALSE), output_file = glue::glue("{file}.html"))
  
  # Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = tmp_html_cv_loc)
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc, output = glue::glue("{file}.pdf"))
}