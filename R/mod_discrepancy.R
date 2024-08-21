#' discrepancy UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_discrepancy_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Discrepancy"),

    h2("Paramaters"),
    fluidRow(
      column(
        12,
        div(
          class = "horizontal-inputs",
          selectInput(ns("method"), "Method:", choices = c("RSDT", "USDT", "Difflims"), selected = "RSDT"),
          common_params_ui(ns)
        )
      )
    ),

    sidebarLayout(
      sidebarPanel(
        h2("Input"),
        h3("Individual Case"),
          numericInput(ns("score.x"), "Case Score for Test X:", value = 130),
          numericInput(ns("score.y"), "Case Score for Test Y:", value = 120),
        h3("Normative Data"),
          numericInput(ns("ctrl.mean.x"),  "Mean for Test X:", value = 100),
          numericInput(ns("ctrl.sd.x"),    "SD for Test X:", value = 15),
          numericInput(ns("ctrl.mean.y"),  "Mean for Test Y:", value = 110),
          numericInput(ns("ctrl.sd.y"),    "SD for Test Y:", value = 10),
          numericInput(ns("ctrl.r.xy"),    "r between Tests X and Y:", value = 0.7),
          numericInput(ns("ctrl.n"),       "Sample Size:", value = 30)
      ),
      mainPanel(
        h2("Output"),
          mod_print_output_ui(ns("download_discrepancy"), "discrepancy"),
          verbatimTextOutput(ns("discrepancy"))

      )
    )
  )
}

#' discrepancy Server Function
#'
#' @noRd
mod_discrepancy_server <- function(id){
  moduleServer(id, function(input, output, session){

      discrepancy_result <- reactive({
      neuropsytools::discrep(
        ctrl.mean.x = input$ctrl.mean.x,
        ctrl.sd.x = input$ctrl.sd.x,
        ctrl.mean.y = input$ctrl.mean.y,
        ctrl.sd.y = input$ctrl.sd.y,
        ctrl.r.xy = input$ctrl.r.xy,
        ctrl.n = input$ctrl.n,
        score.x = input$score.x,
        score.y = input$score.y,
        direction = tolower(input$direction),
        tail = input$tail,
        conf.level = as.numeric(input$ci),
        dp = input$dp,
        method = tolower(input$method)
        )
    })


      output$discrepancy <- renderPrint({
        discrepancy_result()
      })

      mod_print_output_server("download_discrepancy", "discrep", discrepancy_result)
  })
}

## To be copied in the UI
# mod_deficit_ui("discrepancy_1")

## To be copied in the server
# mod_deficit_server("discrepancy_1")
