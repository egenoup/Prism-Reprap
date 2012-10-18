// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>

h = 6;   	// base thickness
fmp = true;	// four mount points
m5_diameter = 5.5;


$fn=30;

translate([0,0,17])rotate([0,90,0]) xidler();
translate([32,40,17])rotate([0,90,0]) mirror([0,1,0]) xidler();




module xidler()
{
	difference()
	{
		hull()
		{
			//translate([0,0,0]) cube([17,40,h]);
			translate([10,14,0]) cylinder(r=10,h=h);
			translate([10,26,0]) cylinder(r=10,h=h);

		}
		translate([10,10,-0.1]) cylinder(r=m4_diameter/2,h=h+0.2);
		translate([10,30,-0.1]) cylinder(r=m4_diameter/2,h=h+0.2);
		translate([17,0,-0.1]) cube([5,50,h+1]);
	}

	translate([-3,12,0]) cube([h,16,20]);
	translate([15,12,0]) cube([h/3,16,20]);


	//#translate([-3,12,19.9]) cube([20,16,0.5]);


	translate([-3,0,0])difference()
	{
		translate([0,12,19.9]) cube([20,16,h]);
		translate([12,20,19.8]) cylinder(r=m5_diameter/2,h=h+0.2);
	}

}