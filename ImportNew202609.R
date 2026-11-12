library(readxl)
#############
### New table
#############
raw <- as.data.frame(read_excel("uj_tabla-abra_2026-11-12.xlsx"))

## Convert to numeric
for(nColumn in 2:ncol(raw)){
    raw[, nColumn] <- as.numeric(gsub("\\+","",raw[ , nColumn]))
}

## Create data.frame
TnewNov <- data.frame(
    Product = rep(colnames(raw)[-1], each = 24),
    Region = rep(rep(raw[seq(1,29,4), 1], each = 3), 5),
    Type = rep(raw[2:4, 1], 8 * 5),
    Value = as.numeric(as.matrix(raw[, -1])[-(seq(1,29,4)),])
)

## Factors
TnewNov$Product <- factor(TnewNov$Product, levels = colnames(raw)[-1])
TnewNov$Region <- factor(TnewNov$Region, levels = raw[seq(1,29,4), 1])
TnewNov$Type <- factor(TnewNov$Type, levels = (raw[2:4, 1])[3:1])
