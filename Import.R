library(readxl)
Rangsor <- read_excel("kalicz_peti_CEE_abrak.xlsx")
names(Rangsor) <- c("Country", "Index")
RangsorO <- Rangsor[order(Rangsor$Index, decreasing = TRUE),]
factor(RangsorO$Country, levels = RangsorO$Country)
makeRangsor(RangsorO)
