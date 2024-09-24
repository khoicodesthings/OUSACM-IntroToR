# Adapted from DSA 5103 - Intelligent Data Analytics - Dr. Nicholson

# mtcars is a data frame that is included with the R distribution
data(mtcars)

# since this is an R packaged dataset, it comes with "help"
help(mtcars)

# lists the first few records
head(mtcars)  

# can also do head(data, n) to list the first n records
head(mtcars, 7)
View(mtcars)
# lists the last few records
tail(mtcars) 
tail(mtcars, 8)

# look at the "structure" of the object
str(mtcars)

# To retrieve data in a cell, 
# enter its row and column coordinates 
# in the single square bracket "[]" operator. 
mtcars[1,6]


# to extract one or more rows of data -----------------

mtcars[7,]   # extracts the 7th row of data
mtcars[,7] # extracts the 7th column of data
mtcars$qsec
mtcars[7:10,] # extracts the 7th-10th rows of data

mtcars[c(3, 24),]  #extracts rows 3 and 24

mtcars[mtcars$mpg<15,]  # extracts rows where mpg < 15

# extracts rows where mpg > 15 and horsepower > 200
mtcars[mtcars$mpg>15 & mtcars$hp>200,]  

# extracts rows where mpg > 15 or horspower > 200
mtcars[mtcars$mpg>15 | mtcars$hp>200,]

#can also extract rows based on other vectors, e.g. a logical vector

# create a new logical vector that is TRUE if automatic, 
# and FALSE if standard transmission
L <- mtcars$am == 0 
L 

 
#use this to return only rows with automatic transmission
mtcars[L,]

#and this to return only rows that do NOT have automatic transmission
mtcars[!L,]

mtcars[!L,]$mpg  # here is their mpg



#you can also extract columns of data  ---------

mtcars[,1]

x <- mtcars[,1]       # can save the results into a variable
head(x)

x <- mtcars[,"mpg"] # save the mpg column as a variable
head(x)

x <- mtcars$mpg   # the $ is used to delineate the dataframe and var name
head(x)

x <- mtcars[,1:3]     # extracts the first 3 columns of data
head(x)

x <- mtcars[,c("mpg","hp")]   # extracts two specific columns of data
head(x)

x <- mtcars[1:5,2:4]    #extracts rows 1-5, and columns 2-4
head(x)



# returns the number of rows in mtcars
nrow(mtcars)

# returns the number of columns in mtcars
ncol(mtcars) 

#basic stats for each variable
summary(mtcars)  


#and individual stats
mean(mtcars$mpg)
?mad
mad(mtcars$mpg)
sd(mtcars$mpg)

?boxplot   #get help for the boxplot function

#using the formula input
boxplot(mtcars$mpg ~ mtcars$am)


#the basic graphics package has several useful tools

# histograms
hist(mtcars$mpg)
hist(mtcars$hp)

#scatterplots
plot(mtcars$mpg ~ mtcars$hp)

par(mfrow=c(3,1)) # this will create a 2x2 grid for our plots

# let's put all of the above plots into 1 window

boxplot(mtcars$mpg ~ mtcars$am)

hist(mtcars$mpg)
hist(mtcars$hp)

#scatterplots
plot(mtcars$mpg ~ mtcars$hp)

#the basic packages are not enough!  
#install packages in the "Packages" window

#install.packages(tidyverse)


library(tidyverse)
qplot(data=mtcars, mpg) # another way to do histogram


# using the mpg data set from ggplot2

?ggplot2::mpg

mpgdata <- ggplot2::mpg

ggplot(mpgdata, aes(x = displ, y = hwy, colour = cty)) + geom_point()

ggplot(mpgdata, aes(x = displ, y = hwy, size = cty)) + geom_point()

ggplot(mpgdata, aes(x = displ, y = hwy, colour = hwy, size = cty)) + geom_point()

ggplot(mpgdata, aes(x = displ, y = hwy, colour = displ)) + geom_point()

ggplot(mpgdata, aes(x = displ, y = hwy, colour = displ < 5)) + geom_point()

# ggplot also has "facets"
ggplot(data = mpgdata) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ manufacturer, nrow = 3) 

ggplot(data = mpgdata) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2) 

# clear our graph area
dev.off()
