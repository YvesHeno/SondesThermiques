# localisation des sondes thermiques en continu
Localisation_sondes <- function()
{
  library(hubeau)
  library(dplyr)
  library(sf)
  library(mapview)
  
  codes_sites_sondes <- c("J750061001","J863241001","J340302001","J510221001","J181301001")
  rm(codes_sites_sondes)
  codes_sites_sondes <- read.csv2("../Data/propositiondesites.csv") %>% 
    select(2)
  #il faudra passer par un fichier csv ce serait mieux
  
  siteshydrometrie <- get_hydrometrie_stations(code_departement=c("22","29","35","56")) %>% 
    st_as_sf( coords=c("longitude_station","latitude_station"),crs=4326) %>% 
    mutate(sonde_thermique=if_else(.$code_station %in% codes_sites_sondes[,1],'OUI','NON'),.after=libelle_station)

  return(siteshydrometrie)

  }
