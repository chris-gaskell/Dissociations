#' print_output UI Function
#'
#' @description A shiny Module for download handlers.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @param label A string indicating the label to use in the filename ("discrep" or "deficit").
#'
#' @importFrom utils capture.output
#' @noRd
#'
#' @importFrom shiny NS downloadButton
mod_print_output_ui <- function(id, label) {
  ns <- NS(id)
  tagList(
    downloadButton(ns("download"), "Download Output")
  )
}

#' print_output Server Function
#'
#' @noRd
mod_print_output_server <- function(id, label, result) {
  moduleServer(id, function(input, output, session) {
    output$download <- downloadHandler(
      filename = function() {
        paste0(label, "_output_", Sys.Date(), ".txt")
      },
      content = function(file) {
        # Base content to be written to the file
        content <- c(
          capture.output(print(result())),
          "\n\nCitation/s:\n",
          "- Made using the Shiny App {Divergence}: A web application for assessing deficits, discrepancies, and dissociations in clinical neuropsychology.",
          neuropsy_cite()
        )

        # Add additional references based on the label
        if (label == "deficit") {
          content <- c(content, deficit.refs)
        } else if (label == "discrep") {
          content <- c(content, discrep.refs)
        } else if (label == "dissoc") {
          content <- c(content, dissoc.refs)
        }

        # Write content to file
        writeLines(content, con = file)
      }
    )
  })
}

deficit.refs <- paste(
  "- Crawford, J.R., & Howell, D.C. (1998). Comparing an individual’s test score against norms derived from small samples. The Clinical Neuropsychologist, 12(4), 482-486.",
  "- Crawford, J.R., & Garthwaite, P.H. (2002). Investigation of the single case in neuropsychology: confidence limits on the abnormality of test scores and test score differences. Neuropsychologia, 40(2002), 1196–1208.",
  "- Crawford, J.R., & Garthwaite, P.H. (2007). Comparison of a single case to a control or normative sample in neuropsychology: Development of a Bayesian approach. Cognitive Neuropsychology, 24(4), 343-372.",
  sep = "\n"
  )
discrep.refs <- paste(
  "- Crawford, J.R., Howell, D.C., & Garthwaite, P.H. (1998). Payne and Jones Revisited: Estimating the Abnormality of Test Score Differences Using a Modified Paired Samples t Test. Journal of Clinical and Experimental Neuropsychology, 20(6), 898-905.",
  "- Crawford, J.R., & Garthwaite, P.H. (2002). Investigation of the single case in neuropsychology: confidence limits on the abnormality of test scores and test score differences. Neuropsychologia, 40(2002), 1196–1208.",
  "- Crawford, J. R., & Garthwaite, P. H. (2005). Evaluation of criteria for classical dissociations in single-case studies by Monte Carlo simulation. Neuropsychology, 19(5), 664–678.",
  sep = "\n"
)
dissoc.refs <- paste(
  "- Crawford, J.R., & Howell, D.C. (1998). Comparing an individual’s test score against norms derived from small samples. The Clinical Neuropsychologist, 12(4), 482-486.",
  "- Crawford, J.R., Howell, D.C., & Garthwaite, P.H. (1998). Payne and Jones Revisited: Estimating the Abnormality of Test Score Differences Using a Modified Paired Samples t Test. Journal of Clinical and Experimental Neuropsychology, 20(6), 898-905.",
  "- Crawford, J.R., & Garthwaite, P.H. (2002). Investigation of the single case in neuropsychology: confidence limits on the abnormality of test scores and test score differences. Neuropsychologia, 40(2002), 1196–1208.",
  "- Crawford, J.R., Garthwaite, P.H., & Porter, S. (2010). Point and interval estimates of effect sizes for the case-controls design in neuropsychology: Rationale, methods, implementations, and proposed reporting standards. Cognitive Neuropsychology, 27(3), 245-260.",
  sep = "\n"
)
neuropsy_cite <- function() {
  "- Gaskell, C. (2024). neuropsytools: Tools for Neuropsychology. R package version 0.0.0.9000. Available at: https://chris-gaskell.github.io/neuropsytools/"
}

#' Action Button UI Module
#'
#' @description A shiny Module to create an action button.
#'
#' @param id Internal parameter for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList actionButton


