library(readxl)
#############
### Third table
#############
T2SubsectRegion.Type <- unlist(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'A2:A7'), use.names = FALSE)
## Remove unit
T2SubsectRegion.Type <- unlist(strsplit(T2SubsectRegion.Type, ","))[c(TRUE, FALSE)]
T2SubsectRegion.Type[6] <- "Ratio in agr. gross prod."
T2SubsectRegion.Region <- as.character(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B8:H8'))
T2SubsectRegion.Product <- c("Wheat", "Maize", "Barley", "Rapeseed", "Sunflower")
#####
## Wheat
#####
T2SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B2:H7')
T2Wheat <- data.frame(Product = T2SubsectRegion.Product[1],
                      Region = rep(T2SubsectRegion.Region, each = 6),
                      Type = T2SubsectRegion.Type,
                      Diff = round(as.numeric(as.matrix(T2SubsectRegion)))
                      )
#####
## Maize
#####
T2SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B11:H16')
T2Maize <- data.frame(Product = T2SubsectRegion.Product[2],
                      Region = rep(T2SubsectRegion.Region, each = 6),
                      Type = T2SubsectRegion.Type,
                      Diff = round(as.numeric(as.matrix(T2SubsectRegion)))
                      )
#####
## Barley
#####
T2SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B20:H25')
T2Barley <- data.frame(Product = T2SubsectRegion.Product[3],
                       Region = rep(T2SubsectRegion.Region, each = 6),
                       Type = T2SubsectRegion.Type,
                       Diff = round(as.numeric(as.matrix(T2SubsectRegion)))
                       )
#####
## Rapeseed
#####
T2SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B29:H34')
T2Rapeseed <- data.frame(Product = T2SubsectRegion.Product[4],
                       Region = rep(T2SubsectRegion.Region, each = 6),
                       Type = T2SubsectRegion.Type,
                       Diff = round(as.numeric(as.matrix(T2SubsectRegion)))
                       )
#####
## Sunflower
#####
T2SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = FALSE, range = 'B38:H43')
T2Sunflower <- data.frame(Product = T2SubsectRegion.Product[5],
                       Region = rep(T2SubsectRegion.Region, each = 6),
                       Type = T2SubsectRegion.Type,
                       Diff = round(as.numeric(as.matrix(T2SubsectRegion)))
                       )
## All together
T2.df <- rbind(T2Wheat, T2Maize, T2Barley, T2Rapeseed, T2Sunflower)
## Factor from character
T2.df$Product <- factor(T2.df$Product, levels = T2SubsectRegion.Product)
T2.df$Region <- factor(T2.df$Region, levels = T2SubsectRegion.Region)
T2.df$Type <- factor(T2.df$Type, levels = T2SubsectRegion.Type[6:1])
## Unify spread in all Type
OrderStandard <- order(T2.df[, "Type"])
MakeStandard.df <- T2.df[OrderStandard, c("Type","Diff")]
IsStdTyp <- unlist(tapply(MakeStandard.df[, "Diff"],
                          MakeStandard.df[, "Type"],
                          FUN = function(x) as.numeric(scale(x, center = FALSE)), simplify = TRUE))
T2.df[, "Standard"] <- IsStdTyp[order(OrderStandard)]
## Increase negative value for more blue
T2.df[T2.df$Standard < 0, "Standard"] <- T2.df[T2.df$Standard < 0, "Standard"] * 4
