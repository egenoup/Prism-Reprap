// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang

include <..\configuration.scad>


$fn=30;

translate([0,0,0]) msyflag();

module msyflag()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([20,17,6]);




			translate([31.5,16.5,0]) cube([1.5, 9, 20]);
			#translate([19.9,13,0]) cube([13.1, 4, 20]);
			//translate([0,26.4,0]) cube([10, 4, 5.5]);
			//translate([0,0,0]) cube([10, 17.5, 2]);
			

		}
		translate([10,7,-0.1]) cylinder(h=7,r=m4_diameter/2);

//		translate([5,5,-0.1]) cylinder(h=7,r=m3_diameter/2);
		
	}
}


