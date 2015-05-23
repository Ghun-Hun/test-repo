library(XML)
library(RCurl)
library(httr)
Sys.setlocale(category='LC_ALL', locale='C')

##generate the list of url
url='http://www.twse.com.tw/ch/trading/indices/twco/tai50i.php'

  
#網�?�內??�中??��?��?��?�以Big5編碼??��?�網???
get_url_parse =htmlParse(url,encoding ='BIG5')
  
#??��?��?�鍵??��?��?��?��?�們�?�要�?��?��?�夾?��一?��table??�class=tb2，裡?��<tr>標籤裡面
tablehead <- xpathSApply(get_url_parse, "//tr[@class='tb2']/td", xmlValue)
 
<<<<<<< HEAD
#將擷??�到??��?�鍵字�?��?�XP系統?��建編�? CP950
#?��?��??�是經�?�xpathSApply�???�出來�?��?��?�編碼�?�似乎�?�自??��?�BIG5變為UTF-8?
#tablehead<-iconv(tablehead,"UTF-8","CP950")
=======
#將擷取到的關鍵字轉成XP系統內建編碼 CP950
#特別的是經過xpathSApply解析出來的文字編碼，似乎會自動從BIG5變為UTF-8?
<<<<<<< HEAD
#tablehead<-iconv(tablehead,"UTF-8","CP950")
=======
tablehead<-iconv(tablehead,"UTF-8","CP950")
>>>>>>> c4189a44dde609ac348cbb89068558c632d1bf67
>>>>>>> dfac6d7e42bfcfe0b6bffdaadb51dbe5986d4bcc

#將擷??�到??��?�鍵字�?��?�容??�閱讀??�矩?��?���?
table <- matrix(tablehead, ncol = 6, byrow = T)

#�? Taiwan 50 ??��?�股寫入 csv 檔內
write.csv(table,file = "TWN50composition.csv" ,row.names = FALSE)



