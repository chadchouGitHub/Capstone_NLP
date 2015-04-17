#wordHelper.R
## Here are all the functions I wrote for my shiny app "word-app"
## A Cousera DATA Science capstone project
## Each function will flank between two  "## ------------function name-----------" lines

###----------------------------------loading word ranking df-----------------------------------
### Need to make sure the RData file is in the correct directory
load('sortedOneTwoTri.RData')

###----------------------------------loading word ranking df-----------------------------------


##-------------------------------------lastWordF function--------------------------------------
## This function is using to get the last word of input text.

lastWordF <- function(x){
        splitTriWx <- unlist(strsplit(x, " "))
        y<- splitTriWx[length(splitTriWx)]
        return(y)
}

##-------------------------------------lastWordF function--------------------------------------




##------------------------------------lastTwoWordF function---------------------------------
## This function is using to get last two word of input text.
lastTwoWordF <- function(x){
        splitWx <- unlist(strsplit(x, " "))
        y<- paste(splitWx[(length(splitWx)-1)],splitWx[length(splitWx)])
        return(y)
}

##------------------------------------lastTwoWordF function---------------------------------

## --------------------------------find the candidates in bitoken-----------------------------
## This function need twoSorted dataframe in sortedOneTwoTri.RData
## This function use the lastWord() function to find all biToken in twoSorted DF
candiateF <- function(x){
        matchW <-paste("^",x," ",sep = "") ## the past function will add a blank space after x vector, 
        ## So the double quaotation don't need a space. 
        ## To avoid the space, I need to use spe = "" . Once I use this
        ## I can paste my own " " space in the place I need.
        rOws<- grep(matchW,twoSorted$biToken)
        y <- twoSorted[rOws,]
        y<- y[order(y$Ranking,decreasing = F),]
        z<- gsub(paste(x,""),"",y$biToken) ##Remove "x " from biToken variable and give me a list of 
        ## words that fellow with "x" in biToken.
        return(z)
}

## prefict word function---(find the candidates in bitoken)-----------------


### ------------------find match in triToke DF with lastTwoWord() + candidate list candidateF()------------
## x is lastTwoW() from input text, y is cList from candidateF()
## Here I limit y for first 20, 
triTokenF <- function(x,y) {
        
        l <- length(y)
        ## make a empty df for for loop
        if(l>=20){
                y <- y[1:20]
                l <- 20
        }
        
        w<- data.frame(Date=as.Date(character()),
                       File=character(), 
                       User=character(), 
                       stringsAsFactors=FALSE) 
        
        for (i in 1:l)
        {
                matchWord <- paste(x,y[i])
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






