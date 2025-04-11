#'  #--------------------------------------------------------------------------#
#'  #              DB GENERATOR for Amelia Platform                            #
#'  #--------------------------------------------------------------------------#           
#'
#'  This script uses version 0.2.5 of SchoolDataIT.
#'  At the moment it still has to be submitted
#'  to CRAN. 
#'  To use this experimental version, download it from github:
#'                      
#'                  devtools::install_github("lcef97/SchoolDataIT")
#'  
#'  General warning: this is a data retrieval package.
#'  So, before running this code, ensure you have access to internet :)
#'  
#'  
#'  
#'
##' #--------------------------------------------------------------------------#
##' #       Shorter datasets - only school buildings                  
#'  #--------------------------------------------------------------------------#           
##' 2015/16 data ---------------------------------------------------------------
#'
#'  Key choice: maximum threshold of missing records per column.
#'  Here we attept at: 10,000 for 2016 data, 5,000 for later years.
#'
InnerAreas <- SchoolDataIT::Get_InnerAreas()

Registry16 <- SchoolDataIT::Get_Registry(2016)
input_DB16_MIUR <- SchoolDataIT::Get_DB_MIUR(2016, 
                                             input_Registry = Registry16, 
                                             certifications = T)
DB16_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB16_MIUR, input_InnerAreas = InnerAreas,
                                         col_cut_thresh=10000)

#' There are some duplicate values. This deserves a more strict investigation.
#' To solve the problem, we filter them out a priori.
#' We need an if() condition to do this or we may end up with an empty DB
#
if(any(duplicated(dplyr::select(DB16_MIUR$Municipality_data, .data$Municipality_code, .data$Order)))){
  DB16_MIUR$Municipality_data <- DB16_MIUR$Municipality_data[
    -which(duplicated(dplyr::select(DB16_MIUR$Municipality_data, .data$Municipality_code, .data$Order))),]
}

#write.csv(DB16_MIUR$Municipality_data, file = "DB16_MIUR.csv", row.names = FALSE)

##' 2017/18 data ---------------------------------------------------------------
Registry18 <- SchoolDataIT::Get_Registry(2018)
input_DB18_MIUR <- SchoolDataIT::Get_DB_MIUR(2018, 
                                             input_Registry = Registry18, 
                                             certifications = T)
DB18_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB18_MIUR, input_InnerAreas  = InnerAreas, 
                                         col_cut_thresh = 5000)
#' Duplicates issue. For 2018 I don't think
#' it is necessary, still it does not cost anything
if(any(duplicated(dplyr::select(DB18_MIUR$Municipality_data, .data$Municipality_code, .data$Order)))){
  DB18_MIUR$Municipality_data <- DB18_MIUR$Municipality_data[
    -which(duplicated(dplyr::select(DB18_MIUR$Municipality_data, .data$Municipality_code, .data$Order))),]
}

#write.csv(DB18_MIUR$Municipality_data, file = "DB18_MIUR.csv", row.names = FALSE)

##' 2018/19 data ---------------------------------------------------------------
Registry19 <- SchoolDataIT::Get_Registry(2019)
input_DB19_MIUR <- SchoolDataIT::Get_DB_MIUR(2019, 
                                             input_Registry = Registry19, 
                                             certifications = T)
DB19_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB19_MIUR, input_InnerAreas  = InnerAreas, 
                                         col_cut_thresh = 5000)

#' Duplicates issue, as for 2016 data. This time it's necessary
if(any(duplicated(dplyr::select(DB19_MIUR$Municipality_data, .data$Municipality_code, .data$Order)))){
  DB19_MIUR$Municipality_data <- DB19_MIUR$Municipality_data[
    -which(duplicated(dplyr::select(DB19_MIUR$Municipality_data, .data$Municipality_code, .data$Order))),]
}

#write.csv(DB19_MIUR$Municipality_data, file = "DB19_MIUR.csv", row.names = FALSE)

##' 2020/21 data ---------------------------------------------------------------
Registry21 <- SchoolDataIT::Get_Registry(2021)
input_DB21_MIUR <- SchoolDataIT::Get_DB_MIUR(2021, 
                                             input_Registry = Registry21, 
                                             certifications = T)
DB21_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB21_MIUR, input_InnerAreas  = InnerAreas, 
                                         col_cut_thresh = 5000)
#write.csv(DB21_MIUR$Municipality_data, file = "DB21_MIUR.csv", row.names = FALSE)

##' 2021/22 data ---------------------------------------------------------------
Registry22 <- SchoolDataIT::Get_Registry(2022)
input_DB22_MIUR <- SchoolDataIT::Get_DB_MIUR(2022, 
                                             input_Registry = Registry22, 
                                             certifications = T)
DB22_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB22_MIUR, input_InnerAreas  = InnerAreas, 
                                         col_cut_thresh = 5000)
#write.csv(DB22_MIUR$Municipality_data, file = "DB22_MIUR.csv", row.names = FALSE)

##' 2022/23 data ---------------------------------------------------------------
Registry23 <- SchoolDataIT::Get_Registry(2023)
input_DB23_MIUR <- SchoolDataIT::Get_DB_MIUR(2023, 
                                             input_Registry = Registry23, 
                                             certifications = T)
DB23_MIUR <- SchoolDataIT::Group_DB_MIUR(input_DB23_MIUR, input_InnerAreas  = InnerAreas, 
                                         col_cut_thresh = 5000)
#write.csv(DB23_MIUR$Municipality_data, file = "DB23_MIUR.csv", row.names = FALSE)
#'  
##' join -----------------------------------------------------------------------




DBs_MIUR <- list(DB16_MIUR$Municipality_data, 
                 DB18_MIUR$Municipality_data, 
                 DB19_MIUR$Municipality_data,
                 DB21_MIUR$Municipality_data,
                 DB22_MIUR$Municipality_data,
                 DB23_MIUR$Municipality_data)
#' Let us consider the proportion of missing records per municipality.
if(!"Year" %in% names(DB16_MIUR$Municipality_missing)){
  DB16_MIUR$Municipality_missing$Year <- DB16_MIUR$Municipality_data$Year[1]
}
if(!"Year" %in% names(DB18_MIUR$Municipality_missing)){
  DB18_MIUR$Municipality_missing$Year <- DB18_MIUR$Municipality_data$Year[1]
}
if(!"Year" %in% names(DB19_MIUR$Municipality_missing)){
  DB19_MIUR$Municipality_missing$Year <- DB19_MIUR$Municipality_data$Year[1]
}
if(!"Year" %in% names(DB21_MIUR$Municipality_missing)){
  DB21_MIUR$Municipality_missing$Year <- DB21_MIUR$Municipality_data$Year[1]
}
if(!"Year" %in% names(DB22_MIUR$Municipality_missing)){
  DB22_MIUR$Municipality_missing$Year <- DB22_MIUR$Municipality_data$Year[1]
}
if(!"Year" %in% names(DB23_MIUR$Municipality_missing)){
  DB23_MIUR$Municipality_missing$Year <- DB23_MIUR$Municipality_data$Year[1]
}




DB_MIUR_MP <- dplyr::bind_rows(DB16_MIUR$Municipality_missing, 
                            DB18_MIUR$Municipality_missing, 
                            DB19_MIUR$Municipality_missing,
                            DB21_MIUR$Municipality_missing,
                            DB22_MIUR$Municipality_missing,
                            DB23_MIUR$Municipality_missing)


common_cols <- Reduce(intersect, lapply(DBs_MIUR, names))

#' This is a very, very strict selection. Only rows included in all SIX 
#' dataframes are taken into the final one.
DBs_MIUR_reduced<- lapply(DBs_MIUR, function(X) dplyr::select(X, common_cols))

DB_MIUR.L <- dplyr::bind_rows(DBs_MIUR_reduced)

#' Let us include the missing proportions. Of all fields?
#' Of course not: only of the fields of DB_MIUR.L
DB_MIUR_MP.R <- DB_MIUR_MP %>% dplyr::select(
  which(sapply(names(DB_MIUR_MP), function(x) {
    any(sapply(common_cols, function (y) grepl(y, x)))
    }))) %>% 
  dplyr::select( -.data$nbuildings_MP)

DB_MIUR <- dplyr::left_join(DB_MIUR.L, DB_MIUR_MP.R,
                            by = c("Municipality_code", "Year", "Order"))


write.csv(DB_MIUR, file = "DB_SchoolBuildings.csv", row.names = FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB_MIUR))), file = "field_track_MIUR.csv", row.names = FALSE)
##' #--------------------------------------------------------------------------
##' #--------------------------------------------------------------------------#
##'         Shorter datasets - only students counts                  
##'  #--------------------------------------------------------------------------   
#'  
#'  Warning: Here we do not filter out anything.
#'  Since these data are validated by the Ministry,
#'  we assume they are correct, though some records
#'  are extreme. 
#'         
##' 2015/16 data ---------------------------------------------------------------

input_nstud_16 <- SchoolDataIT::Get_nstud(Year = 2016)
if(!exists("Registry16")) Registry16 <- SchoolDataIT::Get_Registry(2016)
#nteachers_16 <- SchoolDataIT::Get_nteachers_prov(Year = 2016)
nstud16 <- SchoolDataIT::Group_nstud(input_nstud_16, Year = 2016, input_Registry = Registry16)
#teachers4stud16 <- SchoolDataIT::Group_teachers4stud(Year = 2016,
 #                                                    input_nteachers = nteachers_16,
  #                                                   input_nstud_raw = input_nstud_16)
#write.csv(nstud16$Municipality_data, file = "Students counts/nstud16.csv", row.names = FALSE)


##' 2017/18 data ---------------------------------------------------------------

input_nstud_18 <- SchoolDataIT::Get_nstud(Year = 2018)
if(!exists("Registry18")) Registry18 <- SchoolDataIT::Get_Registry(2018)
#nteachers_18 <- SchoolDataIT::Get_nteachers_prov(Year = 2018)
nstud18 <- SchoolDataIT::Group_nstud(input_nstud_18, Year = 2018, input_Registry = Registry18)
#teachers4stud18 <- SchoolDataIT::Group_teachers4stud(Year = 2018,
#                                                     input_nteachers = nteachers_18,
#                                                     input_nstud_raw = input_nstud_18)
#write.csv(nstud18$Municipality_data, file = "Students counts/nstud18.csv", row.names = FALSE)

##' 2018/19 data ---------------------------------------------------------------

input_nstud_19 <- SchoolDataIT::Get_nstud(Year = 2019)
if(!exists("Registry19")) Registry19 <- SchoolDataIT::Get_Registry(2019)
#nteachers_19 <- SchoolDataIT::Get_nteachers_prov(Year = 2019)
nstud19 <- SchoolDataIT::Group_nstud(input_nstud_19, Year = 2019, input_Registry = Registry19)
#teachers4stud19 <- SchoolDataIT::Group_teachers4stud(Year = 2019,
#                                                     input_nteachers = nteachers_19,
#                                                     input_nstud_raw = input_nstud_19)
#write.csv(nstud19$Municipality_data, file = "Students counts/nstud19.csv", row.names = FALSE)


##' 2020/21 data ---------------------------------------------------------------

input_nstud_21 <- SchoolDataIT::Get_nstud(Year = 2021)
#if(!exists("Registry21")) Registry21 <- SchoolDataIT::Get_Registry(2021)
nteachers_21 <- SchoolDataIT::Get_nteachers_prov(Year = 2021)
nstud21 <- SchoolDataIT::Group_nstud(input_nstud_21, Year = 2021, input_Registry = Registry21)
#teachers4stud21 <- SchoolDataIT::Group_teachers4stud(Year = 2021,
#                                                     input_nteachers = nteachers_21,
#                                                     input_nstud_raw = input_nstud_21)
#write.csv(nstud21$Municipality_data, file = "Students counts/nstud21.csv", row.names = FALSE)

##' 2021/22 data ---------------------------------------------------------------

input_nstud_22 <- SchoolDataIT::Get_nstud(Year = 2022)
if(!exists("Registry22")) Registry22 <- SchoolDataIT::Get_Registry(2022)
#nteachers_22 <- SchoolDataIT::Get_nteachers_prov(Year = 2022)
nstud22 <- SchoolDataIT::Group_nstud(input_nstud_22, Year = 2022, input_Registry = Registry22)
#teachers4stud22 <- SchoolDataIT::Group_teachers4stud(Year = 2022,
#                                                     input_nteachers = nteachers_22,
#                                                     input_nstud_raw = input_nstud_22)
#write.csv(nstud22$Municipality_data, file = "Students counts/nstud22.csv", row.names = FALSE)

##' 2022/23 data ---------------------------------------------------------------

input_nstud_23 <- SchoolDataIT::Get_nstud(Year = 2023)
if(!exists("Registry23")) Registry23 <- SchoolDataIT::Get_Registry(2023)
#nteachers_23 <- SchoolDataIT::Get_nteachers_prov(Year = 2023)
nstud23 <- SchoolDataIT::Group_nstud(input_nstud_23, Year = 2023, input_Registry = Registry23)
#teachers4stud23 <- SchoolDataIT::Group_teachers4stud(Year = 2023,
#                                                     input_nteachers = nteachers_23,
#                                                     input_nstud_raw = input_nstud_23)
#write.csv(nstud23$Municipality_data, file = "Students counts/nstud23.csv", row.names = FALSE)

##' 2023/24 data ---------------------------------------------------------------

input_nstud_24 <- SchoolDataIT::Get_nstud(Year = 2024)
if(!exists("Registry24")) Registry24 <- SchoolDataIT::Get_Registry(2024)
School2mun24 <- SchoolDataIT::Get_School2mun(2023, input_Registry = Registry24)
nstud24 <- SchoolDataIT::Group_nstud(input_nstud_24, Year = 2023, input_School2mun = School2mun24)
#write.csv(nstud24$Municipality_data, file = "Students counts/nstud24.csv", row.names = FALSE)

## join ------------------------------------------------------------------------

nstud <- dplyr::bind_rows(
  dplyr::mutate(nstud16$Municipality_data, Year = "201516"),
  dplyr::mutate(nstud18$Municipality_data, Year = "201718"),
  dplyr::mutate(nstud19$Municipality_data, Year = "201819"),
  dplyr::mutate(nstud21$Municipality_data, Year = "202021"),
  dplyr::mutate(nstud22$Municipality_data, Year = "202122"),
  dplyr::mutate(nstud23$Municipality_data, Year = "202223"),
  dplyr::mutate(nstud24$Municipality_data, Year = "202324")) %>% 
  dplyr::relocate(.data$Year, .before = 1)

write.csv(nstud, file = "Students counts/Classroom_size.csv", row.names = FALSE)


# Invalsi data, useful for all years -------------------------------------------
#'
#' Warning: download is slow 
input_Invalsi <- SchoolDataIT::Get_Invalsi_IS(multiple_out = T)
input_Invalsi_mun <- input_Invalsi$Municipality_data
Invalsi_wide <- SchoolDataIT::Util_Invalsi_filter(input_Invalsi_mun,
                                                  Year = c(2013:2019, 2021:2024),
                                                  level = "LAU",
                                                  grade = c(2,5,8,10,13))
write.csv(Invalsi_wide, file = "Invalsi/DB_Invalsi.csv", row.names = FALSE)


##' #--------------------------------------------------------------------------#
#'  #              Complete datasets                                           #
#'  #--------------------------------------------------------------------------#           
#'
#'  Not advisable to load them due to multiple owners and ungodly metadata.
#'  Requires Invalsi data, to be loaded from previous section!
#'  
#'  
# 2015/16 data -----------------------------------------------------------------

Registry16 <- SchoolDataIT::Get_Registry(2016)
input_DB16_MIUR <- SchoolDataIT::Get_DB_MIUR(2016, 
                                             input_Registry = Registry16, 
                                             certifications = T)
input_nstud_16 <- SchoolDataIT::Get_nstud(Year = 2016)
nteachers_16 <- SchoolDataIT::Get_nteachers_prov(Year = 2016)
School2mun16 <- SchoolDataIT::Get_School2mun(2016, input_Registry = Registry16)

# Output dataset
DB16_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB16_MIUR,
                       input_nstud = input_nstud_16,
                       input_nteachers = nteachers_16, 
                       input_Registry = Registry16, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun16,
                       BroadBand = FALSE,
                       ord_InnerAreas = TRUE, 
                       SchoolBuildings_include_qualitatives = T,
                       SchoolBuildings_flag_outliers = F,
                       SchoolBuildings_col_cut_thresh = nrow(input_DB16_MIUR),
                       SchoolBuildings_count_missing = T,
                       NA_autoRM = F)
library(magrittr)
# These variables are of no interest
DB16_mun <- DB16_mun %>%  dplyr::select(-.data$Other,
                                        -.data$Other_MP)  




# export
write.csv(DB16_mun, file = "DB16.csv", row.names = FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB16_mun))), file = "field_track_2016.csv", row.names = FALSE)






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
#input_BB200901 <- SchoolDataIT::Get_BroadBand(Date = as.Date("2020-09-01"))
School2mun21 <- SchoolDataIT::Get_School2mun(2021, input_Registry = Registry21)

# Output dataset
DB21_mun <- 
  SchoolDataIT::Set_DB(input_SchoolBuildings = input_DB21_MIUR,
                       input_nstud = input_nstud_21,
                       input_nteachers = nteachers_21, 
                       input_Registry = Registry21, 
                       input_Invalsi_IS = input_Invalsi_mun,
                       input_School2mun = School2mun21,
                       BroadBand = FALSE,
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
                                       -.data$Other, -.data$Other_devices, -.data$Other_specify,
                                       -.data$Other_disturbances_proximity_MP,
                                       -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                                       -.data$Other_specify_MP, -.data$Other_devices_MP)  


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
                                       -.data$Other, -.data$Other_devices, -.data$Other_specify,
                                       -.data$Other_disturbances_proximity_MP,
                                       -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                                       -.data$Other_specify_MP, -.data$Other_devices_MP)  


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
                           -.data$Other, -.data$Other_devices, -.data$Other_specify,
                           -.data$Other_disturbances_proximity_MP,
                           -.data$Other_specific_criticalities_MP, -.data$Other_MP, 
                           -.data$Other_specify_MP, -.data$Other_devices_MP)  


# export
write.csv(DB23_mun, file = "DB23.csv", row.names= FALSE)


# BLANK field track - FILLED IN MANUALLY VIA EXCEL
#write.csv(data.frame(sort(names(DB23_mun))), file = "field_track_2023.csv", row.names = FALSE)


