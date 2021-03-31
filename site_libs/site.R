source("https://raw.githubusercontent.com/kctolli/scripting/main/Rscript/include.R")

# Section Templates

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

# Utilities

nav <- function(){
  pagebreak <- pagebreak()
  showhide <- showhide()
  darkmode <- darkmode()
  yaml <- yaml_css()
  site <- site_css()
  
  pander(glue('{site}{yaml}{showhide}{darkmode}{pagebreak}<nav class="info"><p>How to navigate this website: </p><ul>
  <li><span style="color:blue;">Blue</span> text - Clickable (Click to see pop up links or new pages)</li>
  <li><span style="color:gray;">Gray</span> text - Hoverable (Hover to get more information)</li></ul>
  <button class="btn" onclick="darkmode()"><i class="fas fa-adjust">Toggle Dark Mode</i></button></nav>{pagebreak} \n\n\n'))
}

footer <- function(file){
  pagebreak <- pagebreak()
  copyright <- copyright(2020)
  
  pander(glue('\n\n\n{pagebreak}<footer><div style="padding-left:0px;"><span class="tooltipr"><a href="javascript:showhide(\'copyright\')">
  <p style="color:blue;">{copyright}</p></a></span><div id="copyright" style="display:none;padding-left:20px;"><ul>
  <li>[Licensed](https://github.com/kctolli/kctolli.github.io/blob/master/LICENSE) under [GNU Public License v3.0](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/LICENSE.txt) and hosted on [Github](https://github.com/kctolli/kctolli.github.io). </li>
  <li>Website is made using [Rstudio](https://rstudio.com/) with [Rmd](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/{file}.Rmd) and [Yaml](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/_site.yml) files. </li>
  <li>Website is developed in [R](https://raw.githubusercontent.com/kctolli/kctolli.github.io/master/site_libs/site.R) with HTML, CSS and Javascript. </li></ul></div></div></footer>'))
}