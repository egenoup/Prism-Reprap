// C. Strang		
// cstrang@????
// funfor.us

t = 3.5;   	// wall thickness
bt = 3.0;		// base thickness

l = 122	;		// case length
w = 78.4	;		// case width
ch = 55	;	// case height

cr = 4	;		// corner rounding

ps = bt-0.1 ; 	// peg start height
sph = 3; 	// short peg height

$fn=40;

//#translate([4.7,3.7,bt+sph]) ramps();

difference()
{
	translate([cr,cr,0]) minkowski()
	{
		cube([l-(cr*2),w-8,ch]);
		cylinder(r=cr,h=.1);
	}
	translate([t,t,bt]) cube([l-(t*2),w-(t*2),ch+1]);
	//translate([t,t,-0.1]) cube([l-(t*2),w-(t*2),ch+1]);
	// arduino usb connector
	translate([l-t-0.1,t+8,0.5+bt+sph]) cube([bt+1,14,12.75]);
	// arduino power connector
	translate([l-t-0.1,t+39.7,0.5+bt+sph]) cube([bt+1,11,12.8]);
	// ramps power connector
	translate([l-t-0.1,t+35.7,14+bt+sph]) cube([bt+1,24.2,12.5]);

	// cable holes
	translate([(l-cr)/4,t+0.1,ch]) rotate([90,0,0]) cylinder(r=8,h=t+0.2); 
	translate([3*(l-cr)/4,t+0.1,ch]) rotate([90,0,0]) cylinder(r=8,h=t+0.2); 
	// cable holes on the other side of the case
	//#translate([(l-cr)/4,t+0.1,ch]) rotate([-90,0,0]) cylinder(r=8,h=t+0.2); 
	//#translate([3*(l-cr)/4,w-cr+0.4,ch]) rotate([-90,0,0]) cylinder(r=8,h=t+0.2); 

	for (x = [0 : 5])
	{
		translate([95+(x*4),9,-0.1]) cube([1.5,15,bt+0.2]);
		translate([95+(x*4),39,-0.1]) cube([1.5,15,bt+0.2]);

		translate([40+(x*8),9,-0.1]) cube([3,45,bt+0.2]);
	}

	translate([-0.1,18,40+bt]) cube([t+0.2,43,2]);
	translate([-0.1,39,40+bt]) cube([t+0.2,2,ch-42]);

}
translate([0,38,40+bt-0.1]) cube([t,4,2.3]);

translate([30,11,ps]) cube([5,5,sph]);
translate([85,11,ps]) cube([5,5,sph]);
translate([30,43,ps]) cube([5,5,sph]);
translate([85,43,ps]) cube([5,5,sph]);
translate([103,30,ps]) cube([5,5,sph]);

translate([23,t+53.8,ps]) anchor();
translate([58,t+53.8,ps]) anchor();
translate([93,t+53.8,ps]) anchor();

translate([16,t+38,ps]) rotate([0,0,90]) anchor();
#translate([18.5,t+3,ps]) rotate([0,0,90]) anchor();

translate([cr,cr,ch-7.9]) anchor2();
translate([cr+.1,w-cr-.1,ch-7.9]) anchor2();
translate([l-cr,cr,ch-7.9]) anchor2();
translate([l-cr,w-cr,ch-7.9]) anchor2();
translate([(l-cr)/2,cr,ch-7.9]) anchor2();
translate([(l-cr)/2,w-cr,ch-7.9]) anchor2();


// #translate([18,10,0]) cylinder(r=cr,h=3.5);



module ramps()
{
	translate([13,0,0]) cube([101.7,53.4,13]);
	translate([13,0,13]) cube([101.7,60.4,13]);
	translate([9,0,26]) cube([36,71,2]);
	translate([0,14,26]) cube([9,43,10]);

// arduino usb, power and ramps power connectors
	translate([114.7,9,1.5]) cube([6.5,12,10.75]);
	translate([114.7,40.5,1.5]) cube([3,9,10.8]);
	translate([114.7,36.5,15]) cube([3,22.2,8.5]);

// pololu heat sinks
	translate([79.5,14.5,24.5]) cube([10,10,18]);

	translate([79.5,37.5,24.5]) cube([10,10,18]);
	translate([59.5,37.5,24.5]) cube([10,10,18]);
	translate([39,37.5,24.5]) cube([10,10,18]);

}

module anchor()
{
	cube([10,1.5,6+0.1]);
	translate([3,-0.35,5]) cube([4,0.5,0.5]);
}

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


