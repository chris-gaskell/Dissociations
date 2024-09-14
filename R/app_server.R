#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom golem get_golem_options
#' @noRd
app_server <- function(input, output, session) {
  mod_meta_social_server("meta")
  mod_deficit_server("deficit_1")
  mod_discrepancy_server("discrepancy_1")
  mod_dissociation_server("dissociation_1")
}
