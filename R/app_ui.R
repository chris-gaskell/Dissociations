#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    mod_meta_social_ui("meta_social_1"),
    navbarPage(
      title = "Divergence",
      theme = my_theme,

      # Intro panel
      tabPanel(
        "About",
        intro_ui("intro_ui")
      ),

      # Tools menu
      navbarMenu(
        "Tools",
        tabPanel(
          "Deficits",
          mod_deficit_ui("deficit_1")
        ),
        tabPanel(
          "Discrepancies",
          mod_discrepancy_ui("discrepancy_1")
        ),
        tabPanel(
          "Dissociations",
          mod_dissociation_ui("dissociation_1")
        )
      ),

      # Info menu
      info_ui("info")
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
    tags$link(rel = "stylesheet", type = "text/scss", href = "www/styles.scss"),

    tags$style(
      HTML(".horizontal-inputs .form-group { display: inline-block; margin-right: 10px; }")
    ),
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Dissociations"
    )
  )
}
