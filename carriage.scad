include <configuration.scad>;

separation = 40;
thickness = 6;

horn_thickness = 13;
horn_x = 8;

belt_width = 5;
belt_x = 5.6;
belt_z = 7;

module carriage() {
  // Timing belt (up and down).
  translate([-belt_x, 0, belt_z + belt_width/2]) %
    cube([1.7, 100, belt_width], center=true);
  translate([belt_x, 0, belt_z + belt_width/2]) %
    cube([1.7, 100, belt_width], center=true);
  difference() {
    union() {
      // Main body.
      translate([0, 4, thickness/2])
        cube([27, 40, thickness], center=true);
      // Ball joint mount horns.
      for (x = [-1, 1]) {
        scale([x, 1, 1]) intersection() {
          translate([0, 15, horn_thickness/2])
            cube([separation, 18, horn_thickness], center=true);
          translate([horn_x, 16, horn_thickness/2]) rotate([0, 90, 0])
            cylinder(r1=14, r2=2.5, h=separation/2-horn_x);
        }
      }//for
      // Belt clamps.
      difference() {
        union() {
      //   translate([6.5, -2.5, horn_thickness/2+1])
      //      cube([14, 7, horn_thickness-2], center=true);
      //   translate([10.75, 2.5, horn_thickness/2+1])
      //      cube([5.5, 16, horn_thickness-2], center=true);
        }
        // Avoid touching diagonal push rods (carbon tube).
      //  translate([20, -10, 12.5]) rotate([35, 35, 30])
      //    cube([40, 40, 20], center=true);
      }
	translate([5, -12-3, thickness])gt2(w=8,l=25);
	translate([-2.5,-16,thickness])cube([7,26,8]);
	translate([9,-16,thickness])cube([5,26,8]);
 /*     for (y = [-12, 7]) {
    #    translate([1.25, y, thickness+4])
          cube([7, 8, 8], center=true);
      } */
    }//union
    // Screws for linear slider.
    for (x = [-10, 10]) {
      for (y = [-10, 10]) {
        translate([x, y, thickness]) 
          cylinder(r=m3_wide_radius, h=30, center=true, $fn=12);
      }
    }
    // Screws for ball joints.
    translate([0, 16, horn_thickness/2]) rotate([0, 90, 0]) 
      cylinder(r=m3_wide_radius, h=60, center=true, $fn=12);
    // Lock nuts for ball joints.
    for (x = [-1, 1]) {
      scale([x, 1, 1]) intersection() {
        translate([horn_x, 16, horn_thickness/2]) rotate([90, 0, -90])
          cylinder(r1=m3_nut_radius, r2=m3_nut_radius+0.5, h=8,
                   center=true, $fn=6);
      }
    }
  }
}
//GT2齿面
module gt2(l,w)
{
	//cube([1,l,w]);
	for(n=[0:2:l])
	{
		translate([0,n,0])cylinder(r=1/cos(30),h=w,$fn=3);
	}
}

module test_gt2(s)
{
	union()
	{
		gt2(w=6,l=20);
		translate([-4.5,0,-3])cube([11,20,3]);
		translate([1/cos(30)+s+0.2+extra_radius,0,0])cube([4,20,6]);
		translate([-4.5,0,0])cube([4,20,6]);
	}
}

//translate([0,0,10])test_gt2(s=0.7);
carriage();
