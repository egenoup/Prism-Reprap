// C. Strang		
// cstrang@????
// funfor.us

include <configuration.scad>;
use <..\Y Motor Bracket.scad>;

h = 6;   	// base thickness
fmp = true;	// four mount points


$fn=30;

difference()
	{ 
	translate([0,6,0]) rotate([90,0,0]) cube([42,20,h]);
	translate([10,-0.1,12]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	translate([30,-0.1,12]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	}

translate([0,5.8,0]) nema17spacer();


translate([0.2,20,0]) rotate([90,0,-90]) support();
translate([47.8,20,0]) rotate([90,0,-90]) support();


module nema17spacer()
{
	difference()
	{
		nema17motormount(h,fmp);
	}
}


module support()
{
difference()
	{
	translate([0,0,0]) cube([20,20,6]);
	translate([-6,0,-0.1]) mirror([0,0,0]) rotate([0,0,45]) cube([30,20,6.2]);
	}
}