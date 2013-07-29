use <frame_motor.scad>
use <frame_top.scad>
use <rod.scad>

module edge20(h)
{
	hull()
	{
		translate([-3,0,0])cube([0.1,6.2,h],center=true);
		translate([0.3,0,0])cube([1.6,11,h],center=true);
	}
	translate([2,0,0])cube([2,6.2,h],center=true);
}

module rod20(h)
{
	translate([0,0,h/2])
	difference()
	{
		cube([20,20,h],center=true);
		cylinder(r=2.5,h=h,$fn=8,center=true);
		for(a=[0:90:360])
			rotate([0,0,a])translate([7.1,0,0])edge20(h);
	}
}
	
module delta1()
{
	translate([0,2.5,0])
	{
		translate([0,0,22])frame_motor();
		translate([0,0,640-10])frame_top();
		translate([0,-2.5,0])rod20(h=640);
		translate([0,7,215])rotate([0,0,90])rod(300);
	}
}

module kossel()
{
	for(a=[0:120:240])
	rotate([0,0,a])translate([0,-162,0])delta1();
	
	for(z=[0,20,620])
	
	translate([0,0,z])rotate([0,0,90])
	for(a=[0:120:240])
		rotate([0,0,a])translate([99,120,10])rotate([90,0,0])rod20(240);
}

kossel();
//delta1();