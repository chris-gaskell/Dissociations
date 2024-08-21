common_params_ui <- function(ns) {
  tagList(
    selectInput(ns("direction"), "Direction:", choices = c("Lower", "Higher"), selected = "Lower"),
    selectInput(ns("tail"), "Hypothesis:", choices = c("One Tailed" = "one.tailed", "Two Tailed" = "two.tailed"), selected = "one.tailed"),
    selectInput(ns("ci"), "Confidence Level:", choices = c(.95, .90), selected = .95),
    numericInput(ns("dp"), "Decimal Places:", value = 2)
  )
}
