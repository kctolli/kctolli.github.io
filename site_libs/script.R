# Variables

here <- here::here() ## set here file path
user <- "kctolli" ## set user

# Basic Functions

pagebreak <- function(){pander::pander('<hr /> <div style="clear:both;"></div>')}

resume <- function(cv){dplyr::filter(cv, in_resume)}

load_libraries <- function(){
  knitr::opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE)
  pacman::p_load(tidyverse, glue, pacman)
}

user_stats <- function(){
  pander::pander(glue::glue('<div align="center"><img style="max-width:100%;" height="160" align="center" 
  src="https://github-readme-stats.vercel.app/api/top-langs/?username={user}&layout=compact&theme=gruvbox" /></div>'))
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

# Licensing and Copyright

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© 2020 - {current_year} -- Kyle Tolliver'))
}

licence <- function(){
  
  template <- "
- [Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU General Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt). 
- Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://rmarkdown.rstudio.com/index.html) and [Yaml](https://github.com/kctolli/kctolli.github.io/blob/master/_site.yml) files. 
- Website is developed in [R](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/script.R), HTML, CSS and [Javascript](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/script.js). 
- Hosted on [github](https://github.com/kctolli/kctolli.github.io)."
  
  pander::pander(template)
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