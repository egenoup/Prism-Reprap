// C. Strang		
// cstrang@????
// funfor.us

include <../configuration.scad>;

ml = 85	;		// case length
mw = 25	;		// case width
mth = 4 ;


$fn=40;

translate([0,0,0]) rotate([90,0,0])
{
	difference()
	{
		union()
		{
			translate([0,0,0]) cube([ml,mw,mth]);
			translate([28+28.5,11,0]) cylinder(r=8,h=10);
			translate([28+28.5-8,0,0]) cube([16,11,10]);
	
		}
		translate([28,10,-0.1]) cylinder(r=m4_diameter/2,h=mth+0.2);
		translate([28+28.5,11,-0.1]) cylinder(r1=4.5,r2=4.85,h=12.2);
		translate([28+49.5,10,-0.1]) cylinder(r=m4_diameter/2,h=mth+0.2);
	}

	translate([11,0,-15])
	{
		translate([2,0,0]) rotate([0,-120,0]) difference()
		{
			translate([0,0,0]) cube([40,50,mth]);

			translate([10,40,-0.1]) cylinder(r=m4_diameter/2,h=mth+0.2);
			translate([30,40,-0.1]) cylinder(r=m4_diameter/2,h=mth+0.2);
		}

		translate([-34,0,7]) difference()
		{
			union()
			{
				//translate([9,0,-3]) cube([27.5,mth,25]);
				translate([17,0,-7]) cube([29,25,16]);
			}
			translate([-4,-0.1,15]) rotate([0,60,0]) cube([50,50+0.2,20]);
			translate([36,-0.1,-7]) rotate([0,30,0]) cube([20,50+0.2,30]);
//			translate([17,0,-7]) cube([29,25,16]);

		}
	}
}