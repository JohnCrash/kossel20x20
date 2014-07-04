include <configuration.scad>

intersection()
{
	difference()
	{
		union()
		{
			difference()
			{
				union()
				{
					cylinder(r=20,h=8);
					translate([0,0,30-8])cylinder(r=15,h=8);
					for(a=[0:120:300])
						rotate([0,0,a])
							translate([10,0,19])cube([20,10,22],center=true);
				}
				translate([0,0,8])
				difference()
				{
					cylinder(r=25,h=22);
					cylinder(r1=20,r2=15,h=22);
				}
			}
		//#	translate([12,0,10+8])cube([16,24,24],center=true);
		}
		cylinder(r=8,h=15);
		cylinder(r=5,h=25);
		cylinder(r=3,h=35);
		for(a=[0:120:300])
			rotate([0,0,a+60])
				translate([12,0,8])rotate([0,0,30])cylinder(r=m4_nut_radius,h=14,$fn=16);
	//	for(a=[0:120:300])
	//		rotate([0,0,a+60])
	//			translate([15,0,8])rotate([0,0,30])cylinder(r=m4_nut_radius,h=14,$fn=6);
		for(a=[0:120:300])
			rotate([0,0,a+60])
				translate([15,0,0])cylinder(r=m3_radius,h=12,$fn=12);	
	//#	translate([16,4,0])cylinder(r=1,h=10,$fn=12);
	}
	cylinder(r=20,h=30);
}
