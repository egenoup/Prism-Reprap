include <../configuration.scad>;
$fn=30;






module gregs_to_bowden(w,h1,h2,sd,tr)
{

dia = w;
extrawidth = 5;

height = 5;
extraheight = 10-height;
width = 20;
m8hole = 9.2;
m4hole = sd;
$fn=40;

PI=3.141592;


	difference(){
		union(){
			translate([0,0,0]) cube([dia, width,height]);
			translate([(dia/2)+(h1-h2)/2,(width/2)+tr,0]) cylinder(h=height+extraheight, r=m8hole/2+3.5);		
		}
		translate([dia/2+(h1-h2)/2,(width/2)+tr,-0.2]) cylinder(h=20, r=(m8hole/2)+0.3);

		translate([((dia/2)-h1)+(h1-h2)/2,width/2,-0.2]) cylinder(h=height+1,r=m4hole/2);
		translate([((dia/2)+h2)+(h1-h2)/2,width/2,-0.2]) cylinder(h=height+1,r=m4hole/2);

	}

}

gregs_to_bowden(60,29,21,m4_diameter,1); // to extruder


translate([0,30,0]) gregs_to_bowden(46,17,17,m3_diameter,0); // to hotend



