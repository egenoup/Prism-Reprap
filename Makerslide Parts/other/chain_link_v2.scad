max_angle = 50;  // maximum allowed bending-angle
tolerance = 0.2; // for better fit

module outline(width, length, height, radius, l1, angle)
{
	y_ofs = l1 / 2;
	t     = radius / 2;

	difference() {
		union() {
			translate([0, 0, height/2])    cube([width,l1,height], true);
			translate([0, -y_ofs, radius]) rotate([0, 90, 0]) cylinder(width, r = radius, center = true, $fs=0.5);
			translate([0,  y_ofs, radius]) rotate([0, 90, 0]) cylinder(width, r = radius, center = true, $fs=0.5);
			translate([0, -y_ofs, radius]) rotate([angle,     0, 0]) translate([0, -t, -t]) cube([width,radius,radius], true);
			translate([0,  y_ofs, radius]) rotate([360-angle, 0, 0]) translate([0,  t, -t]) cube([width,radius,radius], true);
		}
		translate([0, 0, -(t/2)]) cube([width,length,t], true);
	}
}

module axis(x_ofs, y_ofs, z_ofs, length, radius)
{
	rad = (radius * 0.25);
	translate([x_ofs,y_ofs,z_ofs]) rotate([0, 90, 0]) cylinder(length+tolerance, r1 = rad*1.25, r2 = rad, center = true, $fs=0.25);
}

module axis_hole(x_ofs, y_ofs, z_ofs, length, radius)
{
	rad = (radius * 0.25) * 1.25;
	translate([x_ofs,y_ofs,z_ofs]) rotate([0, 90, 0]) cylinder(length+tolerance, r1 = rad+tolerance, r2 = rad, center = true, $fs=0.25);
}

module outcut0(width, radius, h1, thick, angle, inner_axis)
{
	w = (width - thick)/2;
	t = thick + tolerance/2;

	translate([w, 0, 0]) union() {
		difference() {
			union() {
				translate([0,0,h1/2]) cube([t,radius*2, h1], true);
				translate([0,0,h1]) rotate([angle, 0, 0]) translate([0,radius/2,0]) cube([t,radius,radius*2], true);
				translate([0,0,h1]) rotate([0, 90, 0]) cylinder(t, r = radius, center = true, $fs=0.5);
				if (inner_axis) {
					axis_hole(-(1.5*w), tolerance/2, h1,w,radius);
				}
			}
			if (!inner_axis) {
				axis(-(tolerance)/2, tolerance/2, h1,thick,radius);
			}
		}
	}
}
module outcut(width, radius, l1, h1, thick, angle, inner_axis)
{
	translate([0,l1/2,0]) union() {
		outcut0(width, radius, h1, thick, angle, inner_axis);
		mirror([1,0,0]) outcut0(width, radius, h1, thick, angle, inner_axis);
	}
}

module incut(width, radius, l1, h1, thick, angle, inner_axis)
{
	width2 = width - 2*(thick-tolerance);

	translate([0,-(l1/2),h1]) difference() {
		union() {
			translate([0,0,-(h1/2)]) cube([width2,radius*2,h1], true);
			translate([0,0,0]) rotate([180-angle,0,0]) translate([0,radius/2,0]) cube([width2, radius, radius*2], true);
			translate([0,0,0]) rotate([0, 90, 0]) cylinder(width2, r = radius, center = true, $fs=0.5);
			if (!inner_axis) {
				axis_hole((width-thick)/2+tolerance, -(tolerance/2), 0,thick,radius);
				mirror([1,0,0]) axis_hole((width-thick)/2+tolerance, -(tolerance/2), 0,thick,radius);
			}
		}
		if (inner_axis) {
			axis(-((width2-thick)/2), -(tolerance/2), 0,thick,radius);
			mirror([1,0,0]) axis(-((width2-thick)/2), -(tolerance/2), 0,thick,radius);
		}
	}
}

module middle_0(length, radius, thick, closed)
{
	if (closed) {
		cube([radius*2,length,radius*2], true);
	} else {
		rotate([90, 90, 0]) cylinder(length, r = radius, center = true, $fn=50);
		translate([0,0,thick]) rotate([90, 90, 0]) cylinder(length, r = radius, center = true, $fn=50);
		translate([0,0,thick/2]) cube([2*radius,length,thick], true);
	}
}
module middle(width, radius, length, height, l1, h1, thick, over, under, inner_axis, closed)
{
	l = length;
	th = max(thick,thick * height/width);
	h = height - (closed ?2 :1)*th;
	w = width - 4*thick;
	r = h / 2;
	scale(v=[w/h,1,1]) translate(v = [0,0,r+th]) union() {
		translate([0,h1,0]) middle_0(l, r, th, closed);
		translate([0,(l1/2)+0.1,0]) {
			difference() {
				rotate([over,0,0]) union() {
					translate([0, l/4, 0]) middle_0(l/2, r, th, closed);
					translate([0, l/4,-r]) cube([2*r,l/2,2*r], true);
				}
				translate([0, l/4,-r]) cube([2*r,l/2,2*r], true);
			}
			difference() {
				rotate([-under,0,0]) union() {
					translate([0, l/4, 0]) middle_0(l/2, r, th, closed);
					translate([0, l/4,r]) cube([2*r,l/2,2*r], true);
				}
				translate([0, l/4,r]) cube([2*r,l/2,2*r], true);
			}
		}
	}
}

module hole(width, height, closed)
{
	if (!closed) {
		translate([0,0,height-1.5]) rotate([0, 90, 0]) cylinder(width+1, r = 1.05, center = true, $fs=0.25);
	}
}

module chain_link(width, length, height, under_angle, over_angle, inner_axis, closed)
{
	thick = min(2,max(1, 0.1*width));
	radius = height / 2;
	len    = max(length, 2*(height+thick));
	l1     = len - (2 * radius);
	h1     = radius;
	under  = min(max_angle, under_angle);
	over   = min(max_angle, over_angle);

	difference() {
		outline(width, len, height, radius, l1, under);
		outcut(width, radius, l1, h1, thick, over,  inner_axis);
		middle(width, radius, len, height, l1, h1, thick, over, under, inner_axis, closed);
		incut(width, radius, l1, h1, thick, over, inner_axis);
		hole(width, height, closed);
	}
}

// show three chain-links connected at maximum bending angles
module debug(width, length, height, under_angle, over_angle, inner_axis, closed)
{
	thick = min(2,max(1, 0.1*width));
	radius = height / 2;
	len    = max(length, 2*(height+thick));
	l1     = len - (2 * radius);
	y_ofs  = (l1 / 2) + 0.1;
	z_ofs  = radius;

	chain_link(width, length, height, under_angle, over_angle, inner_axis, closed);
	translate(v = [0, -y_ofs,z_ofs]) rotate(a = [min(max_angle, under_angle),0,0]) translate(v = [0,-y_ofs,-z_ofs]) chain_link(width, length, height, under_angle, over_angle, inner_axis, closed);
	translate(v = [0, y_ofs,z_ofs]) rotate(a = [min(max_angle, over_angle),0,0]) translate(v = [0,y_ofs,-z_ofs]) chain_link(width, length, height, under_angle, over_angle, inner_axis, closed);
}
//debug(15, 18, 10, 30, 30, true, false);

chain_link(width= 35, length=20, height=10, under_angle=0, over_angle=45, inner_axis=true, closed=false);

// width, lenght, height are obvious...
// under_angle - max. angle allowed to bend downwards
// over_angle  - max. angle allowed to bend upwards
// inner_axis  - boolean: true - connectors go from outside to inside; false - vise versa
// closed  - boolean: true - top is closed, no holes; false - top is open, hole on both sides (for toothpick piece)
