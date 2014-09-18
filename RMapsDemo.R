## File: RMapsDemo.R
## Description: Code file for demonstrating GIS/maps in R
## Copyright: (c) 2014, Hack-R.com (Jason D. Miller)

# Import Libraries and Functions ------------------------------------------
source("RMapsDemo_Functions.R")

# Load Data ---------------------------------------------------------------
attach(CityPopularity)

# Basic Maps --------------------------------------------------------------
# Ye olde map package
map("world", c("USA", "hawaii"), xlim = c(-180, -65), ylim = c(19, 72))

# googleVis ---------------------------------------------------------------
require(googleVis) 

GV <- gvisGeoChart(CityPopularity, locationvar='City', colorvar='Popularity',
                   options=list(region='US', height=350, 
                               displayMode='markers',
                               colorAxis="{values:[200,400,600,800],
                               colors:[\'red', \'pink\', \'orange',\'green']}")) 
plot(GV)

# Google Maps -------------------------------------------------------------
lat = c(40.702147,40.718217,40.711614);
lon = c(-74.012318,-74.015794,-73.998284);
center = c(mean(lat), mean(lon));
zoom <- min(MaxZoom(range(lat), range(lon)));

markers = paste0("&markers=color:blue|label:S|40.714511,-74.009684&markers=color:", 
                 "green|label:G|40.7104617,-74.00776730000001&markers=color:red|color:red|")

ClubMap <- GetMap(center=center, zoom=zoom,markers=markers,destfile = "Dolls.png");
PlotOnStaticMap(ClubMap)

# Inkscape ----------------------------------------------------------------
# If you want nice looking maps WITHOUT Google, then check out this 
#  R + Inkscape tut: 
#  http://www.r-bloggers.com/commandeering-a-map-from-pdf-or-eps-using-inkscape-and-r/ 
