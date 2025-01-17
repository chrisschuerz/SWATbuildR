% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hru.R
\name{build_hru_input}
\alias{build_hru_input}
\title{Build the hru input tables.}
\usage{
build_hru_input(data_path)
}
\arguments{
\item{data_path}{Path of the project data folder}
}
\value{
The function writes 4 tables into tables.sqlite:
\itemize{
\item hru.hru_con
\item hru.hru_data_hru
\item hru.topography_hyd
\item hru.hydrology_hyd
\item hru.topo_id
}
}
\description{
Build the hru input tables.
}
