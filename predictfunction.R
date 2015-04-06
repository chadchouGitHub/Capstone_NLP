## Write a function to out put a word base on a word inputed.
load('sortedOneTwoTri.RData')
predictF <- function(x){
        matchW <-paste("^",x," ",sep = "") ## the past function will add a blank space after x vector, 
                                ## So the double quaotation don't need a space. 
                                ## To avoid the space, I need to use spe = "" . Once I use this
                                ## I can paste my own " " space in the place I need.
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


 test2<- gsub("for ","",test$biToken) ##Remove "for " from biToken variable and give me a list of 
## words that fellow with for in biToken.

l <- length(test2)
z <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=character(), 
                 stringsAsFactors=FALSE) 

for (i in 1:l)
        {
                matchWord <- paste(test2[i])
                newRows<- subset(oneSorted, oneToken == matchWord)
        z <- rbind(z,newRows)
        }











