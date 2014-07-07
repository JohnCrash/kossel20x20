// Based on "Makergear Filament drive goes Bowden" by Luke321
// http://www.thingiverse.com/thing:63674

include <configuration.scad>;

use <extruder_wheel.scad>;

filament_offset = 24;
filament_offset_y = 10+2;

module extruder() {
  rotate([90, 0, 0]) difference() {
    union() {
      //main cylinder
      translate([16,20,21]) rotate([90,0,0]) cylinder(h=20, r=20);
      //bearing mount
      translate([33.3,20,21]) rotate([90,0,0]) cylinder (h=20, r=8);

      //pushfit/pneufit mount
      translate([filament_offset, filament_offset_y, 10])
        rotate([0,0,30])cylinder(r=7.5, h=20, center=true, $fn=6);

      //filament support
      translate([filament_offset,filament_offset_y,34]) rotate([0,0,0]) cylinder (h=8, r=3, $fn=12);

      //clamp
      translate([20, 0, 31-3-5]) cube([13+1+2+5, 20, 18-1+5]);
		
/*	    translate([16,20,21]) rotate([90,0,0]){
		   rotate([0,0,45]) {
	        //translate([14,0,0]) cylinder(h=22, r=1.6, $fn=12);
	        translate([0,15,0]) cylinder(h=20, r=5, $fn=24);
	        translate([-15,0,0]) cylinder(h=20, r=5, $fn=24);
	        translate([0,-15,0]) cylinder(h=20,r=5, $fn=24);
	      }
    	}*/
		translate([-10,-15,10])rotate([0,45,0])
		difference()
		{
			cube([20,35,12]);
			translate([0,0,-5])cube([7.5,35,11]);
			translate([12.5,0,-5])cube([7.5,35,11]);
			translate([10,7,-10])
			{
				cylinder(r=3.2/2,h=30,$fn=12);
				translate([0,0,20])cylinder(r=6.2/2,h=5,$fn=12);
				translate([-5,-4,6])cube([10,7,10]);
			}
			translate([0,0,-9])cube([20,35,12]);
		}
	}

    //pulley opening
    translate([16,21,21]) rotate([90,0,0]){
      cylinder (h=22, r=8.5);

      rotate([0,0,0]) {
        //translate([14,0,0]) cylinder(h=22, r=1.6, $fn=12);
        //translate([0,15,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([-15,0,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([0,-15,0]) cylinder(h=22, r=1.6, $fn=12);
      }
    }

    //gearhead indentation
    translate([16,21,21]) rotate([90,0,0]) cylinder (h=3.35, r=11+0.2+extra_radius);

    //pulley hub indentation
    translate([16,20-2,21]) rotate([90,0,0]) cylinder (h=5.6, r=8+0.2+extra_radius);

    //bearing screws
    translate([33.3,21,21]) rotate([90,0,0]) cylinder (h=22, r=2.6, $fn=12);
  //  translate([33.3,22+2,21]) rotate([90,30,0]) cylinder (h=8.01, r=4.3, $fn=6);

    //bearing
    difference() {
      union() {
   #    translate([31+2.4,9.5+4+2,21]) rotate([90,0,0]) cylinder (h=7, r=8.5);
       translate([31+2.4-5,9.5-5.25+4-1.8+2,21-8.25-1]) cube([20, 7, 18.5]);
        //opening between bearing and pulley
   #     translate([20,9.5-5.25+2.2+2,21-8.25+3.25-2]) cube([10, 7, 14]);
      }
      //removable supports
      for (z = [15:3:27]) {
        translate([36, 10, z])  cube([29, 20, 0.5], center=true);
      }
    }

    //filament path chamfer
    translate([filament_offset,filament_offset_y,11]) rotate([0,0,0]) 
      cylinder(h=3, r1=0.5, r2=3, $fn=12);

    //filament path
    translate([filament_offset,filament_offset_y,-16]) rotate([0,0,0]) 
      cylinder(h=30, r=1.1+extra_radius, $fn=12);
    translate([filament_offset,filament_offset_y,28]) rotate([0,0,0]) 
      cylinder(h=30, r=1.1+extra_radius, $fn=12);

    //pushfit/pneufit mount
    translate([filament_offset, filament_offset_y, 0])  cylinder(r=1.5, h=8, $fn=12);

	translate([10.5-20.5,8+2-2,38+6.5-3.5]) rotate([0,90,0])
	rotate([0,0,30])cylinder(r=6.5,h=30,$fn=6);
    //clamp slit
  #  translate([25+2,-1,12]) cube([2+extra_radius, 22, 40]);
	translate([25+2+1,21,12]) rotate([90,0,0])cylinder(r=1+extra_radius,h=22,$fn=12);
    //clamp nut
   translate([10.5-11,12-4,38+6.5-6]) rotate([0,90,0])
      rotate([0,0,30])cylinder(h=22, r=m3_nut_radius, $fn=6);
    //clamp screw hole
  #  translate([15+2,12-4,38+6.5-6]) rotate([0,90,0])
      cylinder(h=20+20, r=m3_wide_radius, $fn=12);
  }
}

extruder();
//translate([16,-21,9])rotate([0,0,180])extruder_wheel(r=8);