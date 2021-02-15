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
    
  section_data <- dplyr::filter(cv, section == section_id)
  
  print(glue::glue_data(section_data, glue_template))
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
  
  section_data <- dplyr::filter(cv, section == section_id)
  
  print(glue::glue_data(section_data, glue_template))
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
  
  section_data <- dplyr::filter(cv, section == section_id)
  
  print(glue::glue_data(section_data, glue_template))
}

resume <- function(cv){cv %>% filter(in_resume)}

copyright <- function(){
  current_year <- lubridate::year(Sys.Date())
  pander::pander(glue::glue('© 2020 - {current_year} -- Kyle Tolliver'))
}

# Knit the HTML version
render_all <- function(){
  rmarkdown::render("index.rmd", params = list(pdf_mode = FALSE), output_file = "index.html")
  rmarkdown::render("pos.rmd", params = list(pdf_mode = FALSE), output_file = "pos.html")
  rmarkdown::render("projects.rmd", params = list(pdf_mode = FALSE), output_file = "projects.html")
  rmarkdown::render("skills.rmd", params = list(pdf_mode = FALSE), output_file = "skills.html")
  rmarkdown::render("work.rmd", params = list(pdf_mode = FALSE), output_file = "work.html")
}