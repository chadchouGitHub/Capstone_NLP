## Practice NLP with tm package and other NLP package

library("NLP") #Generics NLP Function set
library("openNLP") #Generics NLP Function set
library("tm") #For Text Mining & Corpus workings
library("RWeka") #For n-gram vector generation
library("qdap") #For Text Mining & Corpus workings
library("ggplot2") #Charting functionality

# Loading all NLP package and try to find what each function belong to each package.
# It is much easy to use NLP package to make n-grims instead of writing function myself. But I need to learn about those 
# package before I can understand other's code.

#  VectorSource() is in the tm package
#  VCorpus() is in the tm package
# tm_map() is in the tm package.

twitter <- readLines("final/en_US/en_US.twitter.txt", encoding = 'UTF-8')
twitter <- twitter[sample(1:length(twitter),10000)] 
tiny <- paste(twitter)
corpus <- VectorSource(tiny)
corpus <- VCorpus(corpus) # Building the main corpus
corpus <- tm_map(corpus, removeNumbers) # removing numbers
corpus <- tm_map(corpus, stripWhitespace) # removing whitespaces
corpus <- tm_map(corpus, content_transformer(tolower)) #lowercasing all contents
corpus <- tm_map(corpus, removePunctuation) # removing special characters


# I did not use this, but this is the way to remove specific words from corpus 
# badWordsVector <- VectorSource(readLines("final/bad_words.txt"))
# corpus <- tm_map(corpus, removeWords, badWordsVector)

cleanText<-data.frame(text=unlist(sapply(corpus, `[`, "content")), stringsAsFactors=F)

## I have no idea about this " sapply(corpus, `[`, "content") " corpus is VCorpus type
## I can find reference from here " http://stackoverflow.com/questions/24703920/r-tm-package-vcorpus-corpus-to-dataframe "
## But I still don't know what it mean.
# Converting Corpus to Data Frame for processing by the RWeka functions


## Load RWeka first.
## NGramTokenizer() is RWeka function

oneToken <- NGramTokenizer(cleanText, Weka_control(min = 1, max = 1))

# Onegram <- NGramTokenizer(corpus, Weka_control(min = 1, max = 1,delimiters = " \\r\\n\\t.,;:\"()?!"))
# Directly use Weka package to NGramTokenizer corpus. it will show lot of numbers, symbol,...Why?
# It was removed before? 
biToken <- NGramTokenizer(cleanText, Weka_control(min = 2, max = 2, delimiters = " \\r\\n\\t.,;:\"()?!"))
triToken <- NGramTokenizer(cleanText, Weka_control(min = 3, max = 3, delimiters = " \\r\\n\\t.,;:\"()?!"))

# Use table() to count the frequence of each token table() is base function.
# Then use data.frame() to convert the table into DF. In the mean time the DF is arrange by words not 
# the frequence (word counting).

one <- data.frame(table(oneToken))
two <- data.frame(table(biToken))
tri <- data.frame(table(triToken))
# Find name of each col in these three DF.
colnames(one)
colnames(two)
colnames(tri)

oneSorted <- one[order(one$oneToken,decreasing = F),]
twoSorted <- two[order(two$biToken,decreasing = F),]
triSorted <- tri[order(tri$triToken,decreasing = F),]

# Take a look of the DF. You will find many rows have useless tokens. 
# If I have a list of dictionary words, I can keep the row that only appear to be normal word.
# In the mean time I will just subset the useless tokens.
oneSorted <- oneSorted[9:nrow(oneSorted),]
twoSorted <- twoSorted[11:nrow(twoSorted),]
triSorted <- triSorted[17:nrow(triSorted),]

## Sorting again to see the non A-Z words

oneSorted <- oneSorted[order(one$oneToken,decreasing = T),]
twoSorted <- twoSorted[order(two$biToken,decreasing = T),]
triSorted <- triSorted[order(tri$triToken,decreasing = T),]

## Subset out the non-A-Z rows
oneSorted <- oneSorted[18:nrow(oneSorted),]
twoSorted <- twoSorted[20:nrow(twoSorted),]
triSorted <- triSorted[26:nrow(triSorted),]

## It is not really need to remove all those non-A-Z or tokens, but it look beter in the data.

# Now I can sort for freq
# Here is sorting the DF by "Freq" col. I think it is useful to Sorting with word first, and take a look. 
oneSorted <- oneSorted[order(oneSorted$Freq,decreasing = TRUE),]
twoSorted <- twoSorted[order(twoSorted$Freq,decreasing = TRUE),]
triSorted <- triSorted[order(triSorted$Freq,decreasing = TRUE),]

## After sorting through DF, the DF has a row.name col 
## But it is not count into the length?? Sometimes it disappear..???

## You can save you Data like this, and load back later. 
## In this way, you don't need to keep read from text file every time.
save(oneSorted,twoSorted,triSorted,file='sortedOneTwoTri.RData')
rm(oneSorted,twoSorted,triSorted)
load('sortedOneTwoTri.RData')

# add ranking col in the df. I find reference from here.
# http://stackoverflow.com/questions/19403196/ranking-dataframe-columns-in-r
# df$Ranking <- ave( df$Margin, df$Category, FUN=rank )
oneSorted$Ranking <- ave(-oneSorted$Freq, FUN=rank)
twoSorted$Ranking <- ave(-twoSorted$Freq, FUN=rank)
triSorted$Ranking <- round(ave(-triSorted$Freq, FUN=rank))

## Note: Use $ to add a col into df 
## Note: The triSorted has some tokens have same Freq, So the Ranking share between two tokens with decimal



