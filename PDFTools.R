## PDF Tools
library(httr)
library(stringr)
library(dplyr)
library(pdftools)

PahoPDF <- GET(url = "https://www.paho.org/hq/index.php?option=com_docman&view=download&category_slug=cumulative-cases-pdf-8865&alias=43296-zika-cumulative-cases-4-january-2018-296&Itemid=270&lang=en")

PDFraw <- content(x = PahoPDF,as = "raw")

dir.create("./examplePDFs")

writeBin(object = PDFraw, con = "./ExamplePDFs/Paho.pdf")

textPAHO <- pdf_text(pdf = "./examplePDFs/Paho.PDF")

pahotext <- pdf_text(pdf = pathPAHO)[[1]]

#see note below
pahotext <- gsub(pattern = "Guadeloupe\n               ⁷,⁹",replacement = "Guadeloupe",x = pahotext)
#see note below
matches <- gregexpr(pattern = "North America|Subtotal",text  = pahotext)

tableText <- str_sub(string = pahotext,
                     start = (matches[[1]][1] + 14),
                     end = c(matches[[1]][length(matches[[1]])]-1))


tableText <- gsub(pattern = "Guadeloupe\n               ⁷,⁹",replacement = "Guadeloupe",x = tableText)

tableText <- gsub(pattern = "Saint Barthelemy\n                     ⁷",replacement = "Saint Barthelemy",x = tableText)

#split on line breaks
PAHOstr <- str_split(string = tableText,pattern = "\n")

str(PAHOstr)

a <-  PAHOstr %>% 
  map(str_split,pattern = "     ") %>% 
  flatten()


## look for patterns
a %>% map(length) %>% unlist %>% mean()
a %>% keep(~length(.x) < 37)

b <- a %>% discard(~length(.x) < 37) %>% map(trimws) %>% 
  map(gsub,pattern = ",", replacement = "") 

str(b)
b[[1]][1]

length(b[[1]])

# you try to do things the right way, 
#until its too easy to do it the wrong way

ValuePuller <- function(x) {
  ab <- list()
  
  for(i in 1:length(x)) {
    
    li <- x[i]
    
    if(nchar(li) > 0) {
      ab[i] <- li 
    } 
  }
  return(unlist(ab))
}

dataPaho <- b %>% map(ValuePuller)

PAHOtb <- do.call(rbind,dataPaho)

PAHOtb <- as_tibble(PAHOtb)

names(PAHOtb) <- c("Country", "Suspected","Confirmed", "Imported","Incidence","Deaths","ZikaCS","Pop")

PAHOtb$Country <- gsub(pattern = "[^[:alpha:]| ]",replacement = "",x = PAHOtb$Country)


