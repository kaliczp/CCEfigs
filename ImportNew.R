library(readxl)
#############
### Second table
#############
# Get indicator type Harvested ... e.g.
T1SubsectRegion.Type <- unlist(read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'A2:A6'), use.names = FALSE)
## Remove unit
T1SubsectRegion.Type <- unlist(strsplit(T1SubsectRegion.Type, ","))[c(TRUE, FALSE)]
T1SubsectRegion.Type[4:5] <- c("Gross prod. in agriculture", "Area in harvested area")
T1SubsectRegion.Region <- as.character(read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B7:H7'))
T1SubsectRegion.Product <- c("Cereals", "Oil crops", "Fruits", "Vegetables", "Roots and tubers", "SUM")
## Cereals
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B2:H6')
T1Cereals <- data.frame(Product = T1SubsectRegion.Product[1],
                        Region = rep(T1SubsectRegion.Region, each = 5),
                        Type = T1SubsectRegion.Type,
                        Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                        )
## Oil crops
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B10:H14')
T1OilCrops <- data.frame(Product = T1SubsectRegion.Product[2],
                         Region = rep(T1SubsectRegion.Region, each = 5),
                         Type = T1SubsectRegion.Type,
                         Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                         )
## Fruits
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B18:H22')
T1Fruits <- data.frame(Product = T1SubsectRegion.Product[3],
                             Region = rep(T1SubsectRegion.Region, each = 5),
                             Type = T1SubsectRegion.Type,
                             Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                             )
## Vegetables
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B26:H30')
T1vegetables <- data.frame(Product = T1SubsectRegion.Product[4],
                           Region = rep(T1SubsectRegion.Region, each = 5),
                           Type = T1SubsectRegion.Type,
                           Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                           )
## Roots and tubers
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B34:H38')
T1roots <- data.frame(Product = T1SubsectRegion.Product[5],
                      Region = rep(T1SubsectRegion.Region, each = 5),
                      Type = T1SubsectRegion.Type,
                      Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                      )
## Roots and tubers
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak_2026-06-05.xlsx", sheet = 1, col_names = FALSE, range = 'B42:H46')
T1sum <- data.frame(Product = T1SubsectRegion.Product[6],
                      Region = rep(T1SubsectRegion.Region, each = 5),
                      Type = T1SubsectRegion.Type,
                      Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                      )
## All together
T1.df <- rbind(T1Cereals, T1OilCrops, T1Fruits, T1vegetables, T1roots, T1sum)
## Factor
T1.df$Product <- factor(T1.df$Product, levels = T1SubsectRegion.Product)
T1.df$Region <- factor(T1.df$Region, levels = T1SubsectRegion.Region)
T1.df$Type <- factor(T1.df$Type, levels = T1SubsectRegion.Type[5:1])
## Unify spread in all Type
OrderStandard <- order(T1.df[, "Type"])
MakeStandard.df <- T1.df[OrderStandard, c("Type","Diff")]
IsStdTyp <- unlist(tapply(MakeStandard.df[, "Diff"],
                          MakeStandard.df[, "Type"],
                          FUN = function(x) as.numeric(scale(x, center = FALSE)), simplify = TRUE))
T1.df[, "Standard"] <- IsStdTyp[order(OrderStandard)]
## Increase negative value for more blue
T1.df[T1.df$Standard < 0, "Standard"] <- T1.df[T1.df$Standard < 0, "Standard"] * 2
## Uniformly standardised values
T1.df$UniStandard <- scale(T1.df$Diff, center = FALSE)
T1.df[T1.df$UniStandard < 0, "UniStandard"] <- T1.df[T1.df$UniStandard < 0, "UniStandard"] * 5
