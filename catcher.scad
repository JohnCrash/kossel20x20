difference()
{
	union()
	{
		cube([20,30,7]);
		translate([10-2.5,0,-2])cube([5,30,2]);
	}
	translate([10,10,0])
	{
		translate([0,0,-3])cylinder(r=3/2,h=20,$fn=12);
		//translate([0,0,3])cylinder(r=6.2/2,h=4,$fn=12);
	}
	translate([-10,27,0])
	rotate([0,0,-30])
	translate([0,0,-3])
	{	
		cube([100,100,7]);
		translate([0,5,0])cube([100,100,10]);
	}
}