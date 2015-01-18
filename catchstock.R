require(quantmod)
require(ggplot2)

getSymbols('AAPL')
x<-AAPL
start <- Sys.Date()-200
end <- Sys.Date()

#Pass an OHLC object into this function
#also pass two dates formatted as.Date()
ggChartSeries <- function(x, start, end){
  
  # the below is done redundantly for ease of maintenance later on
  #First, strip OHLC data (need to vectorize)
  date <- as.Date(time(x))
  open <- as.vector(Op(x))
  high <- as.vector(Hi(x))
  low <- as.vector(Lo(x))
  close <- as.vector(Cl(x))
  
  #Then build the data frame
  xSubset <-data.frame('date'=date,'open'=open,'high'= high,'low'=low,'close'=close)
  
  #We want to construct our candlesticks  
  xSubset$candleLower <- pmin(xSubset$open, xSubset$close)
  xSubset$candleMiddle <- NA
  xSubset$candleUpper <- pmax(xSubset$open, xSubset$close)
  xSubset$fill <- ''
  xSubset$fill[xSubset$open < xSubset$close] = 'white'
  xSubset$fill[xSubset$fill ==''] = 'red'
  
  #Add Moving Averages
  xSubset$ma200 <- SMA(xSubset$close, 200)
  xSubset$ma50 <- SMA(xSubset$close, 50)
  
  #Trim Data
  xSubset <-subset(xSubset, xSubset$date > start & xSubset$date < end)
  
  #Graphing Step
  g <- ggplot(xSubset, aes(x=date, lower=candleLower, middle=candleMiddle, upper=candleUpper, ymin=low, ymax=high)) 
  g <- g + geom_boxplot(stat='identity', aes(group=date, fill=fill))
  g <- g + geom_line(aes(x=date, y=ma50))+ geom_line(aes(x=date, y=ma200))
  g 
}

#call our graphing function
ggChartSeries(AAPL, start, end)

