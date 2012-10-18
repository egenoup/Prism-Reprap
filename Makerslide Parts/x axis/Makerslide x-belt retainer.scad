// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;

h = 3.5;   	// base thickness

m3n = (m3_nut_diameter/2)+0.2 ;
l = 80;
w = 25;

$fn=30;



translate([0,0,0]) beltmount();

//translate([l-15.2,60,10.9]) rotate([180,0,0]) tieblock3();



module beltmount()
{
	difference()
	{
		union()
		{
			cube([l,w,h]);
			translate([(l/2)-17,-47,0]) cube([34,47,h]);

			translate([(l/2)-10,0,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);	
			translate([(l/2)+10,0,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);

			translate([(l/2)-10,-20,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);	
			translate([(l/2)+10,-20,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);

			translate([(l/2)-10,-40,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);	
			translate([(l/2)+10,-40,0]) rotate([0,0,0]) cylinder(r=(m5_diameter+6.5)/2,h=8);


		}
		translate([7.5,12,-0.1]) rotate([0,0,0]) cylinder(r=2.75,h=7);	
		translate([72.5,12,-0.1]) rotate([0,0,0]) cylinder(r=2.75,h=7);

		translate([(l/2)-10,0,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);	
		translate([(l/2)+10,0,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);
		translate([(l/2)-10,0,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);	
		translate([(l/2)+10,0,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);

		translate([(l/2)-10,-20,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);	
		translate([(l/2)+10,-20,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);
		translate([(l/2)-10,-20,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);	
		translate([(l/2)+10,-20,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);

		translate([(l/2)-10,-40,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);	
		translate([(l/2)+10,-40,-0.1]) rotate([0,0,0]) cylinder(r=(m5_diameter)/2,h=8.2);
		translate([(l/2)-10,-40,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);	
		translate([(l/2)+10,-40,3]) rotate([0,0,0]) cylinder(r=(m5_nut_diameter)/2,h=8.2,$fn=6);
	}

	difference()
	{

	}



	translate([7.5,12,0]) makerslidebushing();
	translate([72.5,12,0]) makerslidebushing();

	difference()
	{
		translate([((l-10)/2)-0.1,0,0]) cube([10,29+w,14]);
		translate([((l-10)/2)-0.2,0,h]) rotate([23,0,0]) cube([10.2,70,13]);
		translate([((l-10)/2)-0.1+5,32.25,-0.1]) cylinder(r=m3_diameter/2,h=14+0.2);
		translate([((l-10)/2)-0.1+5,32.25,-0.1]) cylinder(r=m3n,h=h+2.2,$fn=6);
		translate([((l-10)/2)-0.1+5,49.75,-0.1]) cylinder(r=m3_diameter/2,h=14.2);
		translate([((l-10)/2)-0.1+5,49.75,-0.1]) cylinder(r=m3n,h=h+2.2,$fn=6);

	}


	translate([((l-10)/2)-0.1,28,13.9]) hcube(3.5);
	translate([((l-10)/2)-0.1,45.5,13.9]) hcube(3.5);

}


module makerslidebushing()
{
	
	difference()
	{
		translate([0,0,0]) cylinder(h=6.8,r=5);
		translate([0,0,-0.1]) cylinder(h=7,r=2.75);
	}


}


module hcube(hh)
{

	difference()
	{
		cube([10,8.5,hh]);
		translate([5,4.25,-0.1]) cylinder(r=m3_diameter/2,h=hh+0.2);
		
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


