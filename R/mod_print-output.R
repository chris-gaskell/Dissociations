#' print_output UI Function
#'
#' @description A shiny Module for download handlers.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param label A string indicating the label to use in the filename ("discrep" or "deficit").
#'
#' @noRd
#'
#' @importFrom shiny NS downloadButton
mod_print_output_ui <- function(id, label) {
  ns <- NS(id)
  downloadButton(ns("download"), "Download Output")
}

#' print_output Server Function
#'
#' @noRd
mod_print_output_server <- function(id, label, result) {
  moduleServer(id, function(input, output, session) {
    output$download <- downloadHandler(
      filename = function() {
        paste0(label, "_output_", Sys.Date(), ".txt")
      },
      content = function(file) {
        writeLines(capture.output(print(result())), con = file)
      }
    )
  })
}
