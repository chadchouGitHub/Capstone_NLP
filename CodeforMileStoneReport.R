## Here is the R code for MileStone Report

#----------------------------------------------------------------------
#twitter <- system('wc -lwm final/en_US/en_US.twitter.txt',intern = T)
twitter  <-"2360148 30373603 166816544 final/en_US/en_US.twitter.txt"
# news <- system('wc -lwm final/en_US/en_US.news.txt',intern = T)
news <- "1010242 34372530 205243643 final/en_US/en_US.news.txt"
# blogs <- system('wc -lwm final/en_US/en_US.blogs.txt',intern = T)
blogs <- "899288 37334147 208623081 final/en_US/en_US.blogs.txt"
tSummary <- as.numeric(grep('[[:digit:]]', unlist(strsplit(twitter," ")), value = T))
nSummary <- as.numeric(grep('[[:digit:]]', unlist(strsplit(news," ")), value = T))
bSummary <- as.numeric(grep('[[:digit:]]', unlist(strsplit(blogs," ")), value = T))
tableSummary <- as.data.frame(rbind(tSummary,nSummary,bSummary))
rownames(tableSummary)<- c("twitter","news","blogs")
colnames(tableSummary)<- c("line","words","size")

#-------------------------------------------------------------------

