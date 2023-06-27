mussel_orders <- c("Arcoida",
                    "Mytiloida",
                    "Unionida",
                    "Veneroida",
                    "Myoida",
                    "Anomalodemata")
snail_families <- c("
 Neritiliidae and Neritidae
 Ampullariidae and Viviparidae
  Melanopsidae, Pachychilidae, Paludomidae, Pleuroceridae, Semisulcospiridae and Thiaridae
  Littorinidae, Amnicolidae, Assimineidae, Bithyniidae, Cochliopidae, Helicostoidae, Hydrobiidae, Lithoglyphidae, Moitessieriidae, Pomatiopsidae and Stenothyridae
   Nassariidae and Marginellidae
   Glacidorbidae and Valvatidae
   Acochlidiidae, Tantulidae and Strubelliidae
   Chilinidae, Latiidae, Acroloxidae, Lymnaeidae. Planorbidae ► and Physidae
   ")
# loop through MWR parks

TestUnits <- c("BRVB", "GERO", "KEWE", "OZAR", "SACN",
               "SLBE", "CUVA", "AGFO", "DETO", "ARPO")

# pull the AOA (boundary or HUCs)
# spatial query to GBIF on that park's AOA and order %in% mussel_orders
# count by species & in/near status
# max date by species

Jessica: full year SIP.

PhD in anthropology.  Postdoc with different R work.


where the mussels are in the midwest.

all parks in MWR plus DETO, ~60
FOLS

do we want to hit NPSpecies? Yes.
yes by park.
what about by taxa?  Can we do order, or just

______________
FWS ECOS server?
spit out boundary in wkt.
________


getHUC <- function()

USGS WBD
https://hydro.nationalmap.gov/arcgis/rest/services/wbd/MapServer/5/query?where=&text=&objectIds=&time=
&geometry=-81.0053484357498
%2C31.9883442642213
%2C-80.8782795964064
%2C32.0772444819988
&geometryType=esriGeometryEnvelope
&inSR=4326
&outSR=4326
&spatialRel=esriSpatialRelIntersects
&relationParam=
&outFields=*
&returnGeometry=true&returnTrueCurves=false
&maxAllowableOffset=
&geometryPrecision=
&having=
&returnIdsOnly=false
&returnCountOnly=false
&orderByFields=
&groupByFieldsForStatistics=
&outStatistics=
&returnZ=false
&returnM=false
&gdbVersion=
&historicMoment=&
returnDistinctValues=false
&resultOffset=
&resultRecordCount=
&queryByDistance=
&returnExtentOnly=false
&datumTransformation=
&parameterValues=
&rangeValues=
&quantizationParameters=
&featureEncoding=esriDefault
&f=geojson
