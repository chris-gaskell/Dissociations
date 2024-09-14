case.title <- "Individual Case:"
norm.title <- "Normative Data:"
width <- 150

default_deficit_valus_ui <- function(ns) {
  tagList(
    h3(case.title),
      numericInput(ns("score"), "Score:", value = NULL, width = width),  # Corrected: ns() applied to IDs
    h3(norm.title),
      numericInput(ns("ctrl.mean"), "Mean:", value = NULL, width = width),
      numericInput(ns("ctrl.sd"), "SD:", value = NULL, width = width),
      numericInput(ns("ctrl.n"), "Sample Size:", value = NULL, width = width)
  )
}

default_discrep_valus_ui <- function(ns) {
  tagList(
    h3(case.title),
      numericInput(ns("score.x"), "Test X Score:", value = NULL, width = width),
      numericInput(ns("score.y"), "Test Y Score:", value = NULL, width = width),
    h3(norm.title),
      numericInput(ns("ctrl.mean.x"),  "Test X Mean:", value = NULL, width = width),
      numericInput(ns("ctrl.sd.x"),    "Test X SD:", value = NULL, width = width),
    br(),
      numericInput(ns("ctrl.mean.y"),  "Test Y Mean:", value = NULL, width = width),
      numericInput(ns("ctrl.sd.y"),    "Test Y SD:", value = NULL, width = width),
    br(),
      numericInput(ns("ctrl.r.xy"),    "r:", value = NULL, width = width),
    br(),
      numericInput(ns("ctrl.n"),       "Sample Size:", value = NULL, width = width),
   br(),
     textInput(ns("test.name.x"), "Label X:", value = "Test X", width = width),
     textInput(ns("test.name.y"), "Label Y:", value = "Test Y", width = width),

  )
}

