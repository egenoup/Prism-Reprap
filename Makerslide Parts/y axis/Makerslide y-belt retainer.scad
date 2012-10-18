// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;

h = 2.5;   	// base thickness
m5_diameter = 5.4;
m3n = (m3_nut_diameter/2)+0.2 ;
l = 60;
w = 26;

$fn=30;



translate([0,0,0]) beltmount();


translate([0,57,10.9]) rotate([180,0,0]) tieblock1();
translate([15,31,-6.9]) tieblock2();
translate([l-10,57,10.9]) rotate([180,0,0]) tieblock3();

translate([35,31,0]) beltsaver();




/*
#translate([0,0,-1])cube([60,60,1]);
#translate([0,0,2.1]) tieblock1();
translate([0,0,6.2]) tieblock2();
translate([50,0,-1])  tieblock3();

translate([-1,15,0])cube([1,1,4.5]);
translate([-1,6,0])cube([1,1,16]);
translate([60,6,0])cube([1,1,10]);
translate([60,15,0])cube([1,1,3.5]);
*/





module beltmount()
{
	difference()
	{

		cube([l,w,h]);
		translate([(l/2)-10,w/4,-0.1]) rotate([0,0,0]) cylinder(r=m5_diameter/2,h=7);	
		translate([(l/2)+10,w/4,-0.1]) rotate([0,0,0]) cylinder(r=m5_diameter/2,h=7);

		translate([10/2,8.5/2,-0.1]) rotate([0,0,0]) cylinder(r=m3n,h=h+0.2,$fn=6);
		translate([10/2,w-(8.5/2),-0.1]) rotate([0,0,0]) cylinder(r=m3n,h=h+0.2,$fn=6);
		translate([l-(10/2),8.5/2,-0.1]) rotate([0,0,0]) cylinder(r=m3n,h=h+0.2,$fn=6);
		translate([l-(10/2),(w-(8.5/2)),-0.1]) rotate([0,0,0]) cylinder(r=m3n,h=h+0.2,$fn=6);
	}

	translate([0,0,h-0.1]) hcube(9);
	translate([0,(w-8.5),h-0.1]) hcube(9);
	translate([l-10,0,h-0.1]) hcube(6);
	translate([l-10,(w-8.5),h-0.1]) hcube(6);

}



module hcube(hh)
{

	difference()
	{
		cube([10,8.5,hh-h]);
		translate([5,4.25,-0.1]) cylinder(r=m3_diameter/2,h=hh-h+0.2);
		translate([5,4.25,-2.1]) cylinder(r=m3n,h=h+0.2,$fn=6);
	}
	
}


module tieblock1()
{

	difference()
	{
		union()
		{
			translate([0,8.7,2.5]) cube([10,8.6,4.5]);
			difference()
			{
				translate([0,0,6.9]) cube([10,26,4]);
				translate([5,4.25,6.8]) cylinder(r=m3_diameter/2,h=4.2);
				translate([5,w-4.25,6.8]) cylinder(r=m3_diameter/2,h=4.2);

			}
		}
		translate([-0.1,w/2,6.7]) rotate([0,90,0]) cylinder(r=m3_diameter/2,h=10.2);
		translate([7.6,w/2,6.7]) rotate([0,90,0]) cylinder(r=m3n,h=2.5,$fn=6);
	}
}

module tieblock2()
{

	difference()
	{
		translate([0,0,6.9]) cube([10,26,3]);
		translate([5,4.25,6.8]) cylinder(r=m3_diameter/2,h=6.2);
		translate([5,w-4.25,6.8]) cylinder(r=m3_diameter/2,h=6.2);
		translate([-0.1,8.5,8.8]) cube([10.2,9,5]);
	}
}



module tieblock3()
{

	translate([0,8.7,4.5]) cube([10,8.6,2.5]);
	difference()
	{
		translate([0,0,6.9]) cube([10,26,4]);
		translate([5,4.25,6.8]) cylinder(r=m3_diameter/2,h=4.7);
		translate([5,w-4.25,6.8]) cylinder(r=m3_diameter/2,h=4.7);
	}
}

module beltsaver()
{

	translate([0,0,3]) difference()
	{
		rotate([-90,0,0]) cylinder(r=3,h=8);
		translate([-4,-1,-4]) cube([8,10,4]);
	}

	difference()
	{
		translate([-3,0,0]) cube([6,8,3.1]);
		translate([0,4,-0.1]) cylinder(r=m3_diameter/2,h=3);
	}

}


