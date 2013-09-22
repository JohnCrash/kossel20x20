include <configuration.scad>
width = 40;
Thickness = 25;

usb_port_width = 12.2+2*extra_radius;
usb_port_height = 10.8+2*extra_radius;
usb_port = 13 + 2*extra_radius;
power_port_width = 8.9+2*extra_radius;
power_port_height = 10.9+2*extra_radius;

round_radius = 2;

union()
{
difference()
{
	minkowski()
	{
		translate([round_radius,0,0])cube([width-2*round_radius,Thickness,44]);
		cylinder(r=round_radius,h=1,$fn=12);
	}
	translate([0,-Thickness,0])cube([width,Thickness,50]);
	for(z=[10,44-10])
	{
		translate([width/2+2,-1,z])rotate([-90,0,0])cylinder(r=m3_wide_radius,h=100,$fn=12);
		translate([width/2+2,50+15,z])rotate([90,0,0])cylinder(r=m4_nut_radius,h=50,$fn=12);
	}
	//usb
	translate([6,0,22-usb_port_height/2])cube([usb_port_width,Thickness,usb_port_height]);
	translate([6,-14,22-usb_port_height/2-6])cube([usb_port_width,Thickness,usb_port_height]);
	translate([6-0.5,16+5,22-usb_port/2])cube([usb_port,Thickness,usb_port]);
	//power
	translate([width-power_port_width-6,-5,22-power_port_height/2])cube([power_port_width,Thickness,power_port_height]);
	translate([width-power_port_width/2-6,100,22+1.5])rotate([90,0,0])cylinder(r=6.4/2+2*extra_radius,h=100,$fn=32);
	translate([width-power_port_width-6,-5-6,22-power_port_height/2-6])cube([power_port_width,Thickness,power_port_width+6]);

	//斜角
	translate([0,0,-43])rotate([45,0,0])cube([width,100,20]);
	translate([0,0,100-43])rotate([-45,0,0])cube([width,100,20]);
}
	translate([width-power_port_width-6,20,22-power_port_height/2])cube([power_port_width,0.4,power_port_height]);
}