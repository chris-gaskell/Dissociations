#' dissociation UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dissociation_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Dissociations"),

    h2("Parameters"),
    fluidRow(
      column(
        12,
        div(
          class = "horizontal-inputs",
          dissociation_method_ui(ns),
          common_params_ui(ns)
        )
      )
    ),

    fluidRow(
      sidebarLayout(
        sidebarPanel(width = 3,
                     h2("Input"),
                     default_discrep_valus_ui(ns),
        ),
        mainPanel(width = 9,
                  h2("Output"),
                  actionButton(ns("calculate_btn"), label = tagList(icon("calculator"), "Calculate"), class = "btn-success"),
                  mod_print_output_ui(ns("download_dissociation"), "dissociation"),
                  actionButton(ns("set_defaults"), label = tagList(icon("cogs"), "Dummy Values"), class = "btn-info"),
                  br(), br(),
                  verbatimTextOutput(ns("dissociation"))
        )
      )
    )
  )
}


#' dissociation Server Functions
#'
#' @noRd
mod_dissociation_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # Create a reactive value to store the dissociation result
    dissociation_result <- reactiveVal(NULL)

    observeEvent(input$set_defaults, {
      updateNumericInput(session, "score.x", value = 90)
      updateNumericInput(session, "score.y", value = 110)
      updateNumericInput(session, "ctrl.mean.x", value = 100)
      updateNumericInput(session, "ctrl.sd.x", value = 15)
      updateNumericInput(session, "ctrl.mean.y", value = 105)
      updateNumericInput(session, "ctrl.sd.y", value = 20)
      updateNumericInput(session, "ctrl.r.xy", value = 0.5)
      updateNumericInput(session, "ctrl.n", value = 30)
    })

    observeEvent(input$calculate_btn, {
      set.seed(123)

      # Perform the dissociation calculation
      result <- neuropsytools::dissociation(
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
        deficit_method = input$deficit_method,
        discrep_method = tolower(input$discrep_method),
        test.names = c(input$test.name.x, input$test.name.y)
      )

      # Update the reactive value with the result
      dissociation_result(result)
    })

    output$dissociation <- renderPrint({
      req(input$calculate_btn)  # Ensure that the button is pressed before showing output
      result <- dissociation_result()
      if (is.null(result)) {
        "No result to display. Please press 'Calculate Dissociation'."
      } else {
        result
      }
    })

    # Handle download button
    mod_print_output_server("download_dissociation", "dissociation", dissociation_result)
  })
}

## To be copied in the UI
# mod_dissociation_ui("dissociation_1")

## To be copied in the server
# mod_dissociation_server("dissociation_1")
