library(readxl)
#############
### Second table
#############
T1SubsectRegion.Type <- as.character(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'A2:A6'))
T1SubsectRegion.Region <- as.character(read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B7:H7'))

## Cereals
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B2:H6')
T1Cereals <- data.frame(
                        Value = round(as.numeric(as.matrix(T1SubsectRegion)))
                        )

## Oil crops
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B10:H14')
T1OilCrops <- data.frame(
                        Value = round(as.numeric(as.matrix(T1SubsectRegion)))
                        )

## Fruits
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B18:H22')
T1grossprodUSD <- data.frame(
                             Value = round(as.numeric(as.matrix(T1SubsectRegion)))
                             )

## Vegetables
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B26:H30')
T1vegetables <- data.frame(
                             Value = round(as.numeric(as.matrix(T1SubsectRegion)))
                             )

## Roots and tubers
T1SubsectRegion <- read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 1, col_names = FALSE, range = 'B34:H38')
T1roots <- data.frame(
                        Value = round(as.numeric(as.matrix(T1SubsectRegion)))
                        )

#############
### Third table
#############
read_excel("kalicz_peti_tablaabrak.xlsx", sheet = 2, col_names = F)
