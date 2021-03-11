library(googlesheets4, tidyverse)

gs4_deauth()

gsheet <- function(url){return(read_sheet(url) %>% na.omit())}

# Google Sheets Data Frames

solo <- gsheet("https://docs.google.com/spreadsheets/d/1ssrsSZjXRcv4Ylv6qdQABOZMul2GIsGLaJtRrzvitYA/edit#gid=1793356435")
society <- gsheet("https://docs.google.com/spreadsheets/d/1uX9-huAPB4NhljQ1gg20MF8qxQymxDtlQRZCpjwab7Q/edit#gid=684122786")
skills <- gsheet("https://docs.google.com/spreadsheets/d/15zrT7H7h0ElvXTdjjYGgx141UmHj3hTkhNc80YM_0Fg/edit#gid=1706649799")
pos <- gsheet("https://docs.google.com/spreadsheets/d/1abShAJWxWnrEIIbDx3IGbv6fEERrRXGp73gaNpp889c/edit#gid=1221874779")
highlights <- gsheet("https://docs.google.com/spreadsheets/d/1yVMadV6xJDm9pTY5VjbEeamzvUdH4GzR804npZP6y1s/edit#gid=1033572211")
entries <- gsheet("https://docs.google.com/spreadsheets/d/1xWg3dkO6oB2Krr24fCuxDsR0aFu8jVw35FGHvvsY5g0/edit#gid=1584869514")
contact <- gsheet("https://docs.google.com/spreadsheets/d/1TR2Bfxfzh6dWtnAbuhYM6JtU7rWTe_cLW68olas__fk/edit#gid=729993551")