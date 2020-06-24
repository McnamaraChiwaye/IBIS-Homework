

#1. How many rows are in mtcars? How many columns?
data("mtcars")


#2. What does the drv variable describe? Read the help for ?mpg to find out.


#3. Make a scatter plot of hwy vs. cyl.


#4.Using table "flights" from package "nycflights13",find all flights that:


#4.1 Had an arrival delay of two or more hours

#4.2 Flew to Houston (IAH or HOU)

#4.3 Were operated by United, American, or Delta

#4.4 Departed in summer (July, August, and September)

#4.5 Arrived more than two hours late, but didn't leave late

#4.6 Were delayed by at least an hour, but made up over 30 minutes in flight

#4.7 Departed between midnight and 6 am (inclusive)



#5. How many flights have a missing dep_time? What other variables are missing?
#What might these rows represent?


#6. Sort flights to find the most delayed flights. Find the flights that left earliest.


#7. Sort flights to find the fastest flights 



#8. Reorder columns - arr_delay must be first, print first 100 rows



#9. Explore the distribution of each of the x, y, and z variables in diamonds.(ggplot2::diamonds)
#What do you learn? Think about a diamond and how you might decide which dimension 
#is the length, width, and depth.



#10. Explore the distribution of price. Do you discover anything unusual or surprising? 
#(Hint: Carefully think about the binwidth and make sure you try a wide range of values.)


#11. How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?


#12. Create a vector of dates giving the first day of every month in 2015.
#HINT: use ?lubridate



#13 Write code that uses one of the map functions to:
#13.1 Compute the mean of every column in mtcars.
#13.2 Determine the type of each column in nycflights13::flights.
#13.3 Compute the number of unique values in each column of iris.


