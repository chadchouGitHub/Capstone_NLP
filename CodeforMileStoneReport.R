## Here is the R code for MileStone Report 

## The report make markdown file can be see at rPubs link below.
## http://rpubs.com/ChiaChingChou/MileStone_Report 
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
print(tableSummary)
#-------------------------------------------------------------------
## Use readLines() to reading each data into R. 
#--------------------------------------------------------------------
twitter <- readLines("final/en_US/en_US.twitter.txt", encoding = 'UTF-8')
news<- readLines('final/en_US/en_US.news.txt', encoding = 'UTF-8')
blogs<- readLines('final/en_US/en_US.blogs.txt', encoding = 'UTF-8')
set.seed(1)
subent <- ent[sample(1:length(ent),10000)] 
set.seed(1)
subenn <- enn[sample(1:length(enn),20000)]
set.seed(1)
subenb <- enb[sample(1:length(enb),30000)]
#-------------------------------------------------------------------
twitterText <- gsub("(\\.|\\,|\\?|\\!|\\;|\\&|\\(|\\)|\\:|[\"]|\\-\\-|\\=| \\- |\\#| \\'|\\' )","{\\1}",twitter)
rm(twitter)
twitterText <- tolower(twitterText)
twitterTokens <- strsplit(twitterText,"\\{.?}| ")
twitterTokens <- unlist(twitterTokens)
rm(twitterText)

newsText <- gsub("(\\.|\\,|\\?|\\!|\\;|\\&|\\(|\\)|\\:|[\"]|\\-\\-|\\=| \\- |\\#| \\'|\\' )","{\\1}",news)
rm(news)
newsText <- tolower(newsText)
newsTokens <- strsplit(newsText,"\\{.?}| ")
newsTokens <- unlist(newsTokens)
rm(newsText)

blogsText <- gsub("(\\.|\\,|\\?|\\!|\\;|\\&|\\(|\\)|\\:|[\"]|\\-\\-|\\=| \\- |\\#| \\'|\\' )","{\\1}",blogs)
rm(blogs)
blogsText <- tolower(blogsText)
blogsTokens <- strsplit(blogsText,"\\{.?}| ")
blogsTokens <- unlist(blogsTokens)
rm(blogsText)
 twitterT<-summary(twitterTokens) 
 newsT <- summary(newsTokens)
 blogsT <- summary(blogsTokens)

tokenSummary<- as.data.frame(rbind(twitterT,newsT,blogsT))

rownames(tokenSummary)<- c("twitter","news","blogs")

twitterTokenCount <- sort(table(twitterTokens), decreasing=TRUE)
## Very important: Use table() to count frequency of each word.
newsTokenCount <- sort(table(newsTokens), decreasing=TRUE)
blogsTokenCount<- sort(table(blogsTokens), decreasing=TRUE)
typeOfwordsT <- length(twitterTokenCount)
typeOfwordsN <- length(newsTokenCount)
typeOfwordsB <- length(blogsTokenCount)

#---------------------------------------------------------------------


#----------------------------------------------------------------------
twitterTokenCount<- data.frame(word=names(twitterTokenCount), freq=twitterTokenCount)
twitterTokenCount<-twitterTokenCount[-1,]
newsTokenCount<- data.frame(word=names(newsTokenCount), freq=newsTokenCount)
newsTokenCount<-newsTokenCount[-1,]
blogsTokenCount<- data.frame(word=names(blogsTokenCount), freq=blogsTokenCount)
blogsTokenCount<-blogsTokenCount[-1,]
#-----------------------------------------------------------------------------

# Figure 1 for each text file's hight counting words
#-------------------------------------------------------------------------


plotT300000<- subset(twitterTokenCount, freq >300000)
wordListT <- as.character(plotT300000[,1])
barplot(plotT300000[,"freq"], names=wordListT)

plotN300000<- subset(newsTokenCount, freq >300000)
wordListN <- as.character(plotN300000[,1])
barplot(plotN300000[,"freq"], names=wordList)

plotB300000<- subset(blogsTokenCount, freq >300000)
wordListB <- as.character(plotB300000[,1])
barplot(plotB300000[,"freq"], names=wordListB)



