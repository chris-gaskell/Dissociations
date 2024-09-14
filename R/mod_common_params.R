common_params_ui <- function(ns) {
  tagList(
    selectInput(ns("tail"), label = "Hypothesis:",
                choices = c("One Tailed" = "one.tailed", "Two Tailed" = "two.tailed"),
                selected = "one.tailed", width = 100),
    selectInput(ns("ci"), label = "Confidence:",
                choices = c(.95, .90), selected = .95, width = 100),
    numericInput(ns("dp"), label = "Decimal Places:",
                 value = 2, width = 100)
  )
}

deficit_method_ui <- function(ns) {
  tagList(
    selectInput(ns("direction"), label = "Direction:",
                choices = c("Lower", "Higher"), selected = "Lower", width = 100),
    selectInput(ns("deficit_method"),
                label = "Deficit Method:", width = 100,
                choices = c("Bayesian" = "bayes", "Modified t" = "t"),
                selected = "Bayes"),
  )
}

discrep_method_ui <- function(ns) {
  tagList(
    selectInput(ns("direction.x"), label = "Direction X:",
                choices = c("Lower", "Higher"), selected = "Lower", width = 100),
    selectInput(ns("direction.y"), label = "Direction Y:",
                choices = c("Lower", "Higher"), selected = "Lower", width = 100),
    selectInput(ns("discrep_method"),
                label = "Discrep Method:", width = 100,
                choices = c("RSDT", "USDT", "Difflims"),
                selected = "RSDT"),
  )
}


dissociation_method_ui <- function(ns) {
  tagList(
    selectInput(ns("direction.x"), label = "Direction X:",
                choices = c("Lower", "Higher"), selected = "Lower", width = 100),
    selectInput(ns("direction.y"), label = "Direction Y:",
                choices = c("Lower", "Higher"), selected = "Lower", width = 100),
    selectInput(ns("deficit_method"),
                label = "Deficit Method:", width = 100,
                choices = c(#"Bayesian" = "bayes",
                            "Modified t" = "t"
                            ),
                selected = "Bayes"),
    selectInput(ns("discrep_method"),
                label = "Discrep Method:", width = 100,
                choices = c("RSDT", "USDT", "Difflims"),
                selected = "RSDT")

  )
}
