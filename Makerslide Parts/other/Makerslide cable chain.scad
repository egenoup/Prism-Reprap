// C. Strang		
// cstrang@????
// funfor.us

include <../configuration.scad>;

// fully parametric cable chain by Joerg, thingiverse = 8239
use<chain_link_v2.scad>;


$fn=40;

for (x = [0:25:50])
{	
	translate([10+x,18,0]) chain_link(width= 20, length=20, height=15, under_angle=0, over_angle=60, inner_axis=true, closed=false);
}

for (x = [75:25:125])
{	
	translate([10+x,18,0]) chain_link(width= 20, length=20, height=15, under_angle=60, over_angle=-1, inner_axis=true, closed=false);
}

// width, lenght, height are obvious...
// under_angle - max. angle allowed to bend downwards
// over_angle  - max. angle allowed to bend upwards
// inner_axis  - boolean: true - connectors go from outside to inside; false - vise versa
// closed  - boolean: true - top is closed, no holes; false - top is open, hole on both sides (for toothpick piece)
