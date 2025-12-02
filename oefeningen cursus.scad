/* Mouse */

// diameter_ears = 10;
// diameter_head = 22;

// translate([-10, 0, 0]) {
//     circle(d=diameter_ears, center=true);
// }

// translate([+10, 0, 0]) {
//     circle(d=diameter_ears, center=true);
// }

// translate([0, -10, 0]) {
//     circle(d=diameter_head, center=true);
// }



/* Yoyo */

// height = 5;
// radius_big = 10;
// radius_small = 5;

// translate([0, 0, height / 2]){
//     cylinder(h=height, r1=radius_big, r2=radius_small,center=true);
// }

// translate([0, 0, height + (height/2)]) {
//     cylinder(h=height, r1=radius_small, r2=radius_big,center=true);
// }


/* yoyo */

//height_top_cylinder = 3;
//height_bottom_cylinder = 15;
//height_bevel = 0.5;
//height_above_bevel = height_bottom_cylinder+height_bevel;
//height_top = 1.25;
//width = 20;
//width_r1_bevel = width - 1;
//width_r2_bevel = width / 2;
//width_r2_top = 4;
//width_top_cylinder = 6;
//width_stick = width_r2_top;
//height_stick = 8;
//
//
//
//cylinder(h=height_bottom_cylinder, r1=0, r2=width);
//
//// bevel
//translate([0,0,height_bottom_cylinder]){
//    cylinder(h=height_bevel, r1=width, r2=width-1);
//}
//
//// cylinder above bevel 
//translate([0, 0, height_above_bevel]){
//    cylinder(h=height_top_cylinder, r1=width_r1_bevel, r2=width_r2_bevel);
//}
//
//// top level cylinder
//translate([0, 0, height_above_bevel + height_top_cylinder]){
//    cylinder(h=height_top, r1=width_r2_bevel, r2=width_r2_top);
//}
//
//// top level cylinder
//translate([0, 0, height_above_bevel + height_top_cylinder + height_top]){
//    cylinder(h=height_stick, r1=width_r2_top, r2=width_r2_top, $fn=40);
//}
//

/* Epcot */

width_bottom_cylinder = 20;
height_bottom_cylinder = 3;
width_top_cylinder = 15;

// cylinder
cylinder(h=height_bottom_cylinder, r1=width_bottom_cylinder, r2=width_top_cylinder, $fn=150);

// bol
translate([0,0,height_bottom_cylinder + 18]){
    difference(){
        sphere(width_bottom_cylinder * 1.2, $fn=150);
        translate([0,0,0]){
            cube([width_bottom_cylinder, width_bottom_cylinder, 3]);
        }
    }
}










