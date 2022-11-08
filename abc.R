library(rvest) 
library(dplyr)
library(robotstxt)

path = paths_allowed ("https://www.footballcritic.com/top-players")

link <-"https://www.footballcritic.com/top-players"

web <- read_html (link) 

name <- web %>% html_nodes ("#sn_gg_close , .name a")%>% html_text()

View (name)  

club<- web %>% html_nodes("#sn_gg_close , .club-name a") %>% html_text()

View(club)

country<- web %>% html_nodes(".age a") %>% html_text()

View(country)

age<- web %>% html_nodes(".notMobile+ .stat") %>% html_text()

View(age)

top.footballplayers <- data.frame(name,club,country,age)

write.csv (top.footballplayers, "top football players")

