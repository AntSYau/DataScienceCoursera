# load files
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData = read.csv("./data/restaurants.csv")

# creating sequences
s1 <- seq(1,10,by=2); s1       # [1] 1 3 5 7 9
s2 <- seq(1,10,length=3); s2   # [1]  1.0  5.5 10.0
x <- c(1,3,8.25,100); seq(along = x)

# subsetting var
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# creating binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# creating categorical variables
restData$zipGroups = cut(restData$zipCode, quantile(restData$zipCode))
table(restData$zipGroup)

# easier cutting
# see pdf page 9

# creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

# levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace=TRUE)
yesnofac = factor(yesno,levels=c("yes","no"))
relevel(yesnofac, ref="yes")

as.numeric(yesnofac)

# mutate function
# see pdf file
# commom transforms
# see pdf file