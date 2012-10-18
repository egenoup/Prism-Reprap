// C. Strang		
// cstrang@????
// funfor.us

include <..\configuration.scad>;

h = 4;   				// thickness
sh = 5;					// silpad/heatbed/glass sandwitch thickness
l = 20;					// length (x)
w = 15;					// width (y)
hw	=2;					// hull width for hole
p = 4;					// lip to hold sandwitch
o = 0.1;				//  overlap amount
to = o*2 ; 			//  twice overlap

rows=2;
columns=2;
$fn=30;

for (x =[0:(rows-1)])
{
	for(y = [0:(columns-1)])
	{
		translate([x*(l+6),y*(w+6),0]) heatbedhold();
	}
}


module heatbedhold()
{
	difference()
	{
		cube([l,w,h+sh]);
		translate([-o,-o,h]) cube([l+to,p,sh+to]);
		
		hull()
		{	
			translate([l/2,p+((w-p)/2)-hw,-0.1]) cylinder(r=m3_diameter/2,h=h+sh+to);
			translate([l/2,p+((w-p)/2)+hw,-0.1]) cylinder(r=m3_diameter/2,h=h+sh+to);
	
		}
	}
}
