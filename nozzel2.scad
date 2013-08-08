//cylinder(r=3,h=15);
//cylinder(r=1,h=10);

//双头加热块
module hot_block()
{
	difference()
	{
		translate([0,-2,0])cube([10,30,20],center=true);
		//加热棒安装孔
		translate([0,-7,-10])cylinder(r=3,h=20);
		translate([0,7,-10])cylinder(r=3,h=20);
	
		translate([0,-12,-10])cylinder(r=1.5,h=20,$fn=12);
		//挤出头安装孔
		translate([0,0,-10])cylinder(r=3,h=20);
		//安装螺丝
		translate([0,10,3])rotate([90,0,0])cylinder(r=1.25,h=8,$fn=12);
		translate([0,10,-3])rotate([90,0,0])cylinder(r=1.25,h=8,$fn=12);
		translate([0,-10,2])rotate([90,0,0])cylinder(r=1.25,h=8,$fn=12);
		translate([0,-10,-2])rotate([90,0,0])cylinder(r=1.25,h=8,$fn=12);
		translate([0,-10,-5])rotate([90,0,0])cylinder(r=1.25,h=8,$fn=12);
	}
	
}

//喷嘴
module nozzel()
{
	difference()
	{
		union()
		{
			cylinder(r=3,h=14);
			translate([0,0,-3])cylinder(r1=0.5,r2=3,h=3);
		}
		translate([0,0,5])cylinder(r=2,h=20);
		cylinder(r=3.2/2,h=5);
		translate([0,0,-2])cylinder(r=0.5,h=5);
		translate([0,0,-5])cylinder(r=0.2,h=5);
	}
}
//nozzel_tube();
module nozzel_tube()
{
	import("spring.stl");
	//下部安装位
	difference()
	{
		union()
		{
			translate([0,0,-8+0.1])cylinder(r=3,h=15);
			translate([0,0,-2])cylinder(r=4.2,h=2,$fn=6);
		}
		translate([0,0,-10])cylinder(r=2,h=20);
	}
	//上部安装位
	difference()
	{
		union()
		{
			translate([0,0,35-6])cylinder(r=3,h=6);
			translate([0,0,35])cylinder(r=4,h=12);
		}
		translate([0,0,35-7])cylinder(r=2,h=20);
	}
}

module nozzel_all()
{
	translate([0,-7,-12])nozzel();
	translate([0,7,-12])nozzel();
	hot_block();
	translate([0,0,12])nozzel_tube();
	//加热棒
	//translate([1,-9,-7])cylinder(r=3,h=15);
}

nozzel_all();