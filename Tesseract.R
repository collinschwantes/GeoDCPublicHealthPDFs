## OCR finnicky for tables because of sparse text distribution
## tutorial https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html

library(tesseract)
library(dplyr)
library(magick)


img <- "https://gallery.mailchimp.com/89e5755d2cca4840b1af93176/images/62e6af37-9999-49f3-b6ef-30b56ede0459.png"

EbolaText <- ocr(engine = tesseract("fra"),image = img)

cat(EbolaText)

#check out all of these parameters!
tesseract_params() %>% View()

#preprocess your image

imgp <- img %>%   image_read() %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) 

#set engine parameters to look for tables

EbolaText <- ocr(engine = tesseract("fra",
                      options = list(tessedit_pageseg_mode = 'auto',
                           textord_tabfind_find_tables = '1',
                           textord_tablefind_recognize_tables = '1')),
                        image = imgp)

cat(EbolaText)

## with crop

library(magick)
library(tesseract)

img <- "./examplePDFs/EbolaCropHZ.png"

imgp <- img %>%   image_read() %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) 

#set engine parameters to look for tables

EbolaText <- ocr(engine = tesseract("fra",
                                    options = list(tessedit_pageseg_mode = 'auto',
                                                   textord_tabfind_find_tables = '1',
                                                   textord_tablefind_recognize_tables = '1')),
                 image = imgp)

cat(EbolaText)

