here <- here::here() # set here file path

pagebreak <- function(){pander::pander(glue::glue('<hr /> <div style="clear:both;"></div>'))}

resume <- function(cv){cv %>% filter(in_resume)}

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© 2020 - {current_year} -- Kyle Tolliver'))
}

section <- function(cv, section_id, glue_template){
  section_data <- dplyr::filter(cv, section == section_id)
  print(glue::glue_data(section_data, glue_template))
}

# Templates

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
  rmarkdown::render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = fs::file_temp(ext = ".html"))
  
  # Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html_cv_loc, output = glue::glue("{file}.pdf"))
}