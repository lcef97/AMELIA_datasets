# Invalsi data - useful for all years
input_Invalsi <- SchoolDataIT::Get_Invalsi_IS(multiple_out = T)
input_Invalsi_mun <- input_Invalsi$Municipality_data

# 2021/22 data -----------------------------------------------------------------
Registry22 <- SchoolDataIT::Get_Registry(2022)
input_DB22_MIUR <- SchoolDataIT::Get_DB_MIUR(2022, 
                                             input_Registry = Registry22, 
                                             certifications = T)
input_nstud_22 <- SchoolDataIT::Get_nstud(Year = 2022)
nteachers_22 <- SchoolDataIT::Get_nteachers_prov(Year = 2022)
input_BB210901 <- SchoolDataIT::Get_BroadBand(Date = as.Date("2021-09-01"))
School2mun22 <- SchoolDataIT::Get_School2mun(2022, input_Registry = Registry22)

# Output dataset
DB22_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB22_MIUR,
                       input_nstud = input_nstud_22,
                       input_nteachers = nteachers_22, 
                       input_Registry = Registry22, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun22,
                       input_BroadBand = input_BB210901,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB22_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB22_mun <- DB22_mun %>% dplyr::select(-.data$Other_disturbances_proximity,
                                       -.data$Other_specific_criticalities,
                                       -.data$Other, -.data$Other_devices, -.data$Other_specfy,
                                       -.data$Other_disturbances_proximity_MP,
                                       -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                                       -.data$Other_specfy_MP, -.data$Other_devices_MP)  


# export
write.csv(DB22_mun, file = "DB22.csv")


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(names(DB23_mun)), file = "field_track.csv")




# 2022/23 data - latest available until now ------------------------------------
Registry23 <- SchoolDataIT::Get_Registry(2023)
input_DB23_MIUR <- SchoolDataIT::Get_DB_MIUR(2023, 
                                             input_Registry = Registry23, 
                                             certifications = T)
input_nstud_23 <- SchoolDataIT::Get_nstud(Year = 2023)
nteachers_23 <- SchoolDataIT::Get_nteachers_prov(Year = 2023)
input_BB220901 <- SchoolDataIT::Get_BroadBand(Date = as.Date("2022-09-01"))
School2mun23 <- SchoolDataIT::Get_School2mun(2023, input_Registry = Registry23)

# Output dataset
DB23_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB23_MIUR,
                       input_nstud = input_nstud_23,
                       input_nteachers = nteachers_23, 
                       input_Registry = Registry23, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun23,
                       input_BroadBand = input_BB220901,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB23_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB23_mun <- DB23_mun %>% dplyr::select(-.data$Other_disturbances_proximity,
                           -.data$Other_specific_criticalities,
                           -.data$Other, -.data$Other_devices, -.data$Other_specfy,
                           -.data$Other_disturbances_proximity_MP,
                           -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                           -.data$Other_specfy_MP, -.data$Other_devices_MP)  


# export
write.csv(DB23_mun, file = "DB23.csv")


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(names(DB23_mun)), file = "field_track.csv")


