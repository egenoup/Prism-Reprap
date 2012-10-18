// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang

include <..\configuration.scad>


$fn=30;

translate([0,0,0]) msyflag();
translate([20,5,0]) ms5mmbush();

module msyflag()
{
	difference()
	{
		union()
		{
			translate([4.25,16.5,5]) cube([1.5, 10, 10]);
			translate([0,15.5,0]) cube([10, 2, 15]);
			#translate([0,26.4,0]) cube([10, 4, 5.5]);
			translate([0,0,0]) cube([10, 17.5, 2]);
			

		}
		translate([5,5,-0.1]) cylinder(h=7,r=m3_diameter/2);
		
	}
}


module ms5mmbush()
{
	difference()
	{
		union()
		{
			cylinder(h=1,r=4);
			cylinder(h=3.5,r=2.5);
			
		}
		translate([0,0,-0.1]) cylinder(h=4,r=m3_diameter/2);
		
	}
}
