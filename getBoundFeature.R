#' Download park boundary feature classes
#' This function retrieves NPS boundaries from NPS online data sources that are
#'     updated quarterly.
#'
#' @param UnitCode 4-character park unit code. Typically from params$UnitCode. 
#' @param aoaExtent Extent of area to be downloaded. The default is npsBound. 
#'     Options include the following:
#'     \itemize{
#'         \item \emph{park}: The park area of analysis (AOA); essentially the 
#'             park boundary.
#'         \item \emph{km3}: 3 km buffer AOA around the park AOA.
#'             See \code{\link{import_daily}} for details.
#'         \item \emph{km30}: 30 km buffer AOA around the park AOA.
#'         \item \emph{npsBound}: The most up-to-date NPS park unit boundary 
#'             polygon.
#'         \item \emph{npsTract}: The most up-to-date NPS unit tract polygon.
#'     }  
#' @param lifecycle The lifecycle of the data.
#'
#' @return An sf object, polygon
#' 
#' @examples getBoundFeature(params$UnitCode, aoaExtent = "npsBounds")
getBoundFeature <- function(UnitCode, aoaExtent="npsBound", lifecycle = "Active") {
  tempOutput <- file.path("temp.geojson")
  featureServiceURLs <-
    list("park" = "https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/IMD_BND_ALL_UNITS_park_AOA_nad_py/FeatureServer/0", #park AOAs
         "km3" = "https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/IMD_BND_ALL_UNITS_3km_AOA_nad_py/FeatureServer/1", # 3km AOAs
         "km30" = "https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/IMD_BND_ALL_UNITS_30km_AOA_nad_py/FeatureServer/2", # 30km AOAs
         "npsBound" = "https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/NPS_Land_Resources_Division_Boundary_and_Tract_Data_Service/FeatureServer/2", # NPS unit boundary polygons, updated quarterly
         "npsTract" = "https://services1.arcgis.com/fBc8EJBxQRMcHlei/arcgis/rest/services/NPS_Land_Resources_Division_Boundary_and_Tract_Data_Service/FeatureServer/1" #NPS unit tract polygons, updated quarterly
    )
  
  # Request feature in WGS83 spatial reference (outSR=4326)
  if (aoaExtent == 'npsBound' | aoaExtent == 'npsTract') {
    featureServicePathInfo <- paste0('query?where=UNIT_CODE+%3D+%27', UnitCode,
                                     '%27&outFields=*&returnGeometry=true&outSR=4326&f=pjson')
  }
  else {
    featureServicePathInfo <- paste0('query?where=UNITCODE+%3D+%27', UnitCode,
                                     '%27&outFields=*&returnGeometry=true&outSR=4326&f=pjson')
  }
  featureServiceRequest <- paste(featureServiceURLs[[aoaExtent]],
                                 featureServicePathInfo, sep = "/" )
  print(featureServiceRequest)
  geoJSONFeature <- jsonlite::fromJSON(featureServiceRequest)
  
  # Have to save to temp file
  jsonFeature <- download.file(featureServiceRequest, tempOutput, mode = "w")
  # For rgdal 1.2+, layer (format) does not need to be specified
  featurePoly <- sf::st_read(dsn = tempOutput)
  # featurePoly <- readOGR(dsn = tempOutput)
  
  #featurePoly <- readOGR(dsn = tempOutput, layer = "OGRGeoJSON")
  return(featurePoly)
}

