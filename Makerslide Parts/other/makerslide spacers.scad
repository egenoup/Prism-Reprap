// Prism   
// Makerslide vertical X-end prototype for
// GNU GPL v2
// Charles Strang


$fn=30;

translate([0,0,0]) makerslidebushing();
translate([15,0,0]) makerslidebushing();
translate([0,15,0]) makerslidebushing();
translate([15,15,0]) makerslidebushing();

module makerslidebushing()
{
	
	difference()
	{
		translate([0,0,0]) cylinder(h=6.8,r=5);
		translate([0,0,-0.1]) cylinder(h=7,r=2.75);
	}


}

