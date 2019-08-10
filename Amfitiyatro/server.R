library(shiny)
library(ggplot2)

opt <- read.csv(file = "RefineryResults.csv", header = T, sep = ",")

data(opt)

axis_vars <- colnames(opt)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {


    xvar <- reactive({
            switch (input$xaxis,
                "Number of Seats" = opt$Number.of.Seats,
                "Average Distance" = opt$Average.Distance.To.Focal.Point,
                "Obstructed Views Ratio" = opt$Obstructed.Views.Ratio,
                "Curvature"= opt$Curvature,
                "Bottom Row Length" = opt$Bottom.Row.Length.between.Aisles,
                "Number of Rows" = opt$Number.of.Rows,
                "Incline" = opt$Incline,
                "Bottom Row End" = opt$Bottom.Row.End
        )
    })

    yvar <- reactive({
        switch (input$yaxis,
                "Number of Seats" = opt$Number.of.Seats,
                "Average Distance" = opt$Average.Distance.To.Focal.Point,
                "Obstructed Views Ratio" = opt$Obstructed.Views.Ratio,
                "Curvature"= opt$Curvature,
                "Bottom Row Length" = opt$Bottom.Row.Length.between.Aisles,
                "Number of Rows" = opt$Number.of.Rows,
                "Incline" = opt$Incline,
                "Bottom Row End" = opt$Bottom.Row.End
        )
    })

    radius <- reactive({
        switch (input$radius,
                "Number of Seats" = opt$Number.of.Seats,
                "Average Distance" = opt$Average.Distance.To.Focal.Point,
                "Obstructed Views Ratio" = opt$Obstructed.Views.Ratio,
                "Curvature"= opt$Curvature,
                "Bottom Row Length" = opt$Bottom.Row.Length.between.Aisles,
                "Number of Rows" = opt$Number.of.Rows,
                "Incline" = opt$Incline,
                "Bottom Row End" = opt$Bottom.Row.End
        )
    })

    color <- reactive({
        switch (input$color,
                "Number of Seats" = opt$Number.of.Seats,
                "Average Distance" = opt$Average.Distance.To.Focal.Point,
                "Obstructed Views Ratio" = opt$Obstructed.Views.Ratio,
                "Curvature"= opt$Curvature,
                "Bottom Row Length" = opt$Bottom.Row.Length.between.Aisles,
                "Number of Rows" = opt$Number.of.Rows,
                "Incline" = opt$Incline,
                "Bottom Row End" = opt$Bottom.Row.End
        )
    })


    # Plot data with ggplot
    output$plot <- renderPlot({


        ggplot(opt, aes(x = xvar(), y = yvar(), size = radius(), color = color(), palette = "RdBu" )) +
            geom_point() +
            xlab(input$xaxis) +
            ylab(input$yaxis) +
            theme_minimal()

    })

    # output$info <- renderPrint({
    #     # With ggplot2, no need to tell it what the x and y variables are.
    #     # threshold: set max distance, in pixels
    #     # maxpoints: maximum number of rows to return
    #     # addDist: add column with distance, in pixels
    #     nearPoints(opt, input$plot_click, threshold = 10, maxpoints = 1,
    #                addDist = TRUE)
    # })

    output$summary <- renderPrint({
        summary(opt[, as.numeric(input$summ)])
    })

    output$regression <- renderPrint({


        if ( input$sfi2 == 0) {

            x <- as.numeric(input$sfo)
            y <- as.numeric(input$sfi1)

            lm <- lm(opt[,x]~opt[,y])
        }

        else {

            if (input$sfi3 == 0) {

                x <- as.numeric(input$sfo)
                y <- as.numeric(input$sfi1)
                z <- as.numeric(input$sfi2)

                lm <- lm(opt[,x]~opt[,y]+opt[,z])
            }

            else {

                if (input$sfi4 == 0) {

                    x <- as.numeric(input$sfo)
                    y <- as.numeric(input$sfi1)
                    z <- as.numeric(input$sfi2)
                    q <- as.numeric(input$sfi3)

                    lm <- lm(opt[,x]~opt[,y]+opt[,z]+opt[,q])
                }

                else {

                    if (input$sfi5 == 0) {

                        x <- as.numeric(input$sfo)
                        y <- as.numeric(input$sfi1)
                        z <- as.numeric(input$sfi2)
                        q <- as.numeric(input$sfi3)
                        w <- as.numeric(input$sfi4)

                        lm <- lm(opt[,x]~opt[,y]+opt[,z]+opt[,q]+opt[,w])

                    }

                    else {

                        x <- as.numeric(input$sfo)
                        y <- as.numeric(input$sfi1)
                        z <- as.numeric(input$sfi2)
                        q <- as.numeric(input$sfi3)
                        w <- as.numeric(input$sfi4)
                        u <- as.numeric(input$sfi5)

                        lm <- lm(opt[,x]~opt[,y]+opt[,z]+opt[,q]+opt[,w]+opt[,u])

                    }
                }

            }

        }

        summary(lm)
    })

})


