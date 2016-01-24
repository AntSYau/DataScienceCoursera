set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),var3=sample(11:15))
x <- x[sample(1:5),]; x$var2[c(1,3)] = NA
#  result:
#    var1 var2 var3
#  1    2   NA   15
#  4    1   10   11
#  2    3   NA   12
#  3    5    6   14
#  5    4    9   13

x[,1]
# [1] 2 1 3 5 4
x[,"var1"]
# [1] 2 1 3 5 4
x[1:2,"var2"]
# [1] NA 10

x[(x$var1 <= 3 & x$var3 > 11),] # & <- and
#  result:
#    var1 var2 var3
#  1    2   NA   15
#  2    3   NA   12

x[(x$var1 <= 3 | x$var3 > 15),] # | <- or
#  result:
#    var1 var2 var3
#  1    2   NA   15
#  4    1   10   11
#  2    3   NA   12

x[which(x$var2 > 8),]    # Dealing with NA
#  result:
#    var1 var2 var3
#  4    1   10   11
#  5    4    9   13

x[(x$var2 > 8),]         # comparsion
#  result:
#       var1 var2 var3
#  NA     NA   NA   NA
#  4       1   10   11
#  NA.1   NA   NA   NA
#  5       4    9   13

sort(x$var1)    # sort increasing
sort(x$var1, decreasing = TRUE)    # sort decreasing
sort(x$var2, na.last = TRUE)

x[order(x$var1),] # order the whole data frame
#  result:
#    var1 var2 var3
#  4    1   10   11
#  1    2   NA   15
#  2    3   NA   12
#  5    4    9   13
#  3    5    6   14

# sort var3 within multiple values of var1 that are the same.
x[order(x$var1,x$var3),]

# ordering with plyr
library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

# adding rows or columns
x$var4 <- rnorm(5)
y <- rbind(x,rnorm(5)) # another way without labeling

