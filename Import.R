library(readxl)
Rangsor <- read_excel("kalicz_peti_CEE_abrak.xlsx")
names(Rangsor) <- c("Country", "Index")
makeRangsor(Rangsor)
