mussel_orders <- c("Arcoida",
                   "Mytiloida",
                   "Unionida",
                   "Veneroida",
                   "Myoida",
                   "Anomalodemata")

snail_families <- c("Neritiliidae",
                    "Neritidae",
                    "Ampullariidae",
                    "Viviparidae",
                    "Melanopsidae",
                    "Pachychilidae",
                    "Paludomidae",
                    "Pleuroceridae",
                    "Semisulcospiridae",
                    "Thiaridae",
                    "Littorinidae",
                    "Amnicolidae",
                    "Assimineidae",
                    "Bithyniidae",
                    "Cochliopidae",
                    "Helicostoidae",
                    "Hydrobiidae",
                    "Lithoglyphidae",
                    "Moitessieriidae",
                    "Pomatiopsidae",
                    "Stenothyridae",
                    "Nassariidae",
                    "Marginellidae",
                    "Glacidorbidae",
                    "Valvatidae",
                    "Acochlidiidae",
                    "Tantulidae",
                    "Strubelliidae",
                    "Chilinidae",
                    "Latiidae",
                    "Acroloxidae",
                    "Lymnaeidae",
                    "Planorbidae",
                    "Physidae")

# springsnails
springsnail_genus <- "Pyrgulopsis"

# Bees
bee_families <- c("Andrenidae, Apidae, Colletidae, Halictidae, Megachilidae, and Mellittidae")



# Wasps: Masarinae (pollen wasp family)
# Pollen wasps
# You only need to prioritize one genera: Pseudomasaris
# If you're really wanting to be precise and pull, all the genera are as follows:
Pollen_wasp_genera <- c("Priscomasaris",
                        "Metaparagia",
                        "Paragia",
                        "Celonites",
                        "Ceramiopsis",
                        "Ceramius",
                        "Jugurtia",
                        "Masarina",
                        "Masaris",
                        "Pseudomasaris",
                        "Quartinia",
                        "Trimeria")

# Butterflies:
butterfly_families <- c("Hesperiidae",
                        "Lycaenidae",
                        "Nymphalidae",
                        "Papilionidae",
                        "Pieridae",
                        "Riodinidae")

# Moths:
moth_families <- c("Sphingidae",
                   "Arctiidae",
                   "Noctuidae",
                   "Sesiidae")

# Beetles:
beetle_families <- c("Cantharidae",
                     "Scarabaeidae",
                     "Cerambycidae",
                     "Nitidulidae",
                     "Cleridae")

#   Flies:
fly_families <- c("Syrphidae",
                  "Ceratopogonidae",
                  "Muscidae",
                  "Calliphoridae",
                  "Bibionidae")



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

