# localisation des sondes thermiques en continu
Localisation_sondes <- function()
{
  library(hubeau)
  library(dplyr)
  library(sf)
  library(mapview)
  
  siteshydrometrie <- get_hydrometrie_stations(code_departement=c("22","29","35","56")) %>% 
    st_as_sf( coords=c("longitude_station","latitude_station"),crs=4326)
  codes_sites_sondes <- c("J750061001","J863241001","J340302001","J510221001","J181301001")
  #il faudra passer par un fichier csv ce serait mieux
  sondesth <- filter(siteshydrometrie,code_station %in% (codes_sites_sondes))
  return(list(siteshydrometrie,sondesth))

  }
