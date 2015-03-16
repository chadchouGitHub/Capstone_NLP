# NPL_Capstone
Chia-Ching Chou  
March 16, 2015  

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

# Install require package
rJava package is require for all NLP r package in this practice, but install rJava may have some problem 
in some computers. ( When I try to install the first, my r section abort. )
Note: Installation rJava has no problem. It is running library(rJava).
I need to download JE 6 first before I run library(rJava)

```r
## install.packages("rJava")
library(rJava)
```

```
## Warning: package 'rJava' was built under R version 3.1.2
```
Here will install lot of package for NLP, and other packages need for these package. 

```r
## install.packages(c("NLP", "openNLP", "RWeka", "qdap"))
```
This is not needed for English, but I still do it. I also limit to "En".

```r
## install.packages("openNLPmodels.en",
##              repos = "http://datacube.wu.ac.at/",
##               type = "source")
```
Loading the library for NLP

```r
library(NLP)
```

```
## Warning: package 'NLP' was built under R version 3.1.2
```

```r
library(openNLP)
```

```
## Warning: package 'openNLP' was built under R version 3.1.3
```

```r
library(RWeka)
```

```
## Warning: package 'RWeka' was built under R version 3.1.2
```

### You are ready to go on NLP.




