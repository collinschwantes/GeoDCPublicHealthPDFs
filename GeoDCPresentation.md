Parsing Public Health PDF's
========================================================
author: Collin Schwantes
date: 04 February 2019
autosize: true

Why Should I care? 
========================================================
 
- Ebola
- Hantavirus
- Vaccine preventable diseases
- lead poisoning

Why PDFs?
========================================================

### PDF's are EVERYWHERE in Govt. and especially in Public Health
- World Health Organization
- Minstry of Health Madagascar
- Your local public health department*
  - * willing to bet you a beer

Why Are PDF's hard to work with?
========================================================

- Designed to be human readable
- Designed to be printed
- NOT designed as a machine-readable data store

But isn't the XML uniform and manipulatable?
========================================================
# Not really
![SoCloseDog](https://media.giphy.com/media/jBAhj7U5Zptvy/giphy.gif)

So you're just manipulating strings?
========================================================
Hopefully!

![SwimBabyturtle](https://media.giphy.com/media/SYXo0GITROlEs/giphy.gif)


What are my options?
========================================================
- PDFTools - text based pdfs
- XMLTools - sometimes its easier
- Tesseract - OCR without leaving R 

Why use OCR?
========================================================

PDFs and websites often contain content in images.
- most OCR works best in dense text settings
- Adobe OCR works pretty well for tables sometimes 
- Tesseract in R requires a lot of finessing


What can go wrong: OCR Tesseract
========================================================
# I TRIED
it is finnicky, the params list is a mile long

```
SITUATION EPIDEMIOLOGIQUE MALADIE A VIRUS EBOLA (03/02/2019)

D mo fr este
en À 2) 0) +)
Biens À" + GC
tee À 56 GE
Goma À  " 0Ù "GE CE
tan À CC
kate À fus nu <
aire À GC
kyonco À") | UT
ere À" "0 "GS CR
Mahal [5% 2 <<
argus À" 5 GS
seek À 7" <  C
usienene À 6" <  C
ange À 4 CS
ich À "25" GS
Bo OS
fomaes — ÀÙ 27
Eendime —À " 27  <S  C
Eenianee À" "24" "GE
Echo © 2 CE

et À 2] |] 8
```


How to fix: OCR issues
========================================================

XMLTools
========================================================
This works really well when you can convert a pdf to html  
- Especially useful if you need to use translation services
- Sometimes tables come out in perfectly coded html



