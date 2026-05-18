library(readxl)
## First table heat index
Rangsor <- read_excel("kalicz_peti_CEE_abrak.xlsx")
names(Rangsor) <- c("Country", "Index")
## Abbreviated names
Rangsor[c(7, 23, 24, 36, 39),"Country"] <- c("Bosnia", "Netherl.", "N. Maced.", "Switzerl.", "U. K.")
RangsorO <- Rangsor[order(Rangsor$Index),]
RangsorO$Country <- factor(RangsorO$Country, levels = RangsorO$Country)
makeRangsor(RangsorO, xlim = c(-6,33))

## Second table
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2)
