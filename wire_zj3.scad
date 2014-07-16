difference()
{
	union()
	{
		cylinder(r=32.8/2,h=16,$fn=24);
		cylinder(r=40/2,h=2,$fn=32);
		translate([0,0,-10])
			cylinder(r=8.2/2,h=15,$fn=24 );
		translate([0,0,-1])
			cylinder(r=12/2,h=2,$fn=24);
	}
	translate([0,0,4])
		cylinder(r=32.8/2-2,h=20,$fn=24);
}