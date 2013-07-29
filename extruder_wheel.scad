//默认使用外径17的轴承
module extruder_wheel(r=16/2)
{
	//轴承
	translate([-r-17/2-1.75/2,0,3])
	difference()
	{
		cylinder(r=17/2,h=6,center=true);
		cylinder(r=3,h=6,center=true);
	}
	
	//挤出齿
	difference()
	{
		cylinder(r=r,h=18,center=true);
		cylinder(r=4,h=18,center=true);
		#translate([0,0,3])difference()
		{
			cylinder(r=r,h=2,center=true);
			cylinder(r=r-0.6,h=2,center=true);
		}
	}
	
	//丝线
	#translate([-r,30,3])
	rotate([90,0,0])
	cylinder(r=1.75/2,h=60,$fn=8);
}

extruder_wheel(8);