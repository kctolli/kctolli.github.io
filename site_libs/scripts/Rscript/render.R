source("../site.R")
library(rmarkdown)
setwd(here)

# Render Functions

## Knit the HTML version of web pages
render_web <- function(){
  render("index.rmd", params = list(pdf_mode = FALSE), output_file = "index.html")
  render("pos.rmd", params = list(pdf_mode = FALSE), output_file = "pos.html")
  render("projects.rmd", params = list(pdf_mode = FALSE), output_file = "projects.html")
  render("skills.rmd", params = list(pdf_mode = FALSE), output_file = "skills.html")
  render("work.rmd", params = list(pdf_mode = FALSE), output_file = "work.html")
}

## Knit the Resume to html and pdf
render_resume <- function(){
  file <- "resume" ### Resume file name
  tmp_html <- fs::file_temp(ext = ".html") ### Create a temp html file
  
  ### Knit the HTML version
  render(glue::glue("{file}.rmd"), params = list(pdf_mode = FALSE), output_file = glue::glue("{file}.html"))
  
  ### Knit the PDF version to temporary html location
  render(glue::glue("{file}.rmd"), params = list(pdf_mode = TRUE), output_file = tmp_html)
  
  ### Convert to PDF using Pagedown
  pagedown::chrome_print(input = tmp_html, output = glue::glue("{file}.pdf"))
  
  file.remove(tmp_html) ### Delete temp html file
}

## Render Everything

render_all <- function(){
  render_web()
  setwd("./site_libs/resume")
  render_resume()
  setwd("here")
}

# Call Functions

render_web()
render_resume()
render_all()