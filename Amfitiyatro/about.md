# Amphitheatre Optimization 


## Building Haystack

I use Dynamo for parametric design and NSGA-2 Algorithm for multi-objective optimization. 

Dynamo is a visual programming and design tool for architects and engineers. With Dynamo, you can create algorithms with nodes and wires as you can see below.



<img src="https://i.hizliresim.com/7BNGk5.png"
     alt="Amphitheatre Design in Dynamo"
     style="float: left; margin-right: 10px;" />

Adjust total width, curvature, and aisle interval at bottom row (subsequent rows offset out). Adjust row count and steepness incline. Maximize number of seats. Minimize average distance to focal point and ratio of obstructed to unobstructed views (clash with heads in front of viewer).

This can be a great tool for stadium design in order to optimize seating for both seat density and viewer sight range.


#### Parameters


* **Curvature** - Input (Curvature of Lines)
* **Bottom Row Length** - Input (Bottom Row Length bw/ Aisles)
* **Number of Rows** - Input
* **Incline** - Input
* **Bottom Row End** - Input
* **Number of Seats** - Output (Capacity of Amphitheatre)
* **Average Distance** - Output (Average Distance to Focal Point)
* **Obstructed Views Ratio** - Output

## Finding Needle

![Animation of all Designs](https://i.hizliresim.com/2O90j2.gif)