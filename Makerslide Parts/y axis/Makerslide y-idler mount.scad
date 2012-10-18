// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;

h = 6;   	// base thickness
m5_diameter = 5.4;
$fn=30;


difference()
{

	cube([62,20,h]);
	translate([10,10,-0.1]) rotate([0,0,0]) cylinder(r=m4_diameter/2,h=7);	
	translate([52,10,-0.1]) rotate([0,0,0]) cylinder(r=m4_diameter/2,h=7);
}

#translate([31,0,6]) cube([.5,6,.5]);
#translate([29.75,0,6]) cube([3,.5,.5]);

difference()
{
	translate([22-h,0,h-0.1]) cube([h,20,25]);
	translate([22-h-0.1,10-3.5,h+11+5]) rotate([0,90,0]) cylinder(r=m5_diameter/2,h=7);
}

difference()
{
	translate([40,0,h-0.1]) cube([h,20,25]);
	translate([40-0.1,10-3.5,h+11+5]) rotate([0,90,0]) cylinder(r=m5_diameter/2,h=7);
}

translate([20,30,0]) difference()
{
	cylinder(r=10/2,h=5);
	translate([0,0,-0.1]) cylinder(r=m5_diameter/2,h=7);
}