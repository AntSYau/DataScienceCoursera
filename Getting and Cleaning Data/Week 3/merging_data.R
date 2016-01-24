fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv")
download.file(fileUrl2, destfile = "./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv")

# merging data - merge()
mergedData <- merge(reviews,solutions,by.x = "solution_id",by.y = "id",all=TRUE)
head(mergedData)

# default
intersect(names(solutions),names(reviews))
mergedData2 <- merge(reviews,solutions,all=TRUE)
