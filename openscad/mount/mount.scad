/**
 * Martin Egli
* 2022-10-05
*/
use <parts.scad>
use <screws.scad>
use <mechanics_parts.scad>

module web_cam(loc_res = 32) {
    color("DarkGray") {
        translate([0, 0, 45/2])
        difference() {
            translate([0, 0, 0])
            scale([1, 60/45, 1])
            sphere(d = 45, $fn = loc_res);

            translate([0, 45, 0])
            rotate([90, 0, 0])
            cylinder(d = 45, h = 25, $fn = loc_res);
        }
        translate([0, 25, 45/2])
        rotate([90, 0, 0])
        cylinder(d = 25, h = 25, $fn = loc_res);
        translate([0, 0, 0])
        cylinder(d = 16, h = 25, $fn = loc_res);
        
        translate([-3, -2, -2])
        cube([6, 4, 6]);
    }
}

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
        cylinder(d = 100, h = th, $fn = loc_res);

        // M3 holes
        for(n=[0:1:3])
        translate([42*cos(n*90+45), 42*sin(n*90+45), -1])
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
    th = 4;
    if(show) {
        translate([28+13, 0, 39])
        rotate([0, -90, 0])
        flycat2204();
    }
    color("Red")
    difference() {
        union() {
            hull() {
                translate([0, 0, 0])
                cylinder(d = 28, h = th, $fn = loc_res);

                translate([28+13+2, -28/2, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 28, $fn = loc_res);
            }
            translate([28+13, 0, 39]) 
            rotate([0, 90, 0])
            hull() {
                translate([0, 0, 0])
                cylinder(d = 28, h = th, $fn = loc_res);

                translate([39-2, -28/2, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 28, $fn = loc_res);
            }
            hull() {
                translate([39+th, -28/2+2, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
                translate([39+th, -28/2+2, 16+2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
                translate([39+th-16, -28/2+2, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
            }
            hull() {
                translate([39+th, 28/2-4, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
                translate([39+th, 28/2-4, 16+2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
                translate([39+th-16, 28/2-4, 2])
                rotate([-90, 0, 0])
                cylinder(d = th, h = 2, $fn = loc_res);
            }
        }
        // M2 holes, motor screws
        translate([0, 0, 2])
        flycat2204_rotor_cut_m2x6mm();

        translate([0, 0, -1])
        cylinder(d = 4, h = th+2, $fn = loc_res);

        // M2 holes, motor screws
        translate([28+13+2, 0, 39]) 
        rotate([0, 90, 0])
        flycat2204_rotor_cut_m2x6mm();

        translate([28+13-1, 0, 39]) 
        rotate([0, 90, 0])
        cylinder(d = 4, h = th+2, $fn = loc_res);

        translate([28+13-1, 0, 39]) 
        rotate([0, 90, 0])
        hull() {
            translate([11, -4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
            translate([11, +4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
        }
        translate([28+13-1, 0, 17]) 
        rotate([0, 90, 0])
        hull() {
            translate([11, -4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
            translate([11, +4, -1]) 
            cylinder(d = 4, h = 8, $fn = loc_res);
        }
    }
}

module mount_pitch(show = 1, loc_res = 32) {
    th = 4;
    if(show) {
        translate([0, 0, 0]) 
        rotate([0, -90, 0])
        origin();
    }
    translate([-26-2, 0, -26-2]) {
        color("Red")
        difference() {
            union() {
                hull() {
                    translate([0, 0, 0])
                    cylinder(d = 28, h = th, $fn = loc_res);

                    translate([26, -28/2, 2])
                    rotate([-90, 0, 0])
                    cylinder(d = th, h = 28, $fn = loc_res);
                }
                translate([26-2, 0, 26+2]) 
                rotate([0, 90, 0])
                hull() {
                    translate([0, 0, 0])
                    cylinder(d = 28, h = th, $fn = loc_res);

                    translate([26, -28/2, 2])
                    rotate([-90, 0, 0])
                    cylinder(d = th, h = 28, $fn = loc_res);
                }
                hull() {
                    translate([26, -1, 2])
                    rotate([-90, 0, 0])
                    cylinder(d = th, h = 2, $fn = loc_res);
                    translate([26, -1, 12+2])
                    rotate([-90, 0, 0])
                    cylinder(d = th, h = 2, $fn = loc_res);
                    translate([26-12, -1, 2])
                    rotate([-90, 0, 0])
                    cylinder(d = th, h = 2, $fn = loc_res);
                }
            }
            // M2 hole, webcam screw
            translate([0, 0, 1])
            mirror([0, 0, 1]) 
            m2x6mm_cut();
            translate([-3.1, -2.1, th-1])
            cube([6.2, 4.4, 2]);
            
            // M2 holes, motor screws
            translate([26, 0, 26+2]) 
            rotate([0, -90, 0])
            flycat2204_rotor_cut_m2x6mm();

            translate([26-3, 0, 26+2]) 
            rotate([0, 90, 0])
            cylinder(d = 4, h = th+2, $fn = loc_res);
        }
        if(show) {
            translate([0, 0, 5]) 
            web_cam();
        }
    }

}

module put_together(show) {
    translate([0, 0, 0])
    base_plate(show);

    translate([0, 0, 13+4])
    mount_yaw(show);

    translate([26+2, 0, 56])
    rotate([0, 0, 0])
    mount_pitch(show);
}

//base_plate();
//mount_yaw();
//web_cam();
//mount_pitch();
//put_together(1);



// print
base_plate(0, 64);
//mount_yaw(0, 64);
//mount_pitch(0, 64);
