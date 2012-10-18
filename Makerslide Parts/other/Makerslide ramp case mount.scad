// C. Strang		
// cstrang@????
// funfor.us

include <../configuration.scad>;

w = 78.4	;		// case width

$fn=40;

translate([0,0,0]) rampsmount();
translate([30,0,0]) rampsmount();

module rampsmount()
{
	difference()
	{
		cube([20,25+w,6]);
		translate([10,10,-0.1]) cylinder(r=m4_diameter/2,h=6.2);
		translate([10,95,-0.1]) cylinder(r=m3_diameter/2,h=6.2);

		translate([10,95,-0.1]) cylinder(r=m3_nut_diameter/2,h=3,$fn=6);

	}
	translate([5,25.2,5.9]) cube([10,4,5]);
}

