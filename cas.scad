extra = 0.1;
union()
{
	difference()
	{
		cube(size=[42+12,25,24]);
	#	translate([6,0,0])cube(size=[42+extra,25,10]);
		translate([0,8,14])cube([42+12,20,5+extra]);
	}
}