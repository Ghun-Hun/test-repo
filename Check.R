require(quantmod)
require(ggplot2)
gs="1310.TW"
getSymbols(gs)
TB<-get(gs)
chartSeries(TB,subset='2014-12::2015', theme="white", TA="addMACD();addVo();addEMA(n=5)") 
ncl<-Next(Cl(TB['2014-12::2015']))
clc<-Cl(TB['2014-12::2015'])
clv<-Vo(TB['2014-12::2015'])
Temp<-clc[time(clc),]
for (i in 1:length(clc)){
  Temp[i] <- (ncl[i]-clc[i])*clv[i]
}
temp=clc[time(clc),]
temp[1]<-0
for (i in 2:length(clc)){
  ggg=data.frame(Temp[i],Temp[i-1])
  temp[i] <-(ggg[,1]*2+ggg[,2])/3
}
addTA(temp,col='blue', type='h')

