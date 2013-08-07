include <vertex.scad>

module endstop(h,offset=2,outer=1)
{
	difference()
	{
		translate([-7,-15,-h/2])cube([19+3+outer+offset,30,h]);
		extrusion_cutout(2*h,2*extra_radius);
		cube([16,6,h],center=true);
		for(a=[1,-1])
		{
			translate([0,-6*a,0])
				rotate([90*a,0,0])
					cylinder(r=m3_radius,h=10);
			translate([0,-5*a,0])
			rotate([90*a,0,0])
			cylinder(r1=8,r2=m3_radius,h=5);
		}
		translate([13+offset,0,0])cube([3+2*extra_radius,6+2*extra_radius,h],center=true);
#		translate([2+offset,-3,h/2-2])cube([10,6,5]);
	}
}

endstop(h=10);