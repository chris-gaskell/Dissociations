#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    fluidPage(
      theme = bslib::bs_theme(
        version = 5,
        bootswatch = "flatly", #primary = "darkgreen"
      ),
      tags$head(
        tags$style(
          HTML(".horizontal-inputs .form-group { display: inline-block; margin-right: 10px; }")
        )
      ),

      h1("FirstGolem"),

      fluidRow(
      tabsetPanel(
        tabPanel(
          "Deficits",
          mod_deficit_ui("deficit_1")
        ),
        tabPanel(
          "Discrepancies",
          mod_discrepancy_ui("discrepancy_1")
        )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "FirstGolem"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
