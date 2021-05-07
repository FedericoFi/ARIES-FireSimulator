# Fire Simulator and drone monitoring system for the ARIES project


This repository contains the first version of the fire propagation simulator developed in the scope of the ESA funded project ARIES.
To run the simulation it is necessary to:

1. Download the terrain altitude data and export it as **(.csv)**  with GIS.   Filename: **terrain_altitude**.csv   
2. Download the NDVI data and export its **(.csv)** with GIS. Filename: **NDVI_factor**.csv
3. Export as **.txt** from GIS the color map assigned by the software to each NDVI class. Filename: **colors**.txt

To run: launch the **_mainFire.m_**  
It present some setting variables such as:
- *iterations*: set the number of iterations for fire simulation
- *cluster_NDVI*: the number of levels on which the NDVI is quantised, in GIS software.
- *plot_voronoi*: if set to **1** plot the Voronoi partition of the area
- *plot_simulation*: if set to **1** plot the environment status during simulation
- *plot_wind*: if set to **1** plot the wind direction
- *plot_bitmap_total*: if set to **1** plot the bitmap of the entire area
- *cell_lenght*: describe the real lenght of the square cell size
- *horizontal_division*: is the number of horizontal elements (macro-cells) into which the area will be divided
- *vertical_division*: is the number of vertical elements (macro-cells) into which the area will be divided
- *wind_angle*: describe the wind direction
- *wind_vel*: describe the wind velocity
- *probability_vector_veg*: the burn probability associate to vegetation health status, which dimension is equal to [1 x cluster_NDVI]
- *rows*: the number of rows of the model. 
- *cols*: the number of cols of the model.  

_The last two parameters are stricly related to the regular grid point on GIS software._

A full documentation of the functionalities of this simulator and its user manual are currenlty being developed.
The mathematical model and the logic of the algorithms implemented are currently under review on for publication on an international journal.

Examples of simulation outputs:

Simulated fire propagation and drone formation surveillance

![simulated fire propagation and drone formation surveillance](https://github.com/FedericoFi/ARIES-FireSimulator/blob/main/Images/map.jpeg)

Animated mockup simulation (increased fire spread velocity)

![mockup simulation](https://github.com/FedericoFi/ARIES-FireSimulator/blob/main/Images/GIF_07-05-2021_2.gif)

Heatmap of fire spreading probability

![heatmap of fire spreading probability](https://github.com/FedericoFi/ARIES-FireSimulator/blob/main/Images/pburn.jpeg)

Changes in the fire risk-aware Vornoi partition of the monitored area depending on wind direction ( from 0° to 360°)

![changes in the fire risk-aware Vornoi partition of the monitored area depending on wind direction ( from 0° to 360°)](https://github.com/FedericoFi/ARIES-FireSimulator/blob/main/Images/voronoi.gif)

Visualization of the fire risk-aware Voronoi partition of the area 

![Fire risk-aware Voronoi partition of thearea visualization](https://github.com/FedericoFi/ARIES-FireSimulator/blob/main/Images/partitions.jpg)

