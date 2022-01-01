#for inat dataset operations
#Dataset operations:
#Remove dups of species (keep latest by date)
#Sort by taxon_kingdom_name taxon_phylum_name	taxon_family_name	taxon_genus_name scientific_name
#loop will be by family, genus
#page will have 2 obs. or 1 if thats tough
#Will create HTML. Then move that as PDF

dsetopn = function(csv_name)
  
{
data <- read.csv("observations-206143.csv")
da1 = data.frame(data)
#takes one obs by latest date
da2 = da1 %>%
  arrange(scientific_name,desc(id))%>%
  arrange(taxon_family_name,taxon_genus_name,scientific_name) %>%
  group_by(taxon_family_name,taxon_genus_name,scientific_name) %>%
  slice(1)
  

  return(da2)
}

amt = c("observations-206143")
dsetopn(csv_name=observations-206143)

