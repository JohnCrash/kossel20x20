include <Write.scad>

extra=0.2;

module ej()
{
	difference()
	{
		color("blue")cube([115,125,2]);
		translate([1.7+1.5,1.5+1.5,0])cylinder(r=1.5,h=10,$fn=12);
		translate([115-2.9-1.5,2.1+1.5,0])cylinder(r=1.5,h=10,$fn=12);
		translate([45.5+1.5,46.5+1.5,0])cylinder(r=1.5,h=10,$fn=12);
	}
	color("red")translate([84,-2,2])cube([12,17,11]);
	color("red")translate([47.5,-9,2])cube([20,18,11]);
	color("red")translate([5.3,5.6,2])cube([40,8,10]);
}

module ej_hold()
{
	translate([1.7+1.5,1.5+1.5,0])cylinder(r=1.5,h=100,$fn=12);
	translate([115-2.9-1.5,2.1+1.5,0])cylinder(r=1.5,h=100,$fn=12);
	translate([45.5+1.5,46.5+1.5,0])cylinder(r=1.5,h=100,$fn=12);
}

module cube3(x,y,z,w,a)
{
	difference()
	{
		cube([x,y,z]);
		rotate([0,0,-a])translate([-w,0,0])cube([w,x+y,z]);
		translate([x,0,0])rotate([0,0,a])cube([w,x+y,z]);
	}
}

//cube3(120,73,20,8,40);

//translate([5/2,20,22])ej();

module e_bottom()
{
	union()
	{
		difference()
		{
			cube([120,73,20]);
			translate([-1,4+5,9])rotate([0,90,0])cylinder(r=4+extra,h=122);
			translate([0,5,0])cube([120,8,9]);
			translate([0,8+10,0])cube([120,70,15]);
			color("red")translate([10,32,10])cube3(100,30,20,10,60);
			scale([1,2,1])translate([93,0,10])writecube("USB",size=[20,20,20],h=10);
			translate([5/2,20,0])ej_hold();
			translate([20,10,0])cube([80,30,10]);
		}
		translate([120-6,73-6,0])cylinder(r=6,h=20);
		translate([6,73-6,0])cylinder(r=6,h=20);
	}
}

module e_2()
{
	cube([5.5,2.8,14]);
}

module e_top()
{
	difference()
	{
		union()
		{
			difference()
			{
				cube([120,31,25]);
				translate([7,5,0])cube([104,26,16]);
				translate([5/2,20,0])ej_hold();
				translate([5/2,8,0])cube([115,30,4]);
				
			}
			translate([84+1.7-6-9,0,0])cube([36+9,12,20]);
		}
		translate([7.8,0,0])cube([40,50,4]);
		translate([84+1.7,0,4])cube([13.5,50,11.5]);
		translate([106,25,10])rotate([90,0,0])cylinder(r=3.6,h=30);
		translate([101.5,8,5.5])cube([9.2,20,11]);
		translate([101.5,12,5.5])cube([9.2,40,16]);
		translate([110,28,4])cube([7,7,8]);
		translate([75,0,5])cube([4,30,10]);
	}
}
//e_bottom();
//translate([0,0,20])e_top();
rotate([0,180,0])e_top();