#Question 1
m <- 1:12       
m
# [1]  1  2  3  4  5  6  7  8  9 10 11 12

dim(m) <- c(4, 3)    # 4 rows, 3 columns to be transposed to 3x4
m <- t(m)

m <- rbind(c(8,8,8,8), m)
m <- cbind(c(9,9,9,9), m)

m
#     [,1] [,2] [,3] [,4] [,5]
#[1,]    9    8    8    8    8
#[2,]    9    1    2    3    4
#[3,]    9    5    6    7    8
#[4,]    9    9   10   11   12

#Question 2
lst <- list(c("Ellen", "Catherine", "Stephen"), c(91L, 94L, 100L), 
            matrix(c(TRUE,TRUE,TRUE,FALSE,FALSE,TRUE),nrow=2, ncol=3))
lst
#[[1]]
#[1] "Ellen"     "Catherine" "Stephen"  
#
#[[2]]
#[1]  91  94 100
#
#[[3]]
#[,1]  [,2]  [,3]
#[1,] TRUE  TRUE FALSE
#[2,] TRUE FALSE  TRUE
lst[[1]]
#[1] "Ellen"     "Catherine" "Stephen"
lst[[2]][3]
#[1] 100
lst[[3]][,2]
#[1]  TRUE FALSE

#Question 3
gender <- c(rep("male",25), rep("female",30))
gender
#[1] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
#[15] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"   "female" "female" "female"
#[29] "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female"
#[43] "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female" "female"
x <- factor(gender)
table(x)
#female   male 
#30     25 
#summary(x)

#Question 4
data("airquality")
o <- airquality$Ozone #subset(airquality, select=Ozone)
sum(is.na(o))
#[1] 37

#Question 5
sub <- subset(airquality, Ozone > 31 & Temp > 90, select = c(Ozone, Temp, Solar.R))
mean(sub$Solar.R)
#[1] 212.8

#Question 6
airquality1 <- airquality
airquality1$hotcold <- ifelse(airquality1$Temp > median(airquality1$Temp), "hot", "cold")
head(airquality1,12)
#Ozone Solar.R Wind Temp Month Day hotcold
#1     41     190  7.4   67     5   1    cold
#2     36     118  8.0   72     5   2    cold
#3     12     149 12.6   74     5   3    cold
#4     18     313 11.5   62     5   4    cold
#5     NA      NA 14.3   56     5   5    cold
#6     28      NA 14.9   66     5   6    cold
#7     23     299  8.6   65     5   7    cold
#8     19      99 13.8   59     5   8    cold
#9      8      19 20.1   61     5   9    cold
#10    NA     194  8.6   69     5  10    cold
#11     7      NA  6.9   74     5  11    cold
#12    16     256  9.7   69     5  12    cold
tail(airquality1,12)
#Ozone Solar.R Wind Temp Month Day hotcold
#142    24     238 10.3   68     9  19    cold
#143    16     201  8.0   82     9  20     hot
#144    13     238 12.6   64     9  21    cold
#145    23      14  9.2   71     9  22    cold
#146    36     139 10.3   81     9  23     hot
#147     7      49 10.3   69     9  24    cold
#148    14      20 16.6   63     9  25    cold
#149    30     193  6.9   70     9  26    cold
#150    NA     145 13.2   77     9  27    cold
#151    14     191 14.3   75     9  28    cold
#152    18     131  8.0   76     9  29    cold
#153    20     223 11.5   68     9  30    cold

#Question 7
ints <- 1:100
evens <- 0
odds <- 0
for (i in ints)
{
  j <- i^2
  if (j%%2 == 0)
  {
    evens <- evens + j
  }
  else 
  {
    odds <- odds + j
  }
}
evens - odds
#[1] 5050

#Question 8
mat1 <- matrix(rep(seq(4), 4),
               ncol = 4)
mat1
#[,1] [,2] [,3] [,4]
#[1,]    1    1    1    1
#[2,]    2    2    2    2
#[3,]    3    3    3    3
#[4,]    4    4    4    4

row_sums <- function(inputMatrix)
{
  output = c(rep(0,nrow(inputMatrix)))

  for (i in 1:nrow(inputMatrix))
  {
    sum = 2
    for (j in 1:ncol(inputMatrix))
    {
      sum <- sum+inputMatrix[i,j]
    }
    output[i] = sum
  }
  
  return(output)
}

row_sums(mat1)
#[1]  6 10 14 18

#Question 9
set.seed(123)
s_names <- sample(state.name, 10)
s_names 
#[1] "New Mexico"    "Iowa"          "Indiana"       "Arizona"       "Tennessee"     "Texas"         "Oregon"        "West Virginia"
#[9] "Missouri"      "Montana"

order_names <- order(s_names, decreasing = FALSE)
order_names
#[1]  4  3  2  9 10  1  7  5  6  8
s_names[order_names]
#[1] "Arizona"       "Indiana"       "Iowa"          "Missouri"      "Montana"       "New Mexico"    "Oregon"        "Tennessee"    
#[9] "Texas"         "West Virginia"

#Question 10
library(lubridate)
xct <- as.POSIXct('1969-07-20 20:18:00', tz="UTC")
xct
current_time = Sys.time()
interval = interval(xct, current_time)
years_passed = time_length(interval, "years")
years_passed 
#[1] 53.22795
