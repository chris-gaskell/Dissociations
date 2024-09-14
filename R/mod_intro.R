intro_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      # Introduction section with text on the left and image on the right
      column(8,
             h2("Introduction"),
             p("Welcome to Divergence, a Shiny App designed for professionals in clinical neuropsychology. This app offers automated tools for the assessment of single cases, providing clinicians and researchers with functionalities to determine if there are deficits, discrepancies, or dissociations in test scores when compared to normative samples."),
             p("All statistical methods included in this app are based on established techniques developed by experts in the field, notably Professor John Crawford. We acknowledge the contributions of previous developers and encourage users to cite the authors of these methods. References are provided where necessary."),
             p("We hope this app offers a convenient web-based option for calculating analyses that, to our knowledge, is not available elsewhere. Although similar tools exist, such as those provided by Professor John Crawford in a downloadable Delphi application, we recognize that browser-based solutions may be preferable or necessary in various contexts. Hence, we provide this alternative."),
             p("Divergence is built using the R programming environment with the R package `neuropsytools` and hosted as a Shiny app via shinyapps.io. For those interested in exploring additional functionalities, we recommend the `singcar` R package. We also suggest reading the article XXXX by the same package authors for further background and statistical details.")
      ),
      column(4,
             img(src = "www/hex-Divergence.png", width = "100%", align = "right")
      )
    )
  )
}
