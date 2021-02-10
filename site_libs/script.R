print_info <- function(cv){
  glue::glue_data(cv, "<i class='fa fa-{cv$icon}'></i> [{cv$contact}]({cv$link}) \n\n\n") %>% 
    print()
  invisible(cv)
}

# print_skill_bars <- function(cv, out_of = 5, bar_color = "#969696", bar_background = "#d9d9d9", glue_template = "default"){
#   
#   if(glue_template == "default"){
#     glue_template <- "
# <div
#   class = 'skill-bar'
#   style = \"background:linear-gradient(to right,
#                                       {bar_color} {width_percent}%,
#                                       {bar_background} {width_percent}% 100%);\"
# >{skill}</div>"
#   }
#   cv$skills %>%
#     dplyr::mutate(width_percent = round(100*as.numeric(level)/out_of)) %>%
#     glue::glue_data(glue_template) %>%
#     print()
#   
#   invisible(cv)
# }