// C. Strang		
// cstrang@????
// funfor.us

include <../configuration.scad>;

t = 3.5;   	// wall thickness
bt = 3.0;		// base thickness

l = 122	;		// case length
w = 78.4	;		// case width
ch = 10	;	// case height

cr = 4	;		// corner rounding
fn = 60 ;	 	// fan box size
fh = 57 ;		// fan hole size
fs = 50 ;		// fan screw distance


$fn=40;

translate([0,0,13]) mirror([0,0,1]) difference()
{
	translate([cr,cr,9]) minkowski()
	{
		cube([l-(cr*2),w-8,4]);
		cylinder(r=cr,h=.1);
	}
	union()
	{
		difference()
		{
			translate([cr,cr,0]) minkowski()
			{
				cube([l-(cr*2),w-8,ch]);
				cylinder(r=cr,h=.1);
			}
			translate([t,t,bt]) cube([l-(t*2),w-(t*2),ch+1]);
		}

		translate([cr,cr,ch-7.9]) anchor2();
		translate([cr+.1,w-cr-.1,ch-7.9]) anchor2();
		translate([l-cr,cr,ch-7.9]) anchor2();
		translate([l-cr,w-cr,ch-7.9]) anchor2();
		translate([(l-cr)/2,cr,ch-7.9]) anchor2();
		translate([(l-cr)/2,w-cr,ch-7.9]) anchor2();
	}
	translate([cr,cr,8.9]) cylinder(r=0.7,h=5);
	translate([cr+.1,w-cr-.1,8.9]) cylinder(r=0.7,h=5);
	translate([l-cr,cr,8.9]) cylinder(r=0.7,h=5);
	translate([l-cr,w-cr,8.9]) cylinder(r=0.7,h=5);
	translate([(l-cr)/2,cr,8.9]) cylinder(r=0.7,h=5);
	translate([(l-cr)/2,w-cr,8.9]) cylinder(r=0.7,h=5);

	translate([(l-fn)/2,(w-fn)/2,ch-1.2]) cube([fn-0.1,fn-0.1,5.2]);
}
translate([(l-fn)/2,(w-fn)/2,-0.1]) fan();

module anchor2()
{
	difference()
	{
		union()
		{
			translate([0,0,4])cylinder(r=cr,h=4);
			translate([0,0,0.1]) cylinder(r2=cr, r1=0,h=4);
		}
		translate([0,0,-0.1]) cylinder(r=0.7,h=8.2);
	}
}

module fan()
{
	difference()
	{
		cube([fn,fn,4.1]);
		translate([fn/2,fn/2,-0.1]) cylinder(r=fh/2,4.3);

		// mounting holes
		translate([(fn-fs)/2,(fn-fs)/2,-0.1]) cylinder(r=4.5/2,4.3);
		translate([fs+((fn-fs)/2),(fn-fs)/2,-0.1]) cylinder(r=4.5/2,4.3);		
		translate([(fn-fs)/2,fs+((fn-fs)/2),-0.1]) cylinder(r=4.5/2,4.3);
		translate([fs+((fn-fs)/2),fs+((fn-fs)/2),-0.1]) cylinder(r=4.5/2,4.3);
	}

	difference()
	{
		translate([fn/2,fn/2,0]) cylinder(r=(fh/2)-4,4.1);
		translate([fn/2,fn/2,-0.1]) cylinder(r=(fh/2)-6,4.3);
	
	}
	difference()
	{
		translate([fn/2,fn/2,0]) cylinder(r=(fh/2)-10,4.1);
		translate([fn/2,fn/2,-0.1]) cylinder(r=(fh/2)-12,4.3);
	
	}

	difference()
	{
		union()
		{
			translate([fn/2,fn/2,0]) cylinder(r=(fh/2)-16,4.1);
			translate([(fn/2-1),0,0]) cube([2,fn,4.1]);
			translate([0,(fn/2-1),0]) cube([fn,2,4.1]);

		}
		translate([fn/2,fn/2,-0.1]) cylinder(r=(fh/2)-18,4.3);
	
	}


}


