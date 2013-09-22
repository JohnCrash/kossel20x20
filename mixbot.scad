extrusion = 30;
extrusion_block_width = 10;

module extrusion_cutout(h, extra) {
 	 difference() {
    cube([extrusion+extra, extrusion+extra, h], center=true);
    for (a = [0:90:359]) rotate([0, 0, a]) {
      translate([extrusion/2, 0, 0])
        cube([6, extrusion_block_width-extra, h+1], center=true);
    }
  }
}

extrusion_cutout(40,0.2);