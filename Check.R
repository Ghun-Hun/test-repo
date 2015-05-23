require(quantmod)
require(TTR)
require(ggplot2)
gs="2885.TW"
#gs="2891.TW"
getSymbols(gs)
TB<-get(gs)
tc<-getDividends(gs)
tf<-getFinancials("AAPL")
clc=Cl(TB["2014-12::2015"])
clv=Vo(TB["2014-12::2015"])
chartSeries(TB["2014-12::2015"],theme="white", TA="addMACD();addSMI();addEnvelope();addVo();addEMA(n=5);addEMA(n=22)") 
Temp=clc[time(clc),]
for (i in 2:length(clc)){
  ggg=data.frame(clc[i],clc[i-1])
  Temp[i] <- (ggg[,1]-ggg[,2])*clv[i]
}
temp=clc[time(clc),]
temp[1]<-0
for (i in 2:length(clc)){
  ggg=data.frame(Temp[i],Temp[i-1])
  temp[i] <-(ggg[,1]*2+ggg[,2])/3
}
v=addTA(temp,col='blue', type='h')
ClCl(TB["2014-12::2015"])
v1=addMACD()

