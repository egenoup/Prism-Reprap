// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang


include <..\configuration.scad>
corection = 1.17; 

$fn=30;

t=6;  //thickness

translate([0,0,0]) makerslideymount();
translate([60,0,0]) mirror([1,0,0]) makerslideymount();
translate([0,40,0]) mirror([0,1,0]) makerslideymount();
translate([60,40,0]) mirror([0,1,0]) mirror([1,0,0]) makerslideymount();

module makerslideymount()
{
	
	difference()
	{
		translate([0,0,0]) cube([25,17,t]);
		translate([15,10,-0.1]) rotate([0,0,0]) cylinder(h=t+0.2,r=m4_diameter/2);
	}

	translate([0.1,7,0]) difference()
	{
		translate([-20,0,0]) cube([20,t,20]);
		#translate([-10,-0.1,10]) rotate([0,90,90]) cylinder(h=t+0.2,r=m4_diameter/2);
	}

	translate([-t+0.1,0,0]) cube([t+0.2,13,t]);


	// triangle supports
	translate([-0.5,7,19.9]) rotate([-90,0,0]) difference()
	{
		translate([0,0,0]) cube([12,14,t]);
		translate([0,2,-0.1]) rotate([0,0,-45]) cube([12,30,t+1]);
		translate([-0.1,-0.1,-0.1]) cube([9,3,t+0.2]);
	}

	translate([-5.9,6.9,19.9]) rotate([-90,0,-90]) difference()
	{
		translate([0,0,0]) cube([12,14,t]);
		translate([0,2,-0.1]) rotate([0,0,-30]) cube([12,30,t+1]);
		translate([-0.1,-0.1,-0.1]) cube([9,3,t+0.2]);
	}

}

