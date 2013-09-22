include <configuration.scad>

separation = 40;  // Distance between ball joint mounting faces.
offset = 20+1;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 13.5;//12.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 4;//8;  // Hole for the hotend (J-Head diameter is 16mm).
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
    for (a = [0:60:359]) rotate([0, 0, a]) {
      translate([0, mount_radius, 0])
	cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
    }
  }
}

effector();

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
			translate([0, 0, height/2])rotate([0,0,-30])effector();
			translate([0,0,28+4])cylinder(r1=5,r2=10,h=8);
			for(a=[0:120:300])
			{
				//安装架
				rotate([0,0,a])translate([9,0,40/2])cube([14,8,40],center=true);
			}
		}
		cylinder(r=9,h=h-8);
		translate([0,0,h-8])cylinder(r1=9,r2=2.5,h=7);
		translate([0,0,h-8+4])cylinder(r=2.5,h=20,$fn=24);
		translate([0,0,32])cylinder(r=(3+extra_radius)/cos(30),h=4,$fn=6);
		translate([0,0,32.5])rotate([0,0,30])cylinder(r=3.,h=4,$fn=6);
		translate([0,0,23])difference()
		{
			cylinder(r=20,h=20);
			cylinder(r1=20,r2=6,h=20);
		}
	}
}
//nozzel_shelf(h=35);
//translate([0,0,25])nozzel_tube();
