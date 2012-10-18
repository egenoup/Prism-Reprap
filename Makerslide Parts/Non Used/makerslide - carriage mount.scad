// Prism   
// Makerslide vertical X-mount prototype
// GNU GPL v2
// Charles Strang
// derived from
// Josef Průša
// josefprusa@me.com


include <configuration.scad>
use <bushing.scad>

$fn=30;

corection = 1.17;
oh  =65; 		//override height
lv = false; 	// luu version
ps = 80;		// mounting plate length (min 70mm)
					// the makerslide profile is fixed at 40mm and the 
					// slots are fixed at 10 and 30mm from one of the edges.
					// there is no reason to make the mounting holes
					// parametric
pt = 6;		// mounting plate thickness
sp = 5;			// space between parts

makerslideycarriage();

module makerslideycarriage()
{
	union()
		{
		translate([12,0,0]) leadscrewmount();
	
		translate([0,-60,0]) msycmount();
		}


}

module msycmount()
{
	
	difference()
	{
		translate([0,0,0]) rotate([0,0,0]) cube([pt,ps,40]);
		translate([-8,17.5,16]) rotate([0,0,180]) cube([pt+2,15,5]);

		// Mounting holes
		#translate([-0.1,68,10]) 
			rotate([0,90,0]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		#translate([-0.1,68,30]) 
			rotate([0,90,0]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		#translate([-0.1,12,10]) 
			rotate([0,90,0]) 
				cylinder(h=pt+2,r=m4_diameter/2);
		#translate([-0.1,12,30]) 
			rotate([0,90,0]) 
				cylinder(h=pt+2,r=m4_diameter/2);
	}

}

module leadscrewmount()
{
	difference()
	{
		union ()
		{
			//Nut Trap
			translate([0,-20,0]) 
			cylinder(h=40,r=m8_nut_diameter/2+thin_wall*corection,$fn=6);
		}

		// Slider cutout. 
		translate([0,10,32.5]) 
		cube([22.5,22.5,70],center=true);

		//Rod hole.
		difference()
		{
			translate([0,-20,39.5]) 
			cylinder(h=90,r=m8_nut_diameter/2,$fn=6,center=true);
			translate([0,-20,8.5]) 
			cylinder(h=4,r=m8_nut_diameter/2+thin_wall,$fn=6,center=true);
		}

		translate([0,-20,52]) 
		cylinder(h=90,r=m8_diameter/2,$fn=9,center=true);
	}
}




