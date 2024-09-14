#' meta_social UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_meta_social_ui <- function(id) {
  ns <- NS(id)

  tagList(
    metathis::meta() |>
      metathis::meta_description(
        "Establish deficits, discrepancies, or dissociations for the single-case in neuropsychology."
      ) |>
      metathis::meta_social(
        title = "Divergence",
        description = "Establish deficits, discrepancies, or dissociations for the single-case in neuropsychology.",
        url = "https://chris-gaskell.shinyapps.io/dissociations/",
        #image = "inst/app/www/hex-Divergence.jpg",
        image = "www/hex-Divergence.jpg",
        image_alt = "An image of the front page for the Divergence app.",
        twitter_creator = "@chrisgaskell92",
        og_author = "Dr Chris Gaskell",
        twitter_card_type = "app",
        twitter_site = "@chrisgaskell92"
      )
  )
}


#' meta_social Server Functions
#'
#' @noRd
mod_meta_social_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_meta_social_ui("meta_social_1")

## To be copied in the server
# mod_meta_social_server("meta_social_1")
