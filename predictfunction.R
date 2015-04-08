## Write a function to out put a word base on a word inputed.
load('sortedOneTwoTri.RData')

###
### lastWordF function-----------------------------------------
lastWordF <- function(x){
        splitTriWx <- unlist(strsplit(x, " "))
        y<- splitTriWx[length(splitTriWx)]
        return(y)
}

### lastWordF function-----------------------------------------

## prefict word function---(find the candidates in bitoken)-----------------
candiateF <- function(x){
        matchW <-paste("^",x," ",sep = "") ## the past function will add a blank space after x vector, 
                                ## So the double quaotation don't need a space. 
                                ## To avoid the space, I need to use spe = "" . Once I use this
                                ## I can paste my own " " space in the place I need.
         rOws<- grep(matchW,twoSorted$biToken)
         y <- twoSorted[rOws,]
         z<- gsub(paste(x,""),"",y$biToken) ##Remove "for " from biToken variable and give me a list of 
        ## words that fellow with for in biToken.
        return(z)
}

## prefict word function---(find the candidates in bitoken)-----------------

## Here is the test to see the space after paste() function.
x <- "for"
matchW1<-paste(x," ")
matchW2<-paste(x,"")
matchW1
matchW2


 test2<- gsub("for ","",test$biToken) ##Remove "for " from biToken variable and give me a list of 
## words that fellow with for in biToken.


## Extract a list of words from candidateF to match the oneSorted DF-----------
candiListW <- function(x) {
        
                l <- length(x)
                ## make a empty df for for loop
                z <- data.frame(Date=as.Date(character()),
                                        File=character(), 
                                        User=character(), 
                                        stringsAsFactors=FALSE) 

                for (i in 1:l)
                                {
                                        matchWord <- paste(x[i])
                                        newRows<- subset(oneSorted, oneToken == matchWord)
                                        z <- rbind(z,newRows)
                                }
                                return(z)
                        }

## Extract a list of words from candidate DF to match the oneSorted DF-----------
#### Here is the code to search tritoken
### here is code to get the last word of input
### triWx is the words that input more than 1

triWx <-c("I am your father")
triWx

### last word extract from input text function

### lastWordF function-----------------------------------------
lastWordF <- function(x){
        splitTriWx <- unlist(strsplit(x, " "))
        y<- splitTriWx[length(splitTriWx)]
        return(y)
}

### lastWordF function-----------------------------------------



### lastTwoWordF function-----------------------------------------
lastTwoWordF <- function(x){
        splitWx <- unlist(strsplit(x, " "))
        y<- paste(splitWx[(length(splitWx)-1)],splitWx[length(splitWx)])
        return(y)
}

### lastTwoWordF function-----------------------------------------

