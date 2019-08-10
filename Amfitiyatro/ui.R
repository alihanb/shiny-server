library(markdown)
library(shiny)

# Define UI Navbar
shinyUI(
    navbarPage("Amphitheatre Optimization", # Navbar Headline
        tabPanel("About",
            fluidPage(
                column(8,
                    includeMarkdown("about.md")
                )
            )
        ),
        tabPanel("Plot",
            sidebarLayout(
                sidebarPanel(
                    selectInput(inputId = "xaxis",
                                label = "Select X Axis",
                                choices = c("Number of Seats",
                                            "Average Distance",
                                            "Obstructed Views Ratio",
                                            "Curvature",
                                            "Bottom Row Length",
                                            "Number of Rows",
                                            "Incline",
                                            "Bottom Row End"),
                                selected = "Number of Seats"),
                    selectInput(inputId = "yaxis",
                                label = "Select Y Axis",
                                choices = c("Number of Seats",
                                            "Average Distance",
                                            "Obstructed Views Ratio",
                                            "Curvature",
                                            "Bottom Row Length",
                                            "Number of Rows",
                                            "Incline",
                                            "Bottom Row End"),
                                selected = "Obstructed Views Ratio"),
                    selectInput(inputId = "radius",
                                label = "Show as Radius",
                                choices = c("Number of Seats",
                                            "Average Distance",
                                            "Obstructed Views Ratio",
                                            "Curvature",
                                            "Bottom Row Length",
                                            "Number of Rows",
                                            "Incline",
                                            "Bottom Row End"),
                                selected = "Obstructed Views Ratio"),
                    selectInput(inputId = "color",
                                label = "Show as Colour",
                                choices = c("Number of Seats",
                                            "Average Distance",
                                            "Obstructed Views Ratio",
                                            "Curvature",
                                            "Bottom Row Length",
                                            "Number of Rows",
                                            "Incline",
                                            "Bottom Row End"),
                                selected = "Obstructed Views Ratio")
                    ),
                mainPanel(
                    plotOutput("plot")
                )
            )
        ),
        tabPanel("Summary",
            sidebarLayout(
                sidebarPanel(
                    selectInput(inputId = "summ",
                                label = "Select Parameter",
                                choices = c("Number of Seats" = 1,
                                            "Average Distance" = 2,
                                            "Obstructed Views Ratio" = 3,
                                            "Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" =8),
                                selected = "Obstructed Views Ratio")
                ),
                mainPanel(
                    br(),
                    verbatimTextOutput("summary")
                )
            )
        ),
        tabPanel("Regression Analysis",
            sidebarLayout(
                sidebarPanel(
                    selectInput(inputId = "sfo",
                                label = "Select from Outputs (x)",
                                choices = c("Number of Seats" = 1,
                                            "Average Distance" = 2,
                                            "Obstructed Views Ratio" = 3),
                                selected = "Number of Seats"
                    ),
                    selectInput(inputId = "sfi1",
                                label = "Select First Input (y)",
                                choices = c("Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" = 8)
                    ),
                    selectInput(inputId = "sfi2",
                                label = "Select Second Input (z)",
                                choices = c("Choose a Parameter" = 0,
                                            "Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" = 8),
                                selected = "Choose a Parameter"
                    ),
                    selectInput(inputId = "sfi3",
                                label = "Select Third Input (q)",
                                choices = c("Choose a Parameter" = 0,
                                            "Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" = 8),
                                selected = "Choose a Parameter"
                    ),
                    selectInput(inputId = "sfi4",
                                label = "Select Fourth Input (w)",
                                choices = c("Choose a Parameter" = 0,
                                            "Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" = 8),
                                selected = "Choose a Parameter"
                    ),
                    selectInput(inputId = "sfi5",
                                label = "Select Fifth Input (u)",
                                choices = c("Choose a Parameter" = 0,
                                            "Curvature" = 4,
                                            "Bottom Row Length" = 5,
                                            "Number of Rows" = 6,
                                            "Incline" = 7,
                                            "Bottom Row End" = 8),
                                selected = "Choose a Parameter"
                    )
                ),
                mainPanel(
                    verbatimTextOutput("regression")
                )
            )

        )
        
    )
)
