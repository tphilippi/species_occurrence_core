library(taxize)



mussel_orders <- c("Arcoida",
                    "Mytiloida",
                    "Unionida",
                    "Veneroida",
                    "Myida",
                    "Anomalodemata")
GBIF_mussels_orders <- taxize::get_gbifid(mussel_orders, ask = TRUE)


GBIF_mussel_orders <- c(9574493, 3247005, 9301143, 9310756, 841)

frmussel_families <- c("Margaritiferidae", "Unionidae")
# GBIF_mussels_families <-  taxize::get_gbifid(frmussel_families, ask = TRUE)
GBIF_mussel_families <- c(3462, 3461)

# freshwater snails
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
#GBIF_snails <- taxize::get_gbifid(snail_families, ask = TRUE)
GBIF_snails <- c(4357657, 2658, 6801, 2855, 2733, 3244920,
                 4956530, 2665, 6880641, 7063, 2668, 4305027,
                 6765, 2678, 5784108, 4963581, 2671, 4963617,
                 4561232, 2698, 3244638, 2688, 2689, 5523,
                 2699, 4304679, 6520254, 6520262, 3243719,
                 3243731, 2854, 2852, 2851, 6798)

# springsnails
springsnail_genus <- "Pyrgulopsis"
# GBIF_springsnails <- taxize::get_gbifid(springsnail_genus, ask = TRUE)
GBIF_springsnails <- 2299969


# Pollinators
# Bees
bee_families <- c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae", "Melittidae")
GBIF_bee_pollinators <- taxize::get_gbifid(bee_families, ask = TRUE)
GBIF_bee_pollinators <-c(7901, 4334, 7905, 7908, 7911, 4345)



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
GBIF_pollenwasps <- taxize::get_gbifid(Pollen_wasp_genera, ask = TRUE)
# this one is tricky, as Trimeria as a genus has 2 accepted values.
# the safe way to search is to include the gbifids for all accepted values.
GBIF_pollenwasps <- c(1312138, 1312317, 1312107, 1312230, 1312303,
                      1312141, 1311945, 1312194, 1312306, 1312327,
                      1311974,
                      3231211, 1312094)  # these are both Trimeria

# Butterflies:
butterfly_families <- c("Hesperiidae",
                        "Lycaenidae",
                        "Nymphalidae",
                        "Papilionidae",
                        "Pieridae",
                        "Riodinidae")
# GBIF_butterflies <- taxize::get_gbifid(butterfly_families, ask = TRUE)
GBIF_butterflies <- c(6953, 5473, 7017, 9417, 5481, 1933999)

# Moths:
moth_families <- c("Sphingidae",
                   "Arctiidae",
                   "Noctuidae",
                   "Sesiidae")
# GBIF_moths <- taxize::get_gbifid(moth_families, ask = TRUE)
GBIF_moths <- c(8868, 4548, 7015, 5340)

# Beetles:
beetle_families <- c("Cantharidae",
                     "Scarabaeidae",
                     "Cerambycidae",
                     "Nitidulidae",
                     "Cleridae")
# GBIF_beetles <- taxize::get_gbifid(beetle_families)
GBIF_beetles <- c(7777, 5840, 5602, 7840, 3795)


#   Flies:
fly_families <- c("Syrphidae",
                  "Ceratopogonidae",
                  "Muscidae",
                  "Calliphoridae",
                  "Bibionidae")
#GBIF_flies <- taxize::get_gbifid(fly_families, ask = TRUE)
GBIF_flies <- c(6920, 3340, 5564, 3335, 7281)

GBIF_insect_pollinators <- c(GBIF_bee_pollinators,
                             GBIF_pollenwasps,
                             GBIF_butterflies,
                             GBIF_moths,
                             GBIF_beetles,
                             GBIF_flies
                             )
