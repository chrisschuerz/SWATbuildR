% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input_checks_settings.R
\name{check_line_topology}
\alias{check_line_topology}
\title{Check different line feature properties before writing it into the project
data folder.}
\usage{
check_line_topology(layer, data_path, label, length_fct, can_cross = FALSE)
}
\arguments{
\item{layer}{Line feature layer}

\item{data_path}{Path of the project data folder}

\item{label}{Layer name to print in error message}

\item{length_fct}{Numeric value to define what amount of the Q25 of length
should be used to calculate threshold for short line features.}

\item{can_cross}{Boolean value to allow or restrict crossing features (this
may be relevant to ignore channel underpasses and not trigger an error in
such a case)}
}
\value{
Shape file layers which indicate issues in case of identified issues.
}
\description{
The function intersects the input line layer with the basin boundary layer.
With the intersected layer toplogical checks are performed to check
for MULTILINE features, invalid features, short features and crossing
features.
The function returns the intersected layer if all checks run
without any identified issues.
Otherwise vector layers are written to the project data/vector folder
containing the features that caused issues in the respective checks.
If at least one check identifies an issue, an error is triggered.
}
