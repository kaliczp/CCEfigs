library(readxl)
## First table heat index
Rangsor <- read_excel("kalicz_peti_CEE_abrak.xlsx")
names(Rangsor) <- c("Country", "Index")
## Abbreviated names
Rangsor[c(4, 7, 23, 24, 36, 39),"Country"] <- c("Azerb.", "Bosnia", "Netherl.", "N. Maced.", "Switzerl.", "U. K.")
RangsorO <- Rangsor[order(Rangsor$Index),]
RangsorO$Country <- factor(RangsorO$Country, levels = RangsorO$Country)
makeRangsor(RangsorO, xlim = c(-6,33))

### Second table
T1SubsectRegion.Type <- as.character(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B2:L2'))
T1SubsectRegion.Type <- T1SubsectRegion.Type[!T1SubsectRegion.Type == "NA"]
T1SubsectRegion.Date <- as.character(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B3:M3'))
T1SubsectRegion.Region <- as.character(t(read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'A5:A11')))

T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B5:M11')

## Harvested area, 100000 ha
T1harvest <- data.frame(Region = rep(T1SubsectRegion.Region),
                        Type = rep(T1SubsectRegion.Type, each = 14),
                        Date = rep(T1SubsectRegion.Date, each = 7),
                        Value = as.numeric(as.matrix(T1SubsectRegion))
                        )

## Production quantity, million t
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B13:M19')

T1production <- data.frame(Region = rep(T1SubsectRegion.Region),
                        Type = rep(T1SubsectRegion.Type, each = 14),
                        Date = rep(T1SubsectRegion.Date, each = 7),
                        Value = as.numeric(as.matrix(T1SubsectRegion))
                        )

## Gross production, billion USD
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B21:M27')

T1grossprodUSD <- data.frame(Region = rep(T1SubsectRegion.Region),
                             Type = rep(T1SubsectRegion.Type, each = 14),
                             Date = rep(T1SubsectRegion.Date, each = 7),
                             Value = as.numeric(as.matrix(T1SubsectRegion))
                             )

## Gross production in agriculture, %
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B29:M35')

T1grossprodagrperc <- data.frame(Region = rep(T1SubsectRegion.Region),
                             Type = rep(T1SubsectRegion.Type, each = 14),
                             Date = rep(T1SubsectRegion.Date, each = 7),
                             Value = as.numeric(as.matrix(T1SubsectRegion))
                             )

## Area in agricultural lands, %
T1SubsectRegion <- read_excel("kalicz_peti_CEE_abrak.xlsx", sheet = 2, col_names = FALSE, range = 'B37:M43')

T1agrland <- data.frame(Region = rep(T1SubsectRegion.Region),
                        Type = rep(T1SubsectRegion.Type, each = 14),
                        Date = rep(T1SubsectRegion.Date, each = 7),
                        Value = as.numeric(as.matrix(T1SubsectRegion))
                        )

T1.df <- rbind(T1grossprodUSD, T1grossprodUSD, T1grossprodUSD, T1grossprodagrperc, T1agrland)
T1.df$Variable <- rep(c("Harvested", "Quantity", "ProdUSD", "ProdAgrperc", "Area"), each = 84)

T1.pre <- T1.df[T1.df$Date == "1993-1997", -3]
T1.post <- T1.df[T1.df$Date == "2018-2022", -3]

T1.diff <- cbind(T1.pre[, c(1:2,4)] , T1.pre[,3], T1.post[,3])
colnames(T1.diff) <- c("Region", "Type", "Variable", "D1993-97", "D2018-22")

T1.diff$Diff <- T1.diff[,5] - T1.diff[,4]

T1.diff.nsum <- T1.diff[!T1.diff$Type == "SUM*", ]

## Order by factor
T1.diff.nsum$Region <- factor(T1.diff.nsum$Region, levels = T1SubsectRegion.Region)
