library(XML)
library(RCurl)
library(httr)
Sys.setlocale(category='LC_ALL', locale='C')

##generate the list of url
url='http://nteps.ntpc.gov.tw/cs/inspect/inspList.aspx'
getForm(url,ContentPlaceHolder1_txtSearchString="345123")

#網�?�內??�中??��?��?��?�以Big5編碼??��?�網???
get_url_parse =htmlParse(url)

#??��?��?�鍵??��?��?��?��?�們�?�要�?��?��?�夾?��一?��table??�class=tb2，裡?��<tr>標籤裡面
tablehead <- xpathSApply(get_url_parse, "//tr[@class='tb2']/td", xmlValue)

#將擷??�到??��?�鍵字�?��?�XP系統?��建編�? CP950
#?��?��??�是經�?�xpathSApply�???�出來�?��?��?�編碼�?�似乎�?�自??��?�BIG5變為UTF-8?
tablehead<-iconv(tablehead,"UTF-8","CP950")

#將擷??�到??��?�鍵字�?��?�容??�閱讀??�矩?��?���?
table <- matrix(tablehead, ncol = 6, byrow = T)

#�? Taiwan 50 ??��?�股寫入 csv 檔內
write.csv(table,file = "TWN50composition.csv" ,row.names = FALSE)


