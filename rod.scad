use <carriage.scad>

module rod(z=0)
{
	translate([0,-6,0])
	{
		cube([8,12,400]);
		block(z);
	}
}

module block(z)
{
	translate([3,-((27-12)/2),z])
	{
		difference()
		{
			cube([10,27,33]);
	
			for(s=[-1,1],m=[-1,1])
			{
				#translate([-1,27/2+(27/2-3.5)*m,33/2+(33/2-6.5)*s])rotate([0,90,0])cylinder(r=1.5,h=120,$fn=8);
			}
		}
		translate([10,27/2,33/2])rotate([0,0,90])rotate([90,0,0])carriage();
	}
}

rod(10);
