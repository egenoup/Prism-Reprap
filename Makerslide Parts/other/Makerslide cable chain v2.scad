// C. Strang		
// cstrang@????
// funfor.us

include <../configuration.scad>;


$fn=40;

//translate([0,0,0]) rotate([0,0,0]) scale([.90,.90,.90]) import("top_carrier.stl");
//translate([20,0,0]) rotate([0,0,0])  scale([.90,.90,.90]) import("bottom_carrier.stl");


translate([75.2,0,0]) rotate([90,0,180]) ccend(1);
translate([55.2,0,0]) rotate([90,0,180]) ccend(0);

ccxaxisupper();
translate([20,20,0]) ccxaxislower();

module ccxaxisupper()
{
	difference()
	{
		union()
		{
			cube([30,17,6]);
			translate([0,0,0]) cube([15.2,50,6]);
			translate([0,40.8,-2]) ccend();
		}
		translate([20,10,-0.1]) cylinder(r=m4_diameter/2,h=6.2);
		translate([-2,39,-3]) cube([19,15,3]);
	}
}

module ccxaxislower()
{
	difference()
	{
		union()
		{
			translate([0,10,0]) cube([25,6,11]);
			translate([24.9,10,0]) cube([6,20,20]);
			translate([15.20,0,0]) rotate([90,0,180]) ccend();
		}
		translate([24.8,20,10]) rotate([0,90,0]) cylinder(r=m4_diameter/2,h=6.2);
		translate([-2,16,-0.1]) cube([20,15,11]);
	}
}


module ccend(t)
{
	if (t == 1)
	{
		translate([0,0,6.72]) cube([15.2,1.35,4.68]);
	}	
	else
	{
		translate([0,7.85,6.72]) cube([15.2,1.35,4.68]);
	}


	translate([0,0,0])ccendp1();

	translate([15.18,0,0])mirror([1,0,0])ccendp1();

	difference()
	{
					translate([-.93,4.57,2.9]) sphere(r=3.5);
					translate([-9,0,-2]) cube([10,10,10]);
	}

	translate([15.2,0,0])mirror([1,0,0])difference()
	{
					translate([-.93,4.57,2.9]) sphere(r=3.5);
					translate([-9,0,-2]) cube([10,10,10]);
	}

}

module ccendp1()
{
	difference()
		{
		union()
			{
				cube([1.6,9.2,11.4]);
				hull()
				{
					translate([1.87,4.6,14.3]) rotate([0,90,0]) cylinder(r=4.6,h=.82);
					translate([1.87,4.6,11.5]) rotate([0,90,0]) cylinder(r=4.6,h=.82);
				}
				translate([0.5,0,4.95]) cube([2,9.20,6.45]);
				translate([1.87,0,4.95]) cube([.82,9.20,6.45]);
				difference()
				{
					translate([.3,4.57,14.3]) sphere(r=3.5);
					translate([-2.95,0,10.4]) cube([4.82,9.18,13]);

				}
			}
			translate([-3.95,0,11.4]) cube([5.82,9.18,13]);
			translate([1.59,4.59,2.92]) rotate([0,90,0]) cylinder(r=5,h=2.82);
			difference()
			{
				translate([-0.75,4.57,14.3]) sphere(r=3.5);
				translate([-2.95,0,10.4]) cube([4.82,9.18,13]);

			}

			translate([1.59,0,3.72]) cube([2,6,3]);
			translate([-0.20,0,0]) ccendp2();

		}
}

module ccendp2()
{
difference()
			{
				translate([0,9.18,4.7]) rotate([-135,0,0]) cube([2,8,4]);
				translate([-0.1,4.55,2.98])rotate([0,90,0])cylinder(r=3,h=3);
				translate([-0.1,8.18,6.65]) rotate([-135,0,0]) cube([2.5,5,3]);

			}
}