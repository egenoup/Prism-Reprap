// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;
use <..\..\Y Motor Bracket.scad>;

h = 6;   	// base thickness
fmp = false;	// four mount points


$fn=30;


translate([0,0,0]) nema17motormount(h,fmp);

//#translate([16,42,0]) cube([20,10,10]);
translate([10,41.9,0]) difference()
{

	cube([h,20,20]);
	#translate([-0.1,10,10]) rotate([0,90,0]) cylinder(r=m4_diameter/2,h=7);
}

translate([36,41.9,0]) difference()
{

	cube([h,20,20]);
	#translate([-0.1,10,10]) rotate([0,90,0]) cylinder(r=m4_diameter/2,h=7);
}

translate([10,40,0]) cube([32,2,20]);

/*
translate([42,40,20]) rotate([-90,90,0]) support(2);
translate([10,42,20]) rotate([90,90,0]) support(2);
translate([16,50,20]) rotate([180,90,0]) support(6);
*/

module support(wid)
{
difference()
	{
	translate([0,0,0]) cube([20,20,wid]);
	translate([-wid,0,-0.1]) mirror([0,0,0]) rotate([0,0,45]) cube([30,20,wid+0.2]);
	}
}