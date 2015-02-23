library(XML)
library(RCurl)
library(httr)
Sys.setlocale(category='LC_ALL', locale='C')
##generate the list of url
url='http://www.twse.com.tw/ch/trading/indices/twco/tai50i.php'




##Get the table online

#核心程式
#myTemp <- function(url){
  #抓取url
  #get_url = getURL(url,encoding ='big5')

  #將url解析
  get_url_parse =htmlParse(url,encoding ='BIG5')
  #get_url_parse =htmlParse(iconv(get_url,"BIG5","UTF-8"))
  #get_url_parse =htmlTreeParse(get_url, encoding = "big5")
  class(get_url_parse)
  #抓取關鍵的變項，我們需要的變項夾在一個div的class=tqtongji2，裡面<ul>中的<li>標籤裡面
  #標籤裡面還有一些沒有用到的東西沒關係，事後再一併移除
  tablehead <- xpathSApply(get_url_parse, "//tr[@class='tb2']/td", xmlValue)
 
 #將擷取到的關鍵字轉成容易閱讀的矩陣格式
  print(tablehead)
  print(iconv(tablehead,"UTF-8","CP950"))
  table <- matrix(tablehead, ncol = 6, byrow = T)

  #回傳值
 # return(table)
#}

#lapply是個好用的指令，在SAS要做類似的事情都會使用MACRO變項
#但是R是向量語言，把要跑的變項放在一個向量(url_list) ，把公式放在第二個參數位置
#R會自動為第一個向量中的每個元素代入到公式之中
#產生出的的Temp_Total是個list，存放每一次的結果
#Temp_Total <- lapply(url, myTemp)
#tm<-Temp_Total[[1]]
#for(i in 1:50){
#  tables <- rbind(tm[i,])
#}




write.csv(table,file = "Temp.csv" ,, row.names = F)



