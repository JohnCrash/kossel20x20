include <configuration.scad>

ramp_width = 60.2 + 2*extra_radius;
arduino_width = 53.5 + 2*extra_radius;

module m3_nut()
{
	difference()
	{
		cylinder(r=m3_nut_radius,h=4,$fn=6);
		translate([-5,m3_radius,3])cube([10,10,1]);
		translate([-5,-10-m3_radius,3])cube([10,10,1]);
	}
}

module ramp_bottom()
{
	difference()
	{
		union()
		{
			difference()
			{
				cube([ramp_width+16,120,18]);
				translate([8,0,2])cube([ramp_width,110,16]);
				//usb
				translate([ramp_width+8-9.5-13-extra_radius,100,4+2-0.5])cube([13,20,13]);
			}
			translate([8,0,2])cube([ramp_width-arduino_width,110,12]);
			//安装耳
			translate([-12,-10,0])cube([ramp_width+16+24,10,18]);
		}
		//安装孔
		for(x=[-6,ramp_width+16+6])
		{
			translate([x,2,11])rotate([90,0,0])cylinder(r=m3_wide_radius,h=20,$fn=12);
			translate([x,1,11])rotate([90,0,0])cylinder(r=m3_nut_radius,h=4,$fn=12);
		}
		for(x=[4,ramp_width+16-4])
			for(y=[11,120-10-15])
			translate([x,y,0])
			{
				cylinder(r=m3_wide_radius,h=20,$fn=12);
				m3_nut();
			}
		translate([38,115,0])
		{
			cylinder(r=m3_wide_radius,h=20,$fn=12);
			m3_nut();
		}
	}
}

module ramp_top()
{
	difference()
	{
		translate([-1,-10,0])cube([9,110+10+10,10]);
		for(y=[15:20:90])
			translate([-1,y,0])cube([10,15,4]);
		translate([-1,-3,0])cube([10,10,4]);
		translate([-1,102,0])cube([10,10,4]);
		for(y=[11,120-10-15])
		{
			translate([4,y,0])cylinder(r=m3_wide_radius,h=50,$fn=12);
			translate([4,y,7])cylinder(r=m3_nut_radius,h=3,$fn=12);
		}
	}
}

module ramp_ya()
{
	difference()
	{
		cube(9,10,10);
		translate([4,5,0])cylinder(r=m3_wide_radius,h=50,$fn=12);
		translate([4,5,7])cylinder(r=m3_nut_radius,h=3,$fn=12);
	}
}

//translate([0,0,18])
ramp_ya();
//ramp_bottom();
//translate([ramp_width+8,0,18])
//ramp_top();
