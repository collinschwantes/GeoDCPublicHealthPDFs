## PDF Tools
library(httr)
library(stringr)
library(dplyr)
library(pdftools)

PahoPDF <- GET(url = "https://www.paho.org/hq/index.php?option=com_docman&view=download&category_slug=cumulative-cases-pdf-8865&alias=43296-zika-cumulative-cases-4-january-2018-296&Itemid=270&lang=en")

PDFraw <- content(x = PahoPDF,as = "raw")

dir.create("./examplePDFs")

writeBin(object = PDFraw, con = "./ExamplePDFs/Paho.pdf")


pdf_text(pdf = "./examplePDFs/Paho.PDF")


