include <configuration.scad>

separation = 40;  // Distance between ball joint mounting faces.
offset = 20;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 12.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 8;  // Hole for the hotend (J-Head diameter is 16mm).
push_fit_height = 4;  // Length of brass threaded into printed plastic.
height = 8;
cone_r1 = 2.5;
cone_r2 = 14;

module effector() {
  difference() {
    union() {
      cylinder(r=offset-2, h=height, center=true, $fn=36);
      for (a = [60:120:359]) rotate([0, 0, a]) {
	rotate([0, 0, 30]) translate([offset-2, 0, 0])
	  cube([10, 13, height], center=true);
	for (s = [-1, 1]) scale([s, 1, 1]) {
	  translate([0, offset, 0]) difference() {
	    intersection() {
	      cube([separation, 40, height], center=true);
	      translate([0, -4, 0]) rotate([0, 90, 0])
		cylinder(r=10, h=separation, center=true);
	      translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
		cylinder(r1=cone_r2, r2=cone_r1, h=14, center=true, $fn=24);
	    }
	    rotate([0, 90, 0])
	      cylinder(r=1.0, h=separation+1, center=true, $fn=12);
	    rotate([90, 0, 90])
	      cylinder(r=m3_nut_radius, h=separation-24, center=true, $fn=6);
	  }
        }
      }
    }
    translate([0, 0, -5])
      cylinder(r=9, h=10, $fn=36);
//    translate([0, 0, -6]) # import("m5_internal.stl");
//    for (a = [0:60:359]) rotate([0, 0, a]) {
//      translate([0, mount_radius, 0])
//	cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
//    }
  }
}

module nozzel_tube()
{
	{
		difference()
		{
			union()
			{
				translate([0,0,6])cylinder(r=6,h=5);
				cylinder(r=3,h=7);
			}
			cylinder(r=2,h=20);
			for(a=[0:120:300])
			{
				rotate([0,0,a])
				translate([2,0,10-1.4])rotate([0,90,0])cylinder(r=1.4,h=20,$fn=8);
			}
		}
		color("red")
		translate([0,0,-29])import("spring.stl");
		translate([-10,-8,-29-10])cube([20,20,10]);
		translate([0,0,-42])cylinder(r1=0.5,r2=4,h=5);
	}
}

module nozzel_shelf(h)
{
	difference()
	{
		union()
		{
			for(a=[0:120:300])
			{
				//安装架
				rotate([0,0,a])translate([10,0,35/2])cube([12,6,35],center=true);
				rotate([0,0,a])translate([4,0,35-6/2-0.8])rotate([0,90,0])rotate([0,0,30])cylinder(r=5.2,h=12,$fn=6);
			}
		}
		cylinder(r=9,h=h-12);
		translate([0,0,h-12])cylinder(r1=9,r2=6,h=4);
		translate([0,0,h-8])cylinder(r=6,h=10,$fn=24);
		translate([0,0,30])cylinder(r=3,h=8);
		//安装空
		for(a=[0:120:300])
		{
			rotate([0,0,a])translate([0,0,35-1.5-2])rotate([0,90,0])cylinder(r=1.5,h=30,$fn=12);
			rotate([0,0,a])translate([12,0,35-6/2-0.8])rotate([0,90,0])rotate([0,0,30])cylinder(r=6,h=12,$fn=6);
			rotate([0,0,a])translate([23,0,35-12])rotate([0,-45,0])cube([10,10,20],center=true);
		}
	}
}
nozzel_shelf(h=35);
translate([0,0,25-0.5])
nozzel_tube();
translate([0, 0, height/2])rotate([0,0,-30])effector();
