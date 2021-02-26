# Variables

here <- here::here() ## set here file path
user <- "kctolli" ## set user
datapath <- "./site_libs/data/" ## data path for website

# Basic Functions

load_libraries <- function(){
  knitr::opts_chunk$set(results = 'asis', echo = FALSE, message = FALSE, warning = FALSE) ## Chunk Displays
  pacman::p_load(tidyverse, glue, pacman, pander, lubridate)
  
}

# R to HTML Functions

pagebreak <- function(){pander::pander('<hr /> <div style="clear:both;"></div>')}
paragraph <- function(par){pander::pander('<p>{par}</p>')}

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
  <hr/><div style="clear:both;"></div>
  ')
}

## CSS
w3css <- function(){pander::pander('<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">')}
bootstrap3 <- function(){pander::pander('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">')}
bootstrap4 <- function(){pander::pander('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">')}

# Section Templates

section <- function(cv, section_id, glue_template){
  section_data <- dplyr::filter(cv, section == section_id)
  print(glue::glue_data(section_data, glue_template))
}

print_section <- function(cv, section_id){
  
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

# Basic Templates

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
  highlights <- readr::read_csv(glue::glue("{path}highlights.csv"))
  glue::glue_data(highlights, "- [{Text}]({Link}) \n")
}

# Licensing and Copyright

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© 2020 - {current_year} -- Kyle Tolliver'))
}

copyright_current <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© {current_year} -- Kyle Tolliver'))
}

licence <- function(file){
  pander::pander(glue::glue("
- [Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://github.com/kctolli/kctolli.github.io/blob/master/site_libs/GNU.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io). 
- Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.Rmd) and [Yaml](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/_site.yml) files. 
- Website is developed in [R](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/script.R), [HTML](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.html), [CSS](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/site.css) and [Javascript](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/script.js)."))
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
  
  ### Knit the HTML version
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = FALSE), output_file = glue::glue("{file}.html"))
  
  ### Knit the PDF version to temporary html location
  tmp_html_cv_loc <- fs::file_temp(ext = ".html")
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = tmp_html_cv_loc)
  
  ### Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc, output = glue::glue("{file}.pdf"))
}