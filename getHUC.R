# https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer

#-- Packages
# R packages used in this script
pkgLst <- c("dplyr",       # data management
            "glue",        # text string editing
            "ggplot2",     # plotting/graphing
            "here",        # navigating directories
            "htmltools",   # tools for HTML generation and output
            "htmlwidgets", # more html tools
            "jsonlite",    # JSON parser
            "kableExtra",  # table formatting
            "knitr",       # Markdown formatting
            "leaflet",     # spatial rendering
            "lubridate",   # dating
            "readr",       # writing TSV files
            "rgbif",       # retrieve data from GBIF
            "rgdal",       # geospatial data functions
            "sf",          # spatial functions
            "taxadb",      # taxa name validation
            "tibble",      # data structures
            "tidyr")       # data management
#-- Install
# Install packages if they aren't in your library
instPkgs <- pkgLst %in% rownames(installed.packages())
if (any(instPkgs == FALSE)) {
  install.packages(pkgLst[!instPkgs],
                   lib =  .libPaths()[1],
                   repos = "https://cloud.r-project.org",
                   type = 'source',
                   dependencies = TRUE,
                   quiet = TRUE)
}
# Load packages into work space
# Note: This script is written so the packages do not need to be loaded.
#     Comment out the next line if you want to supress loading packages.
invisible(lapply(pkgLst, library, character.only = TRUE))

##############


#' Download HUC flowlines or watershed polygons from USGS National Map.
#' This function retrieves HUC flowlines or watershed polygons from the
#'    USGS National Map Watershed Boundary Dataset
#'    https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer.
#'    Flowlines come from layer 0 WBDLine https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer/0
#'    for all HUC levels.
#'    Watershed boundary polygons come from separate layers for different HUC levels:
#'    2-digit HU (Region) (1)
#'    4-digit HU (Subregion) (2)
#'    6-digit HU (Basin) (3)
#'    8-digit HU (Subbasin) (4)
#'    10-digit HU (Watershed) (5)
#'    12-digit HU (Subwatershed) (6)
#'    14-digit HU (7)
#'    16-digit HU (8)
#'
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
#' @param lifecycle The lifecycle of the data.  The default is "Active"
#'
#' @param HUClevel The HUC level requested.  The default is 10.  Valid values are:
#'     \itemize{
#'         \item \emph{0}: \emph{flowlines, not watershed polygons}
#'         \item \emph{2}: Region
#'         \item \emph{4}: Subregion
#'         \item \emph{6}: Basin
#'         \item \emph{8}: Subbasin
#'         \item \emph{10}: Watershed
#'         \item \emph{12}: Subwatershed
#'         \item \emph{14}:
#'         \item \emph{16}:
#'     }
#'
#' @return An sf object, polygons for HUClevel 2-16, polylines for HUClevel 0 (flowlines)
#'
#' @examples getHUC(params$UnitCode, aoaExtent = "npsBound")
getHUC <- function(UnitCode, HUClevel = 10, AOA = "park", lifecycle = "Active") {

   # service number from HUC level parameter
   if ((HUClevel %% 2) != 0) stop("HUClevel must be an even number {2, 4, 6, 8, 10, 12, 14, or 16}",
                                 "\n", HUClevel, " was passed as the value")
   sn <- HUClevel %/%
   Unit_wkt <- getBoundFeature(UnitCode, AOA, lifecycle) |>
               sf::st_geometry()  |>
               sf::st_as_text()

   ServiceRequest <- paste0("https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer/",
                          sn, "/query?where=&text=&objectIds=&time=&geometry=",
  #                        "-93.43559%2C35.90863%2C-92.40064%2C36.17121",
                           Unit_wkt,
                          "&geometryType=esriGeometryEnvelope",
                          "&inSR=4326&outSR=4326",
                          "&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=*",
                          "&returnGeometry=true&returnTrueCurves=false&returnIdsOnly=false",
                          "&returnCountOnly=false&returnZ=false&returnM=false&returnDistinctValues=false",
                          "&returnExtentOnly=false&featureEncoding=esriDefault&f=geojson")
   tempOutput <- file.path("temp.geojson")
   geoJSONFeature <- jsonlite::fromJSON(ServiceRequest)
   jsonFeature <- download.file(featureServiceRequest, tempOutput, mode = "w")
   featurePoly <- sf::st_read(dsn = tempOutput)
   return(featurePoly)
} # bottom getHUC
test <- getHUC("VALL", 16)

getFlowlines <- function(UnitCode, AOA="npsBounds", lifecycle = "Active") {
   sn <- 0  # national map service number for flowlines
   Unit_wkt <- getBoundFeature(UnitCode, AOA, lifecycle) |>
               sf::st_geometry()  |>
               sf::st_as_text()

   ServiceRequest <- paste0("https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer/",
                          sn, "/query?where=&text=&objectIds=&time=&geometry=",
                          "-93.43559%2C35.90863%2C-92.40064%2C36.17121",
  #                         Unit_wkt,
                          "&geometryType=esriGeometryEnvelope",
                          "&inSR=4326&outSR=4326",
                          "&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=*",
                          "&returnGeometry=true&returnTrueCurves=false&returnIdsOnly=false",
                          "&returnCountOnly=false&returnZ=false&returnM=false&returnDistinctValues=false",
                          "&returnExtentOnly=false&featureEncoding=esriDefault&f=geojson")
   tempOutput <- file.path("temp.geojson")
   geoJSONFeature <- jsonlite::fromJSON(ServiceRequest)
   jsonFeature <- download.file(featureServiceRequest, tempOutput, mode = "w")
   featurePoly <- sf::st_read(dsn = tempOutput)
   return(featurePoly)
} # bottom getFlowlines

test <- getFlowlines("BUFF")



#############################################
# https://ipac.ecosphere.fws.gov/location/api
getIPac <- function(UnitCode, AOA = "park") {

Unit_wkt <- getBoundFeature(UnitCode, AOA, lifecycle) |>
            sf::st_geometry()  |>
            sf::st_as_text()


{
  "location.footprint": "{\"coordinates\":[[[-95.1306152,30.4486737],[-93.6584473,29.4061051],[-94.6691895,28.5314486],[-96.5368652,29.9834867],[-95.1306152,30.4486737]]],\"type\":\"Polygon\"}",
  "timeout": 2,
  "apiVersion": "1.0.0",
  "includeOtherFwsResources": true,
  "includeCrithabGeometry": false
}

}
