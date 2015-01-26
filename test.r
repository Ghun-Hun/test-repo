require(quantmod)
require(ggplot2)
getSymbols("1310.TW")
getSymbols("^TWII")
TB<-get("1310.TW")
length(TB)
length(TWII)
date <- as.Date(time(TWII))
TWII[date,TWII.TW.Adjusted]

