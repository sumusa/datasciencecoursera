x <- c("a","b","c","c","d","a")
x[1]

x[2]

x[1:4]

x[x > "a"]
#"greater than" can be used because there is a lexicographical ordering to the letters, so any letter greater than a was returned.

#we can also create a logical vector "u" that tells us that its elements are greater than "a"
u <- x > "a"
u

#we can subset x with the u vector
x[u]

#Subsetting - Lists
x <- list(foo = 1:4, bar = 0.6)
x[1]
class(x[1])

x[[1]]
class(x[[1]])

x$bar
class(x$bar)

x[["bar"]]
class(x[["bar"]])

x["bar"]
class(x["bar"])

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)]

#Subsetting Nested Elements of a List
x[[c(1,3)]] #getting the third element of the first element. Note that double brackets are used for this

x[[1]][[3]] #same as the above code

x[[c(2,1)]]

#Subsetting Matrices
x <- matrix(1:6, 2, 3)
x

x[1,2]

x[2,1]

x[1, ] #indices can also be missing

x[ ,2]

#by default, when a single element of a matrix is retrieved, it is returned as a vector of length 1 rather than a 1x1 matrix. This behavior can be turned off by setting drop=FALSE
x[1,2, drop = FALSE]
class(x[1,2])
class(x[1,2, drop = FALSE])

x[1, , drop = FALSE]
class(x[1, , drop=FALSE])

#Subsetting - Partial Matching
x <- list(aardvark = 1:5)
x$a

x[["a"]] 
#double bracket doesnt work with partial matching

x[["a", exact = FALSE]] 
#...unless you set exact=FALSE

#Subsetting - Removing missing or NA values
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad] #! is called the bang operator, to mean Not bad

y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good

x[good]
y[good]

airquality[1:6, ]

good <- complete.cases(airquality)
airquality[good, ][1:6, ]

#Vectorized Operations
x <- 1:4; y <- 6:9
x
y
x+y

x > 2
x >= 2
y == 8

x*y
x/y

#Vectorized Matrix Operations
x <- matrix(1:4, 2,2); y <- matrix(rep(10,4), 2,2)
x
y
x*y #element-wise multiplication

x/y

x %*% y #true matrix multiplication

#WEEK 1 QUIZ

x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)

x <- 1:4
y <- 2
x+y
class(x+y)

x <- c(3,5,1,10,12,6)
x[x%in% 1:5] <- 0
x

data <- read.csv("hw1_data.csv")
names(data) #the column names of the dataset

#print the first 2 rows in the data frame
data[1:2, ]

#number of rows (observations) in the data frame
nrow(data)

#extract the last 2 rows in the data frame
data[(153-1):153, ]
tail(data, n=2)

#value of ozone in the 47th row
data$Ozone[47]

#how many missing values in the ozone column
sum(is.na(data$Ozone))

#mean of the ozone column, exclude missing values from the calculation
mean(data$Ozone, na.rm = TRUE)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90.
df = subset(data, Ozone > 31 & Temp > 90)
class(df)

#What is the mean of Solar.R in this subset?
mean(df$Solar.R)

#What is the mean of "Temp" when "Month" is equal to 6?
df2 <- subset(data, Month == 6)
mean(df2$Temp)

#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
df3 <- subset(data, Month == 5)
max(df3$Ozone, na.rm = TRUE)

?sink
