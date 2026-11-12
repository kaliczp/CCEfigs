library(readxl)
#############
### New table
#############
raw <- as.data.frame(read_excel("uj_tabla-abra.xlsx"))

for(nColumn in 2:ncol(raw)){
    raw[, nColumn] <- as.numeric(gsub("\\+","",raw[ , nColumn]))
}
