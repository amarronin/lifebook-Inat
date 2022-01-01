#dataset from Dataset opns to be fed here
for (x in da2$image_url){
  download.file(x,'images/da2$scientific_name.jpg', mode = 'wb')
}