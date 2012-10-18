// C. Strang		
// cstrang@????
// funfor.us

t = 3.5;   	// wall thickness
bt = 3.0;		// base thickness

l = 140	;		// case length
w = 70	;		// case width
ch = 32.9	;	// case height

wl	= 98	;		// window length
ww = 41	;		// window width
cr = 4	;		// corner rounding

ps = bt-0.1 ; 	// peg start height
sph = 6; 	// short peg height
lph = 10.15;	// long peg heigh
psh = 3;		// peg support height

om = 13.5	;	// move all objects by this amount

$fn=40;


difference()
{
	translate([cr,cr,0]) minkowski()
	{
		cube([l-(cr*2),w-8,ch]);
		cylinder(r=cr,h=.1);
	}
	translate([om,15,-0.1]) cube([wl,ww,t+1]);
	translate([om+wl+9.5,35,-0.1]) cylinder(h=t+1, r=4);
	translate([t,t,bt]) cube([l-(t*2),w-(t*2),ch+1]);

	translate([-0.1,18,14]) cube([5,30,4.5]);

	translate([59,w-t-0.1,ch-.6]) cube([22,t+1,1]);
	translate([84,w-t-0.1,ch-.6]) cube([22,t+1,1]);

}

translate([om,5,ps]) cube([5,5,sph]);
translate([om+wl-4.5,5,ps]) cube([5,5,sph]);
translate([om,15+41+4.5,ps]) cube([5,5,sph]);
translate([om+wl-4.5,15+41+4.5,ps]) cube([5,5,sph]);

translate([om-7.25,5,ps]) cube([5,5,lph]);
translate([om+wl-4.75+22.5,5,ps]) cube([5,5,lph]);
translate([om-7.25,5+43,ps]) cube([5,5,lph]);
translate([om+wl-4.75+22.5,5+43,ps]) cube([5,5,lph]);

translate([om+2.5,7.5,ps+sph-0.1]) cylinder(r=1.4,h=psh);
translate([om+wl-2,7.5,ps+sph-0.1]) cylinder(r=1.4,h=psh);
translate([om+2.5,15+41+7,ps+sph-0.1]) cylinder(r=1.4,h=psh);
translate([om+wl-2,15+41+7,ps+sph-0.1]) cylinder(r=1.4,h=psh);

translate([om-4.75,7.5,ps+lph-0.1]) cylinder(r=1.4,h=psh);
translate([om+wl-2.25+22.5,7.5,ps+lph-0.1]) cylinder(r=1.4,h=psh);
#translate([om-4.75,7.5+43,ps+lph-0.1]) cylinder(r=1.25,h=psh);
translate([om+wl-2.25+22.5,7.5+43,ps+lph-0.1]) cylinder(r=1.4,h=psh);

translate([cr,cr,25]) cylinder(r=cr,h=8);
translate([cr,w-cr,25]) cylinder(r=cr,h=8);
translate([l-cr,cr,25]) cylinder(r=cr,h=8);
translate([l-cr,w-cr,25]) cylinder(r=cr,h=8);



// #translate([18,10,0]) cylinder(r=cr,h=3.5);




