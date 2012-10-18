// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>
use <..\Y Motor Bracket.scad>;

h = 6;   	// base thickness
fmp = true;	// four mount points


$fn=30;

translate([0,0,0]) rotate([90,0,90])
	{
	difference()
		{ 
		translate([0,0,0]) rotate([0,0,0]) cube([40,20,h]);
		translate([10,12,-0.1]) rotate([0,0,0]) cylinder(r=m4_diameter/2,h=7);
		translate([30,12,-0.1]) rotate([0,0,0]) cylinder(r=m4_diameter/2,h=7);
		}
	
	
	translate([14,0,5.9]) cube([12,10,10]);
	difference()
		{
		translate([20,0.1,27]) rotate([-90,0,0]) cylinder(r=14,h=10.0);
		translate([20,0,27]) rotate([-90,0,0]) cylinder(r=10.95,h=10.2);
		}
	
	difference()
		{
		translate([20,0.1,27]) rotate([-90,0,0]) cylinder(r=14,h=1.0);
		translate([20,0,27]) rotate([-90,0,0]) cylinder(r=10,h=1.2);
		}
	}






