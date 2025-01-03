# Set input/output paths -------------------------------------------

# Project path (where output files are saved) ----------------------
project_name <- ''

# Input data -------------------------------------------------------
## DEM raster layer path
dem_path <- './input_data/dem/dem_j.tif'

##Soil raster layer and soil tables paths
soil_layer_path  <- './input_data/soil/soil_j.tif'
soil_lookup_path <- './input_data/soil/soil_lookup_lrew.csv'
soil_data_path   <- './input_data/soil/usersoil_lrew.csv'

## Land input vector layer path
land_path <- './input_data/land/lulc_j.shp'

## Channel input vector layer path
channel_path <- './input_data/channel/streams_j_nhd.shp'

## Catchment boundary vector layer path, all layers will be masked by the
## basin boundary
bound_path <- './input_data/basin/bsn_boundary_dem_10m.shp'

## Path to point source location layer
point_path <- './input_data/point_source/pnt.shp'

# Settings ---------------------------------------------------------
## Project layers
## The input layers might be in different coordinate reference systems (CRS).
## It is recommended to project all layers to the same CRS and check them
## before using them as model inputs. The model setup process checks if
## the layer CRSs differ from the one of the basin boundary. By setting
## 'proj_layer <- TRUE' the layer is projected if the CRS is different.
## If FALSE different CRS trigger an error.
project_layer <- TRUE

## Set the outlet point of the catchment
## Either define a channel OR a reservoir as the final outlet
## If channel then assign id_cha_out with the respective id from the
## channel layer:
id_cha_out <- 10

## If reservoir then assign the respective id from the land layer to
##  id_res_out, otherwise leave as set
id_res_out <- NULL

## Threshold to eliminate land object connectivities with flow fractions
## lower than 'frc_thres'. This is necessary to i) simplify the connectivity
## network, and ii) to reduce the risk of circuit routing between land
## objects. Circuit routing will be checked. If an error due to circuit
## routing is triggered, then 'frc_thres' must be increased to remove
## connectivities that may cause this issue.
frc_thres <- 0.3

## Define wetland land uses. Default the wetland land uses from the SWAT+
## plants.plt data base are defined as wetland land uses. Wetland land uses
## should only be changed by the user if individual wetland land uses were
## defined in the plant data base.
wetland_landuse <- c('wehb', 'wetf', 'wetl', 'wetn')

## Maximum distance of a point source to a channel or a reservoir to be included
## as a point source object (recall) in the model setup
max_point_dist <- 500 #meters

# Script initialization --------------------------------------------
# PLEASE DO NOT CHANGE THESE SETTINGS
# ------------------------------------------------------------------

# Initialize paths -------------------------------------------------
## The model setup process generates raster and vector data. The paths
## are automatically generated based on the project path and the project
## name. Changing the paths below is not necessary. Keep them as they are.
##
##
## Path to data
data_path  <- './project_data'

## Create data folders
dir.create(paste0(data_path, '/vector'), recursive = T, showWarnings = FALSE)
dir.create(paste0(data_path, '/raster'), recursive = T, showWarnings = FALSE)

# Initialize whitebox tools ----------------------------------------
wbt_exe <- list.files(path = whitebox::wbt_data_dir(),
                      pattern = 'whitebox_tools.exe',
                      recursive = TRUE,
                      full.names = TRUE)

if(length(wbt_exe) == 0) {
  whitebox::wbt_install()
}

whitebox::wbt_init(exe_path = wbt_exe)
