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

# Converting Corpus to Data Frame for processing by the RWeka functions
## Load RWeka first.


# Onegram <- NGramTokenizer(corpus, Weka_control(min = 1, max = 1,delimiters = " \\r\\n\\t.,;:\"()?!"))
# Directly use Weka package to NGramTokenizer corpus. it will show lot of numbers, symbol,...Why?
# It was removed before? 