## OCR finnicky for tables because of sparse text distribution

library(tesseract)
library(dplyr)

EbolaText <- ocr(engine = tesseract("fra"),image = "https://gallery.mailchimp.com/89e5755d2cca4840b1af93176/images/62e6af37-9999-49f3-b6ef-30b56ede0459.png")

cat(EbolaText)

tesseract("fra")

tesseract_params() %>% View()
