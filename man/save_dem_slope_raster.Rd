% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dem_soil.R
\name{save_dem_slope_raster}
\alias{save_dem_slope_raster}
\title{Save DEM and slope raster layers}
\usage{
save_dem_slope_raster(dem, data_path)
}
\arguments{
\item{data_path}{Path of the project data folder}

\item{dem_path}{Path of the dem raster layer}
}
\value{
The prepared DEM and slope raster layers as .tif files.
}
\description{
The DEM is cropped for the basin boundaries and the slope is calculated based
on the terrain. Both layers are saved in the project data/raster folder.
}
