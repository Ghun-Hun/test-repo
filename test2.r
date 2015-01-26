#sse<-getSymbols("1310.TW",from = "2002-01-01",to = Sys.Date(),src = "yahoo")
#tail(sse)
#这个结果里边，2003年9月的成交量是错误的。
#修改之后，画个图看看
#candleChart(sse,theme="white")
library(quantmod)
setSymbolLookup(z=list(name="1310.TW",from = "2012-01-01",to = Sys.Date(),src = "google",auto.assign=FALSE))
setSymbolLookup(V=list(name="^TWII",from = "2012-01-01",to = Sys.Date(),src = "google",auto.assign=FALSE))
getSymbols("z")#会输出符号Z
getSymbols("V")#会输出符号V
tail(Z)
tail(V)
length(Z)
length(V)
candleChart(Z,theme="white")
candleChart(V,theme="white")
row.names(V)
