library(shiny)
library(Cairo)
library(plotly)

opt <- read.csv(file = "RefineryResults.csv", header = T, sep = ",")

# axis_vars <- colnames(opt)

# c(
#   "Number of Seats" = Number.of.Seats,
#   "Average Distance" = Average.Distance.To.Focal.Point,
#   "Obstructed Views Ratio" = Obstructed.Views.Ratio,
#   "Curvature" = Curvature,
#   "Bottom Row Length" = Bottom.Row.Length.between.Aisles,
#   "Number of Rows" = Number.of.Rows,
#   "Incline" = Incline,
#   "Bottom Row End" = Bottom.Row.End
# )

