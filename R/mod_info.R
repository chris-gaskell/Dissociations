#' The Info User Interface Function
#'
#' @param id The namespace ID.
#' @import shiny
#' @noRd
info_ui <- function(id) {
  ns <- NS(id)

  current_date <- Sys.Date()
  formatted_date <- format(current_date, "%d %B %Y")

  navbarMenu(
    "Info",
    tabPanel(
      "Disclaimers",
      br(),
      h2("Disclaimers"),
      p("Welcome to Divergence! Before using this application, please read and acknowledge the following disclaimers:"),
      br(),
      h3("Security"),
      p("This app was created using Shiny and does not involve data storage or saving information. The information input during a session is not saved after the session ends. Shiny does not retain user data between sessions; it maintains the application state only for the duration of the session. Once the user closes the session or leaves the page, the data is typically discarded."),
      h3("Accuracy and Suitability"),
      p("This app is intended for informational purposes only. The author (Chris Gaskell) and any associated entities make no representations or warranties of any kind, express or implied, about the accuracy, reliability, completeness, or suitability of the information provided by this application. Users are advised to exercise their own judgment and seek professional advice when interpreting converted test scores."),
      h3("Use at Your Own Risk"),
      p("Users of this application acknowledge that they use it at their own risk. The author and associated entities shall not be liable for any direct, indirect, incidental, consequential, or special damages arising out of or in any way connected with the use of this application."),
      h3("No Guarantee of Updates"),
      p("The author reserves the right to modify, update, or discontinue this application without notice. There is no obligation to update the application to reflect changes in neuropsychological testing standards or practices."),
      #h3("Copyright Notice"),
      #p("This web application, including all code, design, and content, is the property of Dr. Chris Gaskell and is protected by copyright laws. All rights reserved. No part of this application may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the author, except in the case of brief quotations embodied in critical reviews and certain other noncommercial uses permitted by copyright law."),
      h3("Contact Information"),
      p("For any questions, concerns, or feedback regarding this app, please contact:"),
      br(),
      markdown(paste("**Dr. Chris Gaskell**<br>",
                     "**Email:** chris-gaskell@hotmail.co.uk<br><br>",
                     "By using this application, you signify your understanding and agreement with the terms outlined in this disclaimer.<br>",
                     "**Last updated:**", formatted_date))
    ),
    tabPanel(
      "Acknowledgments",
      fluidRow(
        column(12,
               h1("Software"),
               HTML("<p>Score Converter was built using <a href='https://shiny.posit.co/' target='_blank'>Shiny</a>, within the R programming environment.</p>
                       <p>Key packages used to build this program include:</p>
                       <ul>
                         <li><a href='https://bslib.r-lib.org/' target='_blank'>bslib</a> for Bootstrap themes.</li>
                         <li><a href='https://github.com/golem-project/golem' target='_blank'>golem</a> for application scaffolding.</li>
                         <li><a href='https://neuropsytools.r-lib.org/' target='_blank'>neuropsytools</a> for neuropsychological tools.</li>
                         <li>Shiny for interactive web applications.</li>
                         <li><a href='https://yihui.org/knitr/' target='_blank'>knitr</a> for dynamic report generation.</li>
                         </li>
                       </ul>")
        )
      ),
      # fluidRow(
      #   column(12,
      #          h1("People"),
      #          HTML("<p>Divergence was supported by many individuals. To name a few:</p>
      #                <ul>
      #                  <li>Callum Furniss for continued stats support.</li>
      #                  <li><a href='https://twitter.com/damopamine' target='_blank'>Damien Lowry</a> and <a href='https://twitter.com/northsideneuron' target='_blank'>Mark Mulrooney</a> for kindly sharing their data visualizations.</li>
      #                  <li><a href='https://twitter.com/AngelaPsyched' target='_blank'>Angela Baufeldt</a>, <a href='https://twitter.com/BealErin' target='_blank'>Erin Beal</a>, and <a href='https://twitter.com/EmBennett78' target='_blank'>Emily Bennett</a> for contributing to the development of the child xlsx forms.</li>
      #                  <li>Jon Crawford for the excellent lectures and book chapters.</li>
      #                </ul>")
      #   )
      # )
    ),
    tabPanel(
      "Feedback",
      fluidRow(
        column(12,
               h1("Contact Me"),
               HTML("<p>Thank you for using this tool!</p>
                     <p>If you have any suggestions, constructive criticism, or feature requests, please don't hesitate to <a href='mailto:chris-gaskell@hotmail.co.uk' target='_blank'>contact me <i class='fas fa-envelope'></i></a>.</p>
                     <p>This is an early developmental version, and I'm relatively new to programming. Your input can greatly contribute to its improvement.</p>
                     <ul>
                       <li><a href='https://twitter.com/chrisgaskell92' target='_blank'><i class='fab fa-twitter'></i> Twitter</a></li>
                       <li><a href='https://github.com/chris-gaskell' target='_blank'><i class='fab fa-github'></i> GitHub</a></li>
                       <li><a href='https://www.linkedin.com/in/chris-gaskell' target='_blank'><i class='fab fa-linkedin'></i> LinkedIn</a></li>
                     </ul>")
        )
      )
    )
  )
}
