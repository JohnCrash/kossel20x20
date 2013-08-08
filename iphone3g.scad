include <Write.scad>

extra_radius = 0.3;
iphone_width = 62.1;
iphone_height = 115.5;
iphone_deep = 12.3;
border = 2;
R6 = 6;
X6 = R6*cos(30)*2+border;
Y6 = (R6*cos(30)*2+border)*cos(30);

module iphone3g_body()
{
	//%cube([iphone_width,iphone_height,iphone_deep]);
	intersection()
	{
		translate([62.1,0,0])rotate([0,-90,0])linear_extrude(height=62.1)
			scale([15.2,15.2,1])import("1.dxf");
		translate([0,115.5,0])rotate([90,0,0])linear_extrude(height=115.5)
			scale([15.2,15.2,1])import("2.dxf");
		linear_extrude(height=12.3)
			scale([15.2,15.2,1])import("3.dxf");
	}
}

module iphone3g_case()
{
	scale([(iphone_width+2*extra_radius+1)/iphone_width,
			(iphone_height+2*extra_radius+1)/iphone_height,
			(iphone_deep+2*extra_radius+0.5)/iphone_deep])
	difference()
	{
		union()
		{
			difference()
			{
				linear_extrude(height=12.3+border+1)
					scale([(iphone_width+2*border)/iphone_width,(iphone_height+2*border)/iphone_height,1])
						scale([15.2,15.2,1])import("3.dxf");
			
				translate([border+0.6,border+0.6,iphone_deep])
				linear_extrude(height=5)
						scale([14.9,14.9,1])import("3.dxf");
				translate([border,border,border])iphone3g_body();
				translate([11,-5,border+4])cube([iphone_width*0.7,20,20]);
				translate([11,iphone_height-10,border+4])cube([iphone_width*0.7,20,20]);
				//摄像头
				translate([border+iphone_width-10.75,border+iphone_height-10.2,0])cylinder(r=4,h=10);
				//音量调节
				translate([border-10,border+iphone_height-10.7-36,border+2])cube([20,36,8]);
				//头部外矩形
				/*
				translate([13,30,0])
				minkowski(){
					cube([40,65,1]);
					cylinder(r=3,h=1);
				}*/
				for( x=[X6/2+1.6:X6:80] )
					for( y=[0:Y6:130] )
						translate([x-(y/Y6)%2*X6/2,y,0])
							rotate([0,0,30])
								cylinder(r=R6,h=5,$fn=6);
				//文字
			//	translate([0,0,0])scale([1,1,3])
			//	writecube("Da Bing",where=[30,20,0],size=[0,0,0],h=10,face="bottom",rotate=-180,font="knewave.dxf");
			}
			//头的轮廓
			linear_extrude(height=border)
				translate([border+iphone_width-13,border+iphone_height-85.2,0])scale([60,60,1])mirror([-1,0,0])import("5.dxf");
			//摄像头圈全
			translate([border+iphone_width-10.75,border+iphone_height-10.2,0])
			difference()
			{
				cylinder(r=6,h=border);
				cylinder(r=4,h=border);
			}
			//桥
			#translate([0.5,91-4.6,4])
			cube([border,border,10]);
		}
		//眼睛
		linear_extrude(height=2*border)
			translate([border+iphone_width-19.44,border+iphone_height-83.8,5])scale([60,60,10])mirror([-1,0,0])import("4.dxf");
	}
}

//测试
module slice(h=0)
{
	projection(cut=true)
	rotate([90,0,0])
	translate([-iphone_width/2-border,-iphone_height/2-border,-h])
	{
		iphone3g_case();
		#translate([border,border,border])iphone3g_body();
	}
}

iphone3g_case();
