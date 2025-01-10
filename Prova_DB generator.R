# Invalsi data - useful for all years
input_Invalsi <- SchoolDataIT::Get_Invalsi_IS(multiple_out = T)
input_Invalsi_mun <- input_Invalsi$Municipality_data

# 2022/23 data - latest available until now ------------------------------------
Registry23 <- SchoolDataIT::Get_Registry(2023)
input_DB23_MIUR <- SchoolDataIT::Get_DB_MIUR(2023, 
                                             input_Registry = Registry23, 
                                             certifications = T)
input_nstud_23 <- SchoolDataIT::Get_nstud(Year = 2023)
nteachers_23 <- SchoolDataIT::Get_nteachers_prov(Year = 2023)
input_BB220901 <- SchoolDataIT::Get_BroadBand(Date = as.Date("2022-09-01"))
School2mun23 <- SchoolDataIT::Get_School2mun(2023, input_Registry = Registry23)


DB23_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB23_MIUR,
                       input_nstud = input_nstud_23,
                       input_nteachers = nteachers_23, 
                       input_Registry = Registry23, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun23,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB23_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)