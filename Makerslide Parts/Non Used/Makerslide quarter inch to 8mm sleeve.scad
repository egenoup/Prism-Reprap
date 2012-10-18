// C. Strang		
// cstrang@????
// funfor.us


$fn=30;

translate([0,0,0]) rotate([90,0,90])
	{
	difference()
		{
		translate([0,0.1,0]) rotate([-90,0,0]) cylinder(r=4,h=10.0);
		translate([0,0,0]) rotate([-90,0,0]) cylinder(r=3.2,h=10.2);
		}

}




