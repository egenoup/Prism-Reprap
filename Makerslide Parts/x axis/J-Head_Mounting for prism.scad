include <..\configuration.scad>;
$fn=30;

x=46; //Distance between screw holes on Wade's Extruder
y=32; //Width
z=10;  //Thickness
a=17; //Diameter to mount screws
b=11; //Diameter of Clamp Screws
d=12; //Diameter of the screw groove on J-Head
e=16; //Diameter of the J-Head
f=6;  //Diameter of Nut for Nut Trap
g=6;  //Thickness of Nut for Nut Trap
wireholder=true; //If true, It places a wire holder on the clamp, if false,it doesn't
fanmounter=true;	// if true, places a fanmount on the right side of the j-head mount

if (wireholder == true)
{
 translate([0,(y+(y/2))-13,0]) wireholder();
}


difference()
{

	main_body();
	clamp();
}

if (fanmounter == true)
{
	translate([-((46/2)+31.9),-32/2,0]) fanmount(3);
}

translate([30,-32/2,0]) fanguard();

translate([0,y-10,0]) clamp();

translate([62,-40,0]) rotate([0,0,180]) fanshroud();
translate([-40,-70,0]) fanmount(5);

module clamp()
{
	intersection()
	{
		main_body();
		translate([0,y/2+3.5,-1]) cylinder(z+2,y/2+5,y/2+5);	

	}
}

module fanmount(fmh)
{
	difference()
	{
		translate([0,0,0]) cube([32,32,fmh]);
		translate([16,16,-0.1]) cylinder(r=14,h=fmh+1);
		translate([4,4,-0.1]) cylinder(r=m3_diameter/2,h=fmh+1);
		translate([4,28,-0.1]) cylinder(r=m3_diameter/2,h=fmh+1);
		translate([28,4,-0.1]) cylinder(r=m3_diameter/2,h=fmh+1);
		translate([28,28,-0.1]) cylinder(r=m3_diameter/2,h=fmh+1);
	}
}

module fanguard()
{
	difference()
	{
		translate([0,0,0]) cube([32,32,3]);
		translate([16,16,-0.1]) cylinder(r=14,h=4);
		translate([4,4,-0.1]) cylinder(r=m3_diameter/2,h=4);
		translate([4,28,-0.1]) cylinder(r=m3_diameter/2,h=4);
		translate([28,4,-0.1]) cylinder(r=m3_diameter/2,h=4);
		translate([28,28,-0.1]) cylinder(r=m3_diameter/2,h=4);
	}

	// fan guard cross

	translate([0,15,0]) cube([11,1.5,3]);
	translate([20,15,0]) cube([11,1.5,3]);
	translate([15,0,0]) cube([1.5,11,3]);
	translate([15,20,0]) cube([1.5,11,3]);

	// fan guard outer circle
	difference()
	{
		translate([16,16,0]) cylinder(r=11,h=3);
		translate([16,16,-0.5]) cylinder(r=9,h=3+1);

	}

	// fan guard inner circle
	difference()
	{
		translate([16,16,0]) cylinder(r=6,h=3);
		translate([16,16,-0.5]) cylinder(r=4,h=3+1);

	}


}

module main_body()
{
	difference()
	{

		main();


		translate([-b,y/2+1,z/2])rotate([90,0,0]) cylinder(h=y+2+6,r=m3_diameter/2);
		translate([b,y/2+1,z/2])rotate([90,0,0])cylinder(h=y+2+6,r=m3_diameter/2);

		translate([-b,(y/-2),z/2])rotate([90,0,0]) cylinder(h=g+1, r=(m3_nut_diameter+0.2)/2, $fn=6);
		translate([b,(y/-2),z/2])rotate([90,0,0]) cylinder(h=g+1, r=(m3_nut_diameter+0.2)/2, $fn=6);

		translate([-a,0,-0.1]) cylinder(h=y+2+6,r=m3_diameter/2);
		translate([a,0,-0.1]) cylinder(h=y+2+6,r=m3_diameter/2);

		translate([-a,0,-0.1]) cylinder(h=4, r=m3_nut_diameter/2, $fn=6);
		translate([a,0,-0.1]) cylinder(h=4, r=m3_nut_diameter/2, $fn=6);



		translate([0,0,-1]) cylinder(r=d/2, h=z+2);
		translate([0,0,4]) cylinder(r=(e+1)/2, h=z+2);

		translate([-10,-y/2+0.2,15])rotate([90,0,0]) cylinder(h=6.3,r=m5_diameter/2);
		translate([10,-y/2+0.2,15])rotate([90,0,0])cylinder(h=6.3,r=m5_diameter/2);

		translate([-10,-y/2+0.2,24])rotate([90,0,0]) cylinder(h=6.3,r=m5_diameter/2);
		translate([10,-y/2+0.2,24])rotate([90,0,0])cylinder(h=6.3,r=m5_diameter/2);

	}
}

module main()
{
	translate([-x/2,-y/2,0]) cube([x,y,z]);
	translate([-x/2,-y/2-5.9,0]) cube([x,6,30]);
}

module screw_hole(l)
{
	hull()
	{
		translate([l/2,0,0])cylinder(r=m4_diameter/2,h=z+0.2);
		translate([-l/2,0,0])cylinder(r=m4_diameter/2,h=z+0.2);
	}
}


module wireholder()
{
	difference()
	{
		translate([0,6,0]) cylinder(z,7,7);

		translate([0,6,-0.1]) cylinder(z+0.2,5,5);
		translate([6/-2,0,-0.1]) cube([6,100,z+0.2]);
	}
}

module fanshroud()
{
	difference()
	{
		translate([0,0,0]) fanmount(3);
		translate([48.5,16,0]) rotate([0,-90,0]) cylinder(r1=4,r2=8,h=23.2);
	}
	translate([16,16,0])difference()
	{
		union()
		{
			difference()
			{
				sphere(r=14.5);
				sphere(r=12.5);	
				translate([32.5,0,0]) rotate([0,-90,0]) cylinder(r1=6,r2=10,h=23);
			}
			translate([32.5,0,0]) rotate([0,-90,0]) difference()
			{
				cylinder(r1=6,r2=10,h=23);
				translate([0,0,-0.1]) cylinder(r1=4,r2=8,h=23.2);
			}

			translate([9.6,-14.4,0]) difference()
			{
				cube([23,29,1]);
				translate([-0.1,-0.1,-0.1])fs1();
			}

		}

		translate([-18,-14.5,-30])cube([55,30,30]);

	}

}

module fs1()
{
	difference()
	{
		cube([23.2,29.2,3.2]);
		translate([23,14.5,1.5]) rotate([0,-90,0]) cylinder(r1=6,r2=10,h=23);	
	}
}
