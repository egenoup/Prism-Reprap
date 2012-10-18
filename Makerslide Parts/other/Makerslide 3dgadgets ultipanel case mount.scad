// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>


$fn=40;

translate([60,0,0]) rotate([0,0,90]) displaymount();
translate([60,50,0]) rotate([0,0,90]) displaymount();


module displaymount()
{
	difference()
	{
		union()
		{
			translate([0,20,0]) cube([40,20,6]);
			translate([0,0,0]) cube([20,60,6]);
		}

		translate([30,30,-0.1]) cylinder(r=m4_diameter/2,h=7);
		translate([10,10,-0.1]) cylinder(r=m3_diameter/2,h=7);
		translate([10,50,-0.1]) cylinder(r=m3_diameter/2,h=7);	

		translate([10,10,-0.1]) cylinder(r=m3_nut_diameter/2,h=3.1,$fn=6);
		translate([10,50,-0.1]) cylinder(r=m3_nut_diameter/2,h=3.1,$fn=6);
	}	
}