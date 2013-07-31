// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.30;

// OD = outside diameter, corner to corner.
//六角螺母
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m4_nut_od = 8;
m4_nut_radius = m4_nut_od/2 + 0.2 +extra_radius;
m3_nut_height = 2.4;
m4_nut_height = 3.2;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;

// NEMA17 stepper motors.
motor_shaft_diameter = 5;
motor_shaft_radius = motor_shaft_diameter/2 + extra_radius;

// Frame brackets. M3x8mm screws work best with 3.6 mm brackets.
thickness = 3.6;

// OpenBeam or Misumi. Currently only 15x15 mm, but there is a plan
// to make models more parametric and allow 20x20 mm in the future.
//extrusion = 15;
extrusion = 20;
//extrusion_block_width = 2.5; //15x15
extrusion_block_width = 6.1; //20x20

//corner_radius = 36; //15x15
corner_radius = 40; //20x20

//extrusion_offset = 0;//15x15
extrusion_offset = -2.5; //20x20

//height_offset = 0; //15x15
height_offset = -extrusion_offset; //20x20

//screw_offset=-7.5; //15x15
screw_offset=-12; //20x20