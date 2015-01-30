require(quantmod)
require(ggplot2)
require(xlsx)
TB<-getSymbols("3356.TW",from = "2012-01-01",to = Sys.Date(),src = "yahoo",auto.assign=FALSE)
TWII<-getSymbols("^TWII",from = "2012-01-01",to = Sys.Date(),src = "yahoo",auto.assign=FALSE)
length(TB)
length(TWII)
cltb<-Cl(TB)
cltw<-Cl(TWII)
names(TB)
cltb2<-cltb[time(TWII),]
cor(cltw[time(cltb2),],cltb2)

