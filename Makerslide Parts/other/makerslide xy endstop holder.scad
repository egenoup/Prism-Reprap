// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang

include <..\configuration.scad>


$fn=30;

translate([0,0,0]) msyendholder1();
//translate([-3,29,11]) msyendholder1();
translate([0,23,0]) msyendholder2();


module msyendholder1()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([40, 18, 1]);
			translate([(m3_diameter/2)+2,(m3_diameter/2)+2,0]) cylinder(r=3.5, h=4);
			translate([(m3_diameter/2)+21.25,(m3_diameter/2)+2,0]) cylinder(r=3.5, h=4);

		}
		translate([(m3_diameter/2)+2,(m3_diameter/2)+2,-0.1]) cylinder(h=7,r=m3_diameter/2);
		translate([(m3_diameter/2)+21.25,(m3_diameter/2)+2,-0.1]) cylinder(h=7,r=m3_diameter/2);
	}
}

module msyendholder2()
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([24, 20, 6]);
			translate([0,0,0]) cube([24,2,11]);
			translate([0,18,0]) cube([24,2,11]);
			translate([19,10,0]) cylinder(r=3.5, h=11);

		}
		
		translate([19,10,-0.1]) cylinder(h=12,r=m3_diameter/2);
		translate([19,10,-0.1]) cylinder(h=5,r=m3_nut_diameter/2, $fn=6);
		translate([10,10,-0.1]) cylinder(h=12,r=m4_diameter/2);
		
	}

}

