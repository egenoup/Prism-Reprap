include <..\configuration.scad>;
$fn=30;

x=46; //Length
y=45; //Width
z=8;  //Thickness
d=9.9; //Diameter of dial indicator shaft
dd=57;
ddd = 30; // depth between back of dial indicator and di mount tab

dial_mount();


module dial_mount()
{
	difference()
	{

		dial_mount_main();


		translate([x/2,ddd+10.9,-1]) cylinder(r=d/2, h=z+2);
		translate([x/2,ddd+3.5,z+(dd/2)-0.1]) rotate([-90,0,0]) cylinder(r=(dd)/2,h=15.2);
		translate([(x-(dd-1)),ddd+3.5,z+5.5]) cube([dd+9,15.2,dd]);

	

		translate([(x-20)/2,-0.1,13])rotate([-90,0,0]) cylinder(h=6.3,r=m5_diameter/2);
		translate([((x-20)/2)+20,-0.1,13])rotate([-90,0,0])cylinder(h=6.3,r=m5_diameter/2);

		translate([(x-20)/2,-0.1,22])rotate([-90,0,0]) cylinder(h=6.3,r=m5_diameter/2);
		translate([((x-20)/2)+20,-0.1,22])rotate([-90,0,0])cylinder(h=6.3,r=m5_diameter/2);

		translate([(x/2),y,z/2]) rotate([-90,0,0]) cylinder(h=7,r=m3_diameter/2);		
		translate([(x/2),y-3,z/2]) rotate([-90,0,0]) cylinder(h=7,r=m3_nut_diameter/2,$fn=6);


	}
}

module dial_mount_main()
{
	translate([0,0+5.9,0]) cube([x,y,z]);
	translate([0,0,0]) cube([x,6,30]);
	translate([0,ddd+3.6,0]) cube([x,15,30]);
	
	translate([x/2,ddd+3.6,z+(dd/2)-0.1]) rotate([-90,0,0])cylinder(r=(dd+8)/2,h=15);
}


