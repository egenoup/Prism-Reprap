// C. Strang		
// cstrang@????
// funfor.us

t = 3.5;   	// wall thickness
bt = 3.0;		// base thickness

l = 140	;		// case length
w = 70	;		// case width
ch = 2.9	;	// case height

wl	= 98	;		// window length
ww = 41	;		// window width
cr = 4.2	;		// corner rounding



$fn=40;
difference()
{
	translate([cr,cr,0]) minkowski()
	{
		cube([l-(cr*2),w-8,ch]);
		cylinder(r=cr,h=.1);
	}

	translate([0,0,2]) caseoutline();

	translate([cr,cr,-0.1]) cylinder(r=1,h=3);
	translate([cr,w-cr,-0.1]) cylinder(r=1,h=3);
	translate([l-cr,cr,-0.1]) cylinder(r=1,h=3);
	translate([l-cr,w-cr,-0.1]) cylinder(r=1,h=3);
}

#translate([117,31,2.9]) cube([8,8,17.1]);
#translate([39,18,2.9]) cube([4,35,17.1]);


module caseoutline()
{
	difference()
	{
		translate([cr,cr,0]) minkowski()
		{
			cube([l-(cr*2),w-8,2.9]);
			cylinder(r=cr,h=.1);
		}
		translate([t,t,-0.1]) cube([l-(t*2)-.3,w-(t*2)-.3,3.5]);

	}

	translate([cr,cr,0]) cylinder(r=cr,h=3);
	translate([cr,w-cr,0]) cylinder(r=cr,h=3);
	translate([l-cr,cr,0]) cylinder(r=cr,h=3);
	translate([l-cr,w-cr,0]) cylinder(r=cr,h=3);

}


