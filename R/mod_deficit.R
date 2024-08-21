#' deficit UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_deficit_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Deficits"),

    h2("Paramaters"),
    fluidRow(
      column(
        12,
        div(
          class = "horizontal-inputs",
          common_params_ui(ns)
        )
      )
    ),

    fluidRow(
    sidebarLayout(
      sidebarPanel(
        h2("Input"),
        h3("Individual Case"),
          numericInput(ns("score"), "Score:", value = 130),  # Corrected: ns() applied to IDs
        h3("Normative Data"),          numericInput(ns("ctrl.mean"), "Control Group Mean:", value = 100),
          numericInput(ns("ctrl.sd"), "Control Group SD:", value = 15),
          numericInput(ns("ctrl.n"), "Control Group Sample Size:", value = 30)
      ),
      mainPanel(
        h2("Output"),
        mod_print_output_ui(ns("download_deficit"), "deficit"),
          verbatimTextOutput(ns("deficit"))
        )
    )
    )
  )
}

#' deficit Server Function
#'
#' @noRd
mod_deficit_server <- function(id){
  moduleServer(id, function(input, output, session){

    deficit_result <- reactive({
      neuropsytools::deficit(
        score = input$score,
        ctrl.mean = input$ctrl.mean,
        ctrl.sd = input$ctrl.sd,
        ctrl.n = input$ctrl.n,
        direction = tolower(input$direction),
        tail = input$tail,
        conf.level = as.numeric(input$ci),
        dp = input$dp
      )
    })

    output$deficit <- renderPrint({
      deficit_result()
    })

    mod_print_output_server("download_deficit", "deficit", deficit_result)
  })
}

## To be copied in the UI
# mod_deficit_ui("deficit_1")

## To be copied in the server
# mod_deficit_server("deficit_1")
