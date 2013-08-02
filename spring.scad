/*
	方形弹簧,screw_h螺线高,step密度,r螺线外半径,w弹簧线宽度
*/
module spring_step(r=3,w=2,step=10,screw_h=3)
{
	union()
	{
		for(a=[0:360/step:360-360/step])
		{
			hull()
			{
				rotate([0,0,a])translate([r-w,0,screw_h*a/360])cube([w,0.0001,w]);
				rotate([0,0,a+360/step])translate([r-w,0,screw_h*(a+360/step)/360])cube([w,0.0001,w]);
			}
		}
	}
}

module spring(r=6,w=3,step=12,h=35,screw_h=4)
{
	difference()
	{
		translate([0,0,-w])
		union()
		{
			for(n=[0:screw_h:h+screw_h])
			{
				translate([0,0,n])spring_step(r,w,step,screw_h);
			}
		}
		//消减两端
		translate([0,0,-2*w])cylinder(r=r+w,h=2*w);
		translate([0,0,h])cylinder(r=r+w,h=4*w);
	}
}

spring();