library(readxl)
#############
### Second table
#############
T1SubsectRegion.Type <- unlist(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'A2:A6'), use.names = FALSE)
T1SubsectRegion.Region <- as.character(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B7:H7'))
T1SubsectRegion.Product <- c("Cereals", "Oil crops", "Fruits", "Vegetables", "Roots and tubers")

## Cereals
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B2:H6')

T1Cereals <- data.frame(Product = T1SubsectRegion.Product[1],
                        Region = rep(T1SubsectRegion.Region, each = 5),
                        Type = T1SubsectRegion.Type,
                        Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                        )

## Oil crops
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B10:H14')
T1OilCrops <- data.frame(Product = T1SubsectRegion.Product[2],
                         Region = rep(T1SubsectRegion.Region, each = 5),
                         Type = T1SubsectRegion.Type,
                         Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                         )

## Fruits
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B18:H22')
T1Fruits <- data.frame(Product = T1SubsectRegion.Product[3],
                             Region = rep(T1SubsectRegion.Region, each = 5),
                             Type = T1SubsectRegion.Type,
                             Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                             )

## Vegetables
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B26:H30')
T1vegetables <- data.frame(Product = T1SubsectRegion.Product[4],
                           Region = rep(T1SubsectRegion.Region, each = 5),
                           Type = T1SubsectRegion.Type,
                           Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                           )

## Roots and tubers
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B34:H38')
T1roots <- data.frame(Product = T1SubsectRegion.Product[5],
                      Region = rep(T1SubsectRegion.Region, each = 5),
                      Type = T1SubsectRegion.Type,
                      Diff = round(as.numeric(as.matrix(T1SubsectRegion)))
                      )
T1.df <- rbind(T1Cereals, T1OilCrops, T1Fruits, T1vegetables, T1roots)


T1.df$Product <- factor(T1.df$Product, levels = T1SubsectRegion.Product)
T1.df$Region <- factor(T1.df$Region, levels = T1SubsectRegion.Region)
T1.df$Type <- factor(T1.df$Type, levels = T1SubsectRegion.Type[5:1])

#############
### Third table
#############
read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = F)
