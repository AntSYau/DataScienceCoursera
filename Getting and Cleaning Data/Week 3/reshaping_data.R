library(reshape2)
head(mtcars)

# melting data frames 
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id = c("carname","gear","cyl"), measure.vars = c("mpg","hp"))
# id will be reserved, measure.vars will be seperated like this:
#                carname gear cyl variable value
# 1            Mazda RX4    4   6      mpg  21.0
# 2        Mazda RX4 Wag    4   6      mpg  21.0
# 33           Mazda RX4    4   6       hp 110.0
# 34       Mazda RX4 Wag    4   6       hp 110.0
# which the original data frame is:
#                      mpg cyl  disp drat carb
# Mazda RX4           21.0   6 160.0 3.90    4
# Mazda RX4 Wag       21.0   6 160.0 3.90    4

# casting data frames
cylData <- dcast(carMelt, cyl ~ variable); cylData
cylData <- dcast(carMelt, cyl ~ variable, mean); cylData

# averaging values
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
spIns <- split(InsectSprays$count,InsectSprays$spray)
sprCount <- lapply(spIns, sum)
