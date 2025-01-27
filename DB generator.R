# Invalsi data - useful for all years
input_Invalsi <- SchoolDataIT::Get_Invalsi_IS(multiple_out = T)
input_Invalsi_mun <- input_Invalsi$Municipality_data
# 2017/18 data -----------------------------------------------------------------
Registry18 <- SchoolDataIT::Get_Registry(2018)
input_DB18_MIUR <- SchoolDataIT::Get_DB_MIUR(2018, 
                                             input_Registry = Registry18, 
                                             certifications = T)
input_nstud_18 <- SchoolDataIT::Get_nstud(Year = 2018)
nteachers_18 <- SchoolDataIT::Get_nteachers_prov(Year = 2018)
School2mun18 <- SchoolDataIT::Get_School2mun(2018, input_Registry = Registry18)

# Output dataset
DB18_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB18_MIUR,
                       input_nstud = input_nstud_18,
                       input_nteachers = nteachers_18, 
                       input_Registry = Registry18, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun18,
                       BroadBand = FALSE,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB18_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB18_mun <- DB18_mun %>%  dplyr::select(-.data$Other_disturbances_proximity,
                                        -.data$Other_consumption_reduction_devices,
                                        -.data$Other, -.data$Other_devices, 
                                        -.data$Other_heating_system, -.data$Other_insulation_type,
                                        -.data$Other_disturbances_proximity_MP,
                                        -.data$Other_consumption_reduction_devices_MP, -.data$Other_MP, 
                                        -.data$Other_devices_MP,
                                        -.data$Other_heating_system_MP, -.data$Other_insulation_type_MP)  




# export
write.csv(DB18_mun, file = "DB18.csv", row.names = FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB18_mun))), file = "field_track_2018.csv", row.names = FALSE)







# 2018/19 data -----------------------------------------------------------------
Registry19 <- SchoolDataIT::Get_Registry(2019)
input_DB19_MIUR <- SchoolDataIT::Get_DB_MIUR(2019, 
                                             input_Registry = Registry19, 
                                             certifications = T)
input_nstud_19 <- SchoolDataIT::Get_nstud(Year = 2019)
nteachers_19 <- SchoolDataIT::Get_nteachers_prov(Year = 2019)
School2mun19 <- SchoolDataIT::Get_School2mun(2019, input_Registry = Registry19)

# Output dataset
DB19_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB19_MIUR,
                       input_nstud = input_nstud_19,
                       input_nteachers = nteachers_19, 
                       input_Registry = Registry19, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun19,
                       BroadBand = FALSE,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB19_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB19_mun <- DB19_mun %>% dplyr::select(-.data$Other_disturbances_proximity,
                                       -.data$Other_consumption_reduction_devices,
                                       -.data$Other, -.data$Other_devices, 
                                       -.data$Other_heating_system, -.data$Other_insulation_type,
                                       -.data$Other_disturbances_proximity_MP,
                                       -.data$Other_consumption_reduction_devices_MP, -.data$Other_MP, 
                                       -.data$Other_devices_MP,
                                       -.data$Other_heating_system_MP, -.data$Other_insulation_type_MP)  


# export
write.csv(DB19_mun, file = "DB19.csv", row.names = FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB19_mun))), file = "field_track_2019.csv", row.names = FALSE)






# 2020/21 data -----------------------------------------------------------------
Registry21 <- SchoolDataIT::Get_Registry(2021)
input_DB21_MIUR <- SchoolDataIT::Get_DB_MIUR(2021, 
                                             input_Registry = Registry21, 
                                             certifications = T)
input_nstud_21 <- SchoolDataIT::Get_nstud(Year = 2021)
nteachers_21 <- SchoolDataIT::Get_nteachers_prov(Year = 2021)
input_BB200901 <- SchoolDataIT::Get_BroadBand(Date = as.Date("2020-09-01"))
School2mun21 <- SchoolDataIT::Get_School2mun(2021, input_Registry = Registry21)

# Output dataset
DB21_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB21_MIUR,
                       input_nstud = input_nstud_21,
                       input_nteachers = nteachers_21, 
                       input_Registry = Registry21, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun21,
                       input_BroadBand = input_BB200901,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB21_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB21_mun <- DB21_mun %>% dplyr::select(-.data$Other_disturbances_proximity,
                                       -.data$Other_specific_criticalities,
                                       -.data$Other, -.data$Other_devices, -.data$Other_specfy,
                                       -.data$Other_disturbances_proximity_MP,
                                       -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                                       -.data$Other_specfy_MP, -.data$Other_devices_MP)  


# export
write.csv(DB21_mun, file = "DB21.csv")


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB21_mun))), file = "field_track_2021.csv", row.names = FALSE)





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
write.csv(DB22_mun, file = "DB22.csv", row.names = FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB22_mun))), file = "field_track_2022.csv", row.names = FALSE)




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
write.csv(DB23_mun, file = "DB23.csv", row.names= FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB23_mun))), file = "field_track_2023.csv", row.names = FALSE)


