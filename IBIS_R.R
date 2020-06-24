install.packages("tidyverse")
install.packages("gglplot2")
install.packages("nycflights13")
install.packages("viridis")
install.packages("GGally")
install.packages("arm")
install.packages("lubridate")
install.packages("ggplot2")

knitr::opts_chunk$set(echo = TRUE)
library("tidyverse")
library("nycflights13")
library("viridis")
library("GGally")
library("arm")
library("lubridate")
library("ggplot2")

#1. How many rows are in mtcars? How many columns?
data("mtcars")
dim(mpg)


#2. What does the drv variable describe? Read the help for ?mpg to find out.
# Answer
# It helps us clarify if a car is front whell drive or not.
# For example f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#3. Make a scatter plot of hwy vs. cyl.
ggplot(mpg) + geom_point(aes(hwy, cyl))

#4.Using table "flights" from package "nycflights13",find all flights that:
dim(flights)

#4.1 Had an arrival delay of two or more hours
filter(flights, arr_delay >= 120)

#4.2 Flew to Houston (IAH or HOU)
filter(flights, dest %in% c("IAH", "HOU"))

#4.3 Were operated by United, American, or Delta
filter(flights, carrier %in% c("AA", "DL", "UA"))

#4.4 Departed in summer (July, August, and September)
filter(flights, month %in% 7:9)

#4.5 Arrived more than two hours late, but didn't leave late
filter(flights, arr_delay > 120, dep_delay <= 0)

#4.6 Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, dep_delay >= 60, (dep_delay - arr_delay > 30))

#4.7 Departed between midnight and 6 am (inclusive)
filter(flights, dep_time >= 2400 | dep_time <= 600)

#5. How many flights have a missing dep_time? What other variables are missing?
#What might these rows represent?
sum(is.na(flights$dep_time))
map_dbl(flights, ~ sum(is.na(.x)))


#6. Sort flights to find the most delayed flights. Find the flights that left earliest.
arrange(flights, dep_delay)
arrange(flights, desc(dep_delay))

#7. Sort flights to find the fastest flights 
arrange(flights, air_time)

#8. Reorder columns - arr_delay must be first, print first 100 rows
arrange(flights, arr_delay)

#9. Explore the distribution of each of the x, y, and z variables in diamonds.(ggplot2::diamonds)
#What do you learn? Think about a diamond and how you might decide which dimension 
#is the length, width, and depth.
diamonds %>%
  gather(key = dist, vals, x, y, z) %>%
  ggplot(aes(vals, colour = dist)) +
  geom_freqpoly(bins = 100)

#10. Explore the distribution of price. Do you discover anything unusual or surprising? 
#(Hint: Carefully think about the binwidth and make sure you try a wide range of values.)
graph <- map(seq(50, 1000, 100),
             ~ ggplot(diamonds, aes(x = price)) +
               geom_histogram(bins = .x) +
               labs(x = NULL, y = NULL) +
               scale_x_continuous(labels = NULL) +
               scale_y_continuous(labels = NULL))
multiplot(plotlist = graph)

#11. How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?
diamonds %>%
  filter(carat %in% c(0.99, 1)) %>%
  count(carat)

#12. Create a vector of dates giving the first day of every month in 2015.
#HINT: use ?lubridate
ymd(20150101) + months(1:12)


#13 Write code that uses one of the map functions to:
mapper_function <- function(the_type, object, fun) {
  empty_vec = vector(the_type, length(object))
  for (every_column in seq_along(object)) {
    empty_vec[every_column] <- fun(object[[every_column]])  
  }
  
  empty_vec
}

#13.1 Compute the mean of every column in mtcars.
mapper_function("numeric", mtcars, mean)

#13.2 Determine the type of each column in nycflights13::flights.
mapper_function("character", flights, class)

#13.3 Compute the number of unique values in each column of iris.
mapper_function("numeric", iris, function(x) sum(table(unique(x))))


