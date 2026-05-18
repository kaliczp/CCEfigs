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
T1SubsectRegion.Type <- as.character(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B2:L2'))
T1SubsectRegion.Type <- T1SubsectRegion.Type[!T1SubsectRegion.Type == "NA"]
T1SubsectRegion.Date <- as.character(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B3:M3'))
T1SubsectRegion.Region <- as.character(t(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'A5:A11')))
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B5:M11')

data.frame(Region = rep(T1SubsectRegion.Region),
           Type = rep(T1SubsectRegion.Type, each = 14),
           Date = rep(T1SubsectRegion.Date, each = 7),
           Value = as.numeric(as.matrix(T1SubsectRegion))
           )
