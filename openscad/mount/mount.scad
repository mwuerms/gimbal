/**
 * Martin Egli
* 2022-10-05
*/
use <parts.scad>
use <mechanics_parts.scad>

module base_plate(show = 1, loc_res = 32) {
    th = 4;
    if(show) {
        translate([0, 0, 0])
        origin();
        translate([0, 0, th + 0.1])
        flycat2204();
    }
    color("Red")
    difference() {
        translate([0, 0, 0])
        cylinder(d = 60, h = th, $fn = loc_res);

        // M3 holes
        for(n=[0:1:3])
        translate([52/2*cos(n*90+45), 52/2*sin(n*90+45), -1])
        cylinder(d = 3.1, h = th+2, $fn = loc_res);

        // M2 holes, motor screws
        translate([0, 0, 2])
        mirror([0, 0, 1])
        flycat2204_rotor_cut_m2x6mm();

        // cable channel
        translate([0, 0, -1])
        cylinder(d = 4, h = th+2, $fn = loc_res);
        translate([0, 0, -1])
        rotate([0, 90, 0])
        cylinder(d = 4, h = 20, $fn = loc_res);
        hull() {
            translate([11, -4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
            translate([11, +4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
        }
        hull() {
            translate([11, -3, 0]) 
            rotate([0, 90, 0])
            cylinder(d = 6, h = 40, $fn = loc_res);
            translate([11, +3, 0]) 
            rotate([0, 90, 0])
            cylinder(d = 6, h = 40, $fn = loc_res);
        }
    }
}

module mount_yaw(show = 1, loc_res = 32) {
    
}

module mount_pitch(show = 1, loc_res = 32) {
    
}

module put_together() {
    translate([0, 0, 0])
    base_plate();
}

put_together();

// print
//base_plate(0, 64);