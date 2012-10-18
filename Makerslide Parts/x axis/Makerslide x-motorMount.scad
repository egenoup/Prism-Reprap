// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>
use <..\..\Y Motor Bracket.scad>;

h = 6;   	// base thickness
fmp = true;	// four mount points
m5_diameter = 5.5;


$fn=30;

#difference()
	{ 
	translate([0,0,0]) cube([50,h,64]);
	translate([10,-0.1,34]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	translate([40,-0.1,34]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	translate([10,-0.1,54]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	translate([40,-0.1,54]) rotate([-90,0,0]) cylinder(r=m4_diameter/2,h=7);
	}



translate([0,5.9,0]) difference()
	{
		cube([50,16,h]);
		translate([12,h,-0.1]) cylinder(r=m5_diameter/2,h=h+0.2);
		translate([38,h,-0.1]) cylinder(r=m5_diameter/2,h=h+0.2);
	}

		
translate([4,21.8,0]) nema17motormount(h,fmp);

translate([0,21.8,0]) cube([4.1,42,h]);
translate([45.9,21.8,0]) cube([4.1,42,h]);
		
translate([0.1,40,0]) rotate([90,0,-90]) support();
translate([55.9,40,0]) rotate([90,0,-90]) support();
	



module support()
{
difference()
	{
	translate([0,0,0]) cube([40,40,6]);
	translate([-6,0,-0.1]) mirror([0,0,0]) rotate([0,0,45]) cube([60,40,6.2]);
	}
}




