# Knit the HTML version
rmarkdown::render("index.rmd", params = list(pdf_mode = FALSE), output_file = "index.html")
rmarkdown::render("pos.rmd", params = list(pdf_mode = FALSE), output_file = "pos.html")
rmarkdown::render("projects.rmd", params = list(pdf_mode = FALSE), output_file = "projects.html")
rmarkdown::render("skills.rmd", params = list(pdf_mode = FALSE), output_file = "skills.html")
rmarkdown::render("work.rmd", params = list(pdf_mode = FALSE), output_file = "work.html")
