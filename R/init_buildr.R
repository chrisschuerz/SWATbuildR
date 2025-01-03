#' Initialize a new SWATbuildR project
#'
#' `initialize_buildr()` initializes a template SWATbuildR project. The routine
#' creates a new project folder with the name `project_name` in `path`. The
#' folder contains the complete structure of a SWATbuildR project and contains
#' demo data which must be replaced with your own input data. The input files
#' can be named differently than the demo data. The file paths of the renamed
#' files must be defined in the settings file *settings.R*. The scripted
#' workflow to build a SWATbuildR model setup is then available in the R script
#' *swatbuildr.R* which is located in the generated project folder.
#'
#' @param project_name Name of the new SWATbuildR project (This will be the name
#'   of the project folder).
#' @param path Path where the hard project folder should be initialized.
#' @param start_new_session Open R project in new or the current R session.
#'
#' @return Generates and opens a template for a new SWATbuildR project.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' initialize_buildr('test_project', '~/', start_new_session = TRUE)
#' }
#'
initialize_buildr <- function(project_name, path, start_new_session = FALSE) {
  # Project path of the new project
  project_path <- paste0(path, '/', project_name)

  # Check if a folder with the same name already exists.
  if(dir.exists(project_path)) {
    stop("Folder '",  project_path, "' already exists!")
  }

  # Create folder structure for hard calibration project.
  dir.create(project_path)
  dir.create(paste0(project_path, '/input_data'))

  # Copy SWATbuildR project files and demo data into the project.
  file_path <- paste0(system.file(package = "SWATbuildR"), '/extdata')

  file.copy(list.files(file_path, full.names = TRUE),
            project_path, recursive = TRUE)

  # Add the project_name in settings.R
  settings <- readLines(paste0(project_path, '/settings.R'))
  line_id <- grepl("project_name <- ''", settings)
  settings[line_id] <- paste0("project_name <- '", project_name, "'")
  write_lines(settings, paste0(project_path, '/settings.R'))

  # Initialize and load R project
  rstudioapi::initializeProject(path = project_path)
  rstudioapi::openProject(path = project_path, newSession = start_new_session)
}
