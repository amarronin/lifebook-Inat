library("jpeg")
library(tidyverse)
setwd("~/R/Lifebook")
y = "https://static.inaturalist.org/photos/30797980/medium.jpeg"
download.file(y,'images/y.jpg', mode = 'wb')
jj <- readJPEG("images/y.jpg",native=TRUE)
plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
rasterImage(jj,0,0,1,1)

#create loop with all the urls and obs IDs as image names from obs excel.
#Add a check to look for the images(obs IDs) in images folder

library(raster)
r <- brick(file.path(getwd(), "images", "y.jpg"))
pdf("images/y.pdf")
plotRGB(r)
dev.off()



