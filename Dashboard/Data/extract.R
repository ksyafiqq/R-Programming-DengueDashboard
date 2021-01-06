library(tesseract)

eng <- tesseract("eng")
text <- tesseract::ocr("C:/Users/muham/Documents/UMP/Sem7/FYP2/Dataset/Denggi/21Dec.png", engine = eng)

cat(text)


