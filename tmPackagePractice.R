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


