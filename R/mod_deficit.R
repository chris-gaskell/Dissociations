#' deficit UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_deficit_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Deficits"),

    h2("Parameters"),
    fluidRow(
      column(
        12,
        div(
          class = "horizontal-inputs",
          deficit_method_ui(ns),
          common_params_ui(ns)
        )
      )
    ),

    fluidRow(
      sidebarLayout(
        sidebarPanel(width = 3,
                     h2("Input"),
                     default_deficit_valus_ui(ns),
        ),
        mainPanel(width = 9,
                  h2("Output"),
                  actionButton(ns("calculate_btn"), label = tagList(icon("calculator"), "Calculate"), class = "btn-success"),
                  mod_print_output_ui(ns("download_deficit"), "deficit"),
                  actionButton(ns("set_defaults"), label = tagList(icon("cogs"), "Dummy Values"), class = "btn-info"),
                  br(), br(),
                  verbatimTextOutput(ns("deficit"))
        )
      )
    )
  )
}

#' deficit Server Function
#'
#' @noRd
mod_deficit_server <- function(id) {
  moduleServer(id, function(input, output, session) {

    # Create a reactive value to store the deficit result
    deficit_result <- reactiveVal(NULL)

    observeEvent(input$set_defaults, {
      updateNumericInput(session, "score", value = 100)
      updateNumericInput(session, "ctrl.mean", value = 130)
      updateNumericInput(session, "ctrl.sd", value = 15)
      updateNumericInput(session, "ctrl.n", value = 30)
    })

    observeEvent(input$calculate_btn, {
      set.seed(123)

      # Perform calculation based on selected method
      result <- if (input$deficit_method == "bayes") {
        neuropsytools::deficit_bayes(
          score = input$score,
          ctrl.mean = input$ctrl.mean,
          ctrl.sd = input$ctrl.sd,
          ctrl.n = input$ctrl.n,
          direction = tolower(input$direction),
          tail = input$tail,
          conf.level = as.numeric(input$ci),
          dp = input$dp
        )
      } else {
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
      }

      # Update the reactive value with the result
      deficit_result(result)
    })

    output$deficit <- renderPrint({
      req(input$calculate_btn)  # Ensure that the button is pressed before showing output
      result <- deficit_result()
      if (is.null(result)) {
        "No result to display. Please press 'Calculate Deficit'."
      } else {
        result
      }
    })

    # Handle download button
    mod_print_output_server("download_deficit", "deficit", deficit_result)
  })
}


## To be copied in the UI
# mod_deficit_ui("deficit_1")

## To be copied in the server
# mod_deficit_server("deficit_1")
