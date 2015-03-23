# NLP Milestone  report
Chia-Ching Chou  
March 23, 2015  

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
library(knitr)
```

```
## Warning: package 'knitr' was built under R version 3.1.2
```

```r
twitter <- system('wc -lwm final/en_US/en_US.twitter.txt',intern = T)
```

```
## Warning: running command 'wc -lwm final/en_US/en_US.twitter.txt' had
## status 1
```
 wc is system commond
 Using system() to run system commond. -lwm is for wc. it mean length, word counts, and size (m? not sure)

```r
news <- system('wc -lwm final/en_US/en_US.news.txt',intern = T)
```

```
## Warning: running command 'wc -lwm final/en_US/en_US.news.txt' had status 1
```

```r
blogs <- system('wc -lwm final/en_US/en_US.blogs.txt',intern = T)
```

```
## Warning: running command 'wc -lwm final/en_US/en_US.blogs.txt' had status
## 1
```

```r
ten <- as.numeric(grep('[[:digit:]]', unlist(strsplit(twitter," ")), value = T))
```
twitter = " 2360148 30373603 166816544 final/en_US/en_US.twitter.txt"
split the elements of a character by " " in twitter and unlist it.
Use grep to find digits ( number in txt) and change to numbers

```r
nen <- as.numeric(grep('[[:digit:]]', unlist(strsplit(news," ")), value = T))
ben <- as.numeric(grep('[[:digit:]]', unlist(strsplit(blogs," ")), value = T))
en <- as.data.frame(rbind(ten,nen,ben))
# rownames(en) <- c("twitter","news","blogs")
# colnames(en) <- c("line_counts","word_counts","document_size")
kable(en, align='c', caption = "Summary of the datasets")
```



Table: Summary of the datasets

----
ten 
nen 
ben 
----

You can also embed plots, for example:




