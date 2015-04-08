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
                y<- data.frame(Date=as.Date(character()),
                                        File=character(), 
                                        User=character(), 
                                        stringsAsFactors=FALSE) 

                for (i in 1:l)
                                {
                                        matchWord <- paste(x[i])
                                        newRows<- subset(oneSorted, oneToken == matchWord)
                                        y<- rbind(y,newRows)
                                        
                                }
                                z <- y[order(y$Ranking,decreasing = F),]
                                return(z)
                        }

## Extract a list of words from candidate DF to match the oneSorted DF-----------
#### Here is the code to search tritoken
### here is code to get the last word of input
### triWx is the words that input more than 1

triWx <-c("I did ya")
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

### Run test with "I did ya" and expect to get did ya see


triWx <-c("I did ya") ## input "I did ya"
triWx
test1 <- candiateF("ya")
test2<- candiListW(test1)
test3 <- lastTwoWordF(triWx)
test4 <- paste(test3,test2$oneToken)
test4
### Run test with "I did ya" and expect to get did ya see


### triSorted extraction from a list of triToken-------------------------
triTokenF <- function(x) {
        
        l <- length(x)
        ## make a empty df for for loop
        y<- data.frame(Date=as.Date(character()),
                       File=character(), 
                       User=character(), 
                       stringsAsFactors=FALSE) 
        
        for (i in 1:l)
        {
                matchWord <- paste(x[i])
                newRows<- subset(triSorted, triToken == matchWord)
                y<- rbind(y,newRows)
                
        }
        if (nrow(y)>=1){
                        z <- y[order(y$Ranking,decreasing = F),]
                        return(z)
                 }
        return(y)
}

### triSorted extraction from a list of triToken-------------------------

test5 <- triTokenF(test4)
nrow(test5)


## I make a random sample to test my triSorted extracting function.-----
 nO<- sample(nrow(triSorted),1)

 rTest<- as.character(triSorted[nO,]$triToken) ## need as.character() to convert the subset results
                                                ## form "factor" type to "character" type

test6 <- triTokenF(rTest)
## I make a random sample to test my triSorted extracting function.-----




