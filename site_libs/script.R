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

### {title}

{start} - {end} - {loc}

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

{end} - {loc}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"
  } else {
    
    glue_template <- "
### {title}

{start} - {end} - {time}

- {description_1}
- {description_2}
- {description_3}
\n\n\n"
  }
  
  section_data <- dplyr::filter(cv, section == section_id)
  
  print(glue::glue_data(section_data, glue_template))
}