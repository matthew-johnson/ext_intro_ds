#Question 1
library(sqldf)

CO2_ds <- CO2
sqldf("SELECT AVG(uptake), Type FROM CO2_ds GROUP BY Type")
#AVG(uptake)        Type
#1    20.88333 Mississippi
#2    33.54286      Quebec

#Question 2

  Died.At <- c(22,40,72,41)
  Writer.At <- c(16, 18, 36, 36)
  First.Name <- c("John", "Edgar", "Walt", "Jane")
  Second.Name <- c("Doe", "Poe", "Whitman", "Austen") 
  Sex <- c("MALE", "MALE", "MALE", "FEMALE")
  Date.Of.Death <- c("2015-05-10", "1849-10-07", "1892-
03-26","1817-07-18") 

df <- data.frame(Died.At, Writer.At, First.Name, Second.Name, Sex, Date.Of.Death)
names(df)
df$Sex <- as.factor(df$Sex)
str(df$Sex)
#Factor w/ 2 levels "FEMALE","MALE": 2 2 2 1
names(df) <- c("age_at_death", "age_as_writer", "first_name", "surname", 
              "gender", "date_died")
names(df)
#[1] "age_at_death"  "age_as_writer" "first_name"    "surname"       "gender"        "date_died"    
library(lubridate)
jd <- subset(df, (first_name == "John" & surname == "Doe"), select = c("age_at_death", "date_died"))
date_d <- date(jd$date_died)
age_d <- as.integer(jd$age_at_death)
john_bd <- date_d + years(-1*age_d)
john_bd

#Question 3

product <- c("A", "B") 
height <- c(10,20) 
width <- c(5,10) 
weight <- c(2,NA) 
observations_wide <- data.frame(product, height, 
                               width, weight) 
#observations_wide 
library(tidyr)
observations_wtbl <- as_tibble(observations_wide)
observations_ltbl <- observations_wtbl %>% pivot_longer(cols = c("height", "width", "weight"), names_to = 'variable', values_to = 'value')
observations_ltbl <- drop_na(observations_ltbl)
observations_ltbl
# A tibble: 5 × 3
#product variable value
#<chr>   <chr>     <dbl>
#1 A       height       10
#2 A       width         5
#3 A       weight        2
#4 B       height       20
#5 B       width        10

#Question 4
