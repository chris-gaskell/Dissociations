#' discrepancy UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
library(shiny)

mod_discrepancy_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("Discrepancies"),

    h2("Parameters"),
    fluidRow(
      column(
        12,
        div(
          class = "horizontal-inputs",
          discrep_method_ui(ns),
          common_params_ui(ns)
        )
      )
    ),

    sidebarLayout(
      sidebarPanel(width = 3,
                   h2("Input"),
                   class = "horizontal-inputs",
                   default_discrep_valus_ui(ns)
      ),
      mainPanel(width = 9,
                h2("Output"),
                actionButton(ns("calculate_btn"), label = tagList(icon("calculator"), "Calculate"), class = "btn-success"),
                mod_print_output_ui(ns("download_discrepancy"), "discrepancy"),
                actionButton(ns("set_defaults"), label = tagList(icon("cogs"), "Dummy Values"), class = "btn-info"),
                br(), br(),
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

    # Reactive value to store the discrepancy result
    discrepancy_result <- reactiveVal(NULL)

    # Observe event for setting default values
    observeEvent(input$set_defaults, {
      updateNumericInput(session, "ctrl.mean.x", value = 100)
      updateNumericInput(session, "ctrl.sd.x", value = 15)
      updateNumericInput(session, "ctrl.mean.y", value = 90)
      updateNumericInput(session, "ctrl.sd.y", value = 10)
      updateNumericInput(session, "ctrl.r.xy", value = 0.5)
      updateNumericInput(session, "ctrl.n", value = 30)
      updateNumericInput(session, "score.x", value = 110)
      updateNumericInput(session, "score.y", value = 95)
    })

    # Observe event for calculating discrepancy
    observeEvent(input$calculate_btn, {
      # Perform the calculation
      result <- neuropsytools::discrep(
        ctrl.mean.x = input$ctrl.mean.x,
        ctrl.sd.x = input$ctrl.sd.x,
        ctrl.mean.y = input$ctrl.mean.y,
        ctrl.sd.y = input$ctrl.sd.y,
        ctrl.r.xy = input$ctrl.r.xy,
        ctrl.n = input$ctrl.n,
        score.x = input$score.x,
        score.y = input$score.y,
        direction.x = tolower(input$direction.x),
        direction.y = tolower(input$direction.y),
        tail = input$tail,
        conf.level = as.numeric(input$ci),
        dp = input$dp,
        method = tolower(input$discrep_method),
        test.names =  c(input$test.name.x, input$test.name.y)
      )

      # Update the reactive value with the result
      discrepancy_result(result)
    })

    # Render the discrepancy result in the UI
    output$discrepancy <- renderPrint({
      req(discrepancy_result())  # Only render if the result is available
    })

    # Setup for downloadable output, if required
    mod_print_output_server("download_discrepancy", "discrep", discrepancy_result)
  })
}

## To be copied in the UI
# mod_deficit_ui("discrepancy_1")

## To be copied in the server
# mod_deficit_server("discrepancy_1")
