## Write a function to out put a word base on a word inputed.
## The sortedOneTwoTri.RData was made in tmPackagepractact.R file

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
         y<- y[order(y$Ranking,decreasing = F),]
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
                                z <- y
                                #z <- y[order(y$Ranking,decreasing = F),]
                                if(nrow(z)>=10){
                                        z <- z[1:10,]
                                         }
                                return(z)
                        }

## Extract a list of words from candidate DF to match the oneSorted DF----------


#### Here is the code to search tritoken
### here is code to get the last word of input
### last word extract from input text function

### lastWordF function-----------------------------------------------------------------------
lastWordF <- function(x){
        splitTriWx <- unlist(strsplit(x, " "))
        y<- splitTriWx[length(splitTriWx)]
        return(y)
}

### lastWordF function----------------------------------------------------------------------



### lastTwoWordF function-------------------------------------------------------------------
lastTwoWordF <- function(x){
        splitWx <- unlist(strsplit(x, " "))
        y<- paste(splitWx[(length(splitWx)-1)],splitWx[length(splitWx)])
        return(y)
}

### lastTwoWordF function-------------------------------------------------------------------





### triSorted extraction from a list of triToken--------------------------------------------
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

### triSorted extraction from a list of triToken--------------------------------------------



## Here is the test to get match out of triToken DF
triWx <-c("In Order To Make") ## input "I did ya"
triWx<- tolower(triWx)
lastWordF(triWx)
test1 <- candiateF(lastWordF(triWx)) ## Just for test
test2 <- candiListW(candiateF(lastWordF(triWx))) ## put my two function in my candiListW function 
test3 <- lastTwoWordF(triWx)
test4 <- paste(test3,test2$oneToken)## past the lastTwoWords of input to candidate from oneSorted
## Here is test2 DF.
test5 <- triTokenF(test4)
nrow(test5)


## I make a random sample to test my triSorted extracting function.------------------------
 nO<- sample(nrow(triSorted),2)

 rTest<- as.character(triSorted[nO,]$triToken) ## need as.character() to convert the subset results
                                                ## form "factor" type to "character" type

test6 <- triTokenF(rTest)
## I make a random sample to test my triSorted extracting function.-----------------------

### ------------------find match in triToke DF with lastTwoWord() + candidate list candidateF()------------
## x is lastTwoW() from input text, y is cList from candidateF()
## Here I limit y for first 20, 
triTokenF <- function(x,y) {
        
        l <- length(y)
        ## make a empty df for for loop
        if(l>=20){
                y <- y[1:10]
                l <- 10
        }
        
        w<- data.frame(Date=as.Date(character()),
                       File=character(), 
                       User=character(), 
                       stringsAsFactors=FALSE) 
        
        for (i in 1:l)
        {
                matchWord <- paste(x,y[i]) # put last two words with candidate list word together.
                newRows<- subset(triSorted, triToken == matchWord)
                w<- rbind(w,newRows)
                
        }
        if (nrow(w)>=1){
                z <- w[order(w$Ranking,decreasing = F),]
                return(z)
        }
        return(w)
}
### ------------------find match in triToke DF with lastTwoWord() + candidate list candidateF() ------------

### triSorted extraction from a list of triToken--------------------------------------------

triWx <-c("I Don't Want To talk About") ## input "I did ya"
triWx<- tolower(triWx)
lastWordF(triWx)
test2x <- lastTwoWordF(triWx)
cListy <- candiateF(lastWordF(triWx))
test3XYbeta<- triTokenF(test2x,cListy)


