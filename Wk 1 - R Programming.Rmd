---
title: "Subsetting - Basics"
output: html_notebook
---

```{r}
x <- c("a","b","c","c","d","a")
x[1]
```

```{r}
x[2]
```

```{r}
x[1:4]
```

```{r}
x[x > "a"]
#"greater than" can be used because there is a lexicographical ordering to the letters, so any letter greater than a was returned.
```

```{r}
#we can also create a logical vector "u" that tells us that its elements are greater than "a"
u <- x > "a"
u
```

```{r}
#we can subset x with the u vector
x[u]
```

```{r}
#Subsetting - Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]
class(x[1])
```

```{r}
x[[1]]
class(x[[1]])
```

```{r}
x$bar
class(x$bar)
```

```{r}
x[["bar"]]
class(x[["bar"]])
```

```{r}
x["bar"]
class(x["bar"])
```

```{r}
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]
```

```{r}
#Subsetting Nested Elements of a List
x[[c(1,3)]] #getting the third element of the first element. Note that double brackets are used for this
```

```{r}
x[[1]][[3]] #same as the above code
```

```{r}
x[[c(2,1)]]
```

```{r}
#Subsetting Matrices
x <- matrix(1:6, 2, 3)
x

x[1,2]
```

```{r}
x[2,1]
```

```{r}
x[1, ] #indices can also be missing
```

```{r}
x[ ,2]
```

```{r}
#by default, when a single element of a matrix is retrieved, it is returned as a vector of length 1 rather than a 1x1 matrix. This behavior can be turned off by setting drop=FALSE
x[1,2, drop = FALSE]
class(x[1,2])
class(x[1,2, drop = FALSE])
```

```{r}
x[1, , drop = FALSE]
class(x[1, , drop=FALSE])
```

```{r}
#Subsetting - Partial Matching
x <- list(aardvark = 1:5)
x$a
```

```{r}
x[["a"]] 
#double bracket doesnt work with partial matching
```

```{r}
x[["a", exact = FALSE]] 
#...unless you set exact=FALSE
```

```{r}
#Subsetting - Removing missing or NA values
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad] #! is called the bang operator, to mean Not bad
```

```{r}
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good
```

```{r}
x[good]
y[good]
```

```{r}
airquality[1:6, ]
```

```{r}
good <- complete.cases(airquality)
airquality[good, ][1:6, ]
```

```{r}
#Vectorized Operations
x <- 1:4; y <- 6:9
x
y
x+y
```

```{r}
x > 2
x >= 2
y == 8
```

```{r}
x*y
x/y
```

```{r}
#Vectorized Matrix Operations
x <- matrix(1:4, 2,2); y <- matrix(rep(10,4), 2,2)
x
y
x*y #element-wise multiplication
```

```{r}
x/y
```

```{r}
x %*% y #true matrix multiplication
```

```{r}
#WEEK 1 QUIZ

x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)
```

```{r}
x <- 1:4
y <- 2
x+y
class(x+y)
```
```{r}
x <- c(3,5,1,10,12,6)
x[x%in% 1:5] <- 0
x
```

```{r}
data <- read.csv("hw1_data.csv")
names(data) #the column names of the dataset
```

```{r}
#print the first 2 rows in the data frame
data[1:2, ]
```

```{r} 
#number of rows (observations) in the data frame
nrow(data)
```

```{r}
#extract the last 2 rows in the data frame
data[(153-1):153, ]
tail(data, n=2)
```

```{r}
#value of ozone in the 47th row
data$Ozone[47]
```

```{r}
#how many missing values in the ozone column
sum(is.na(data$Ozone))
```

```{r}
#mean of the ozone column, exclude missing values from the calculation
mean(data$Ozone, na.rm = TRUE)
```


```{r}
#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90.
df = subset(data, Ozone > 31 & Temp > 90)
class(df)
```

```{r}
#What is the mean of Solar.R in this subset?
mean(df$Solar.R)
```

```{r}
#What is the mean of "Temp" when "Month" is equal to 6?
df2 <- subset(data, Month == 6)
mean(df2$Temp)
```

```{r}
#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
df3 <- subset(data, Month == 5)
max(df3$Ozone, na.rm = TRUE)
```

```{r}

```

