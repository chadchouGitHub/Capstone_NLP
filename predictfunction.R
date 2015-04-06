## Write a function to out put a word base on a word inputed.
load('sortedOneTwoTri.RData')
predictF <- function(x){
        matchW <-paste(x,"") ## the past function will add a blank space after x vector, 
                                ## So the double quaotation don't need a space. 
         rOws<- grep(matchW,twoSorted$biToken)
         y <- twoSorted[rOws,]
        return(y)
}



## Here is the test to see the space after paste() function.
x <- "for"
matchW1<-paste(x," ")
matchW2<-paste(x,"")
matchW1
matchW2