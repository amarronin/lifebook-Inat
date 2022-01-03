#dataset from Dataset opns to be fed here
#Dependency: jpeg 
da3 = da2 %>% group_by(id) %>% select(id,image_url,scientific_name)
img_loc = paste(getwd(),"/images/",sep="")
da3$img_id = paste(img_loc,da3$scientific_name,"_",da3$id,".jpg",sep = "")
da3 = da3 %>% group_by(img_id) %>% select(image_url,img_id)
#Take a list of already existing jpg files
l_b = list.files(path=img_loc, pattern=".jpg", all.files=TRUE,
           full.names=TRUE)

#filter l_b from da3
da4 = subset(da3,!(img_id %in% c(l_b)))

#Downloads rest all Files i.e, from da4$img_url
if (nrow(da4) == 0)
  {print("All files are already in folder")} else {
  for (r in 1: nrow(da4)){
      img_url = toString(da3[r,1])
      fin = toString(da3[r,2])
      download.file(img_url,fin, mode = 'wb')
    }  
}