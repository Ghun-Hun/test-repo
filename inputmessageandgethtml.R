library(XML)
library(RCurl)
library(httr)
Sys.setlocale(category='LC_ALL', locale='C')

##generate the list of url
url='http://nteps.ntpc.gov.tw/cs/inspect/inspList.aspx'
getForm(url,ContentPlaceHolder1_txtSearchString="345123")

#ç¶²é?å…§??‰ä¸­??‡å?—ï?Œå?ˆä»¥Big5ç·¨ç¢¼??‰å?–ç¶²???
get_url_parse =htmlParse(url)

#??“å?–é?œéµ??„è?Šé?…ï?Œæ?‘å€‘é?€è¦ç?„è?Šé?…å¤¾?œ¨ä¸€?€‹table??„class=tb2ï¼Œè£¡?¢<tr>æ¨™ç±¤è£¡é¢
tablehead <- xpathSApply(get_url_parse, "//tr[@class='tb2']/td", xmlValue)

#å°‡æ“·??–åˆ°??„é?œéµå­—è?‰æ?XPç³»çµ±?…§å»ºç·¨ç¢? CP950
#?‰¹?ˆ¥??„æ˜¯ç¶“é?xpathSApplyè§???å‡ºä¾†ç?„æ?‡å?—ç·¨ç¢¼ï?Œä¼¼ä¹æ?ƒè‡ª??•å?BIG5è®Šç‚ºUTF-8?
tablehead<-iconv(tablehead,"UTF-8","CP950")

#å°‡æ“·??–åˆ°??„é?œéµå­—è?‰æ?å®¹??“é–±è®€??„çŸ©?™£? ¼å¼?
table <- matrix(tablehead, ncol = 6, byrow = T)

#å°? Taiwan 50 ??å?†è‚¡å¯«å…¥ csv æª”å…§
write.csv(table,file = "TWN50composition.csv" ,row.names = FALSE)


