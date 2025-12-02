// // general params
// space_between_rands = 120;

// // rand
// rand_thickness = 5;
// rand_height = 50;
// rand_length = 250;

// // platform params (platform parameters)
// platform_width = space_between_rands + (2*rand_thickness);
// platform_length = rand_length;
// platform_inner_height = 10;
// shell_thickness = 2; // Thickness of the indent/border
// ground_of_shell_thickness = 2;
// platform_height = platform_inner_height + ground_of_shell_thickness;

// // cirkel voor glas
// circle_radius = 50;
// circle_indent = 1;
// circle_height = 5;
// circle_position_x = 60;
// circle_position_y = 190;


// // rand links (left border)
// color("red"){
//     cube([rand_thickness, rand_length, rand_height]);
// }

// // rand rechts (right border)
// color("red"){
// translate([platform_width - rand_thickness, 0, 0]) {
//         cube([rand_thickness, rand_length, rand_height]);
//     }
// }

// // platform with indent hole on top
// translate([0, 0, rand_height]) {
//     difference() {
//         cube([platform_width, platform_length, platform_height]);
//         translate([shell_thickness, shell_thickness, ground_of_shell_thickness]) {
//             difference(){
//                 cube([platform_width - 2*shell_thickness, platform_length - 2*shell_thickness, platform_height]);
//                 // position circle
//                 translate([circle_position_x, circle_position_y, ground_of_shell_thickness]){
//                     linear_extrude(1){
//                         circle(circle_radius, circle_indent);
//                     }
//                 }
//             }
//         }
//     }
// }



// Parameters for the rectangular frame
outer_length = 85; // Outer length of the frame (in mm)
outer_width = 65; // Outer width of the frame (in mm)
border_thickness = 2; // Thickness of the raised border (in mm)
border_height = 10; // Height of the raised border (in mm)
inner_length = outer_length - 2 * border_thickness; // Inner length of the frame (in mm)
inner_width = outer_width - 2 * border_thickness; // Inner width of the frame (in mm)
bottom_thickness = 1; // Thickness of the thin opaque bottom layer (in mm)
corner_radius = 5; // Radius for rounded corners (in mm)
slot_width = 10; // Width for headband slots (in mm)
slot_depth = 5;// Depth for headband slots (in mm)

// Function to create a rectangular frame with rounded corners, a hollow interior, and a thin opaque bottom layer
module frame() {
  difference() {
// Create the outer shell with rounded corners and raised border
    linear_extrude(height = border_height + bottom_thickness)
      offset(r = corner_radius)
        square([outer_length, outer_width], center = true);

// Create the inner hollow part with rounded corners
    translate([0, 0, bottom_thickness])
      linear_extrude(height = border_height + bottom_thickness + 10)
        offset(r = corner_radius - 1)
          square([inner_length, inner_width], center = true);

// Create the top cutout for the headband in the center of the narrow side
    // translate([outer_length/2 + border_thickness, 0, bottom_thickness + slot_depth/2])
    //   cube([10, border_height + 1, slot_depth], center = true);

// Cutout under the cube
    translate([0, 0, -1])
      cube([slot_width + 2 , border_height + 1, bottom_thickness + 10], center = true);
  }

// The cube
  translate([0, 0, bottom_thickness + 5])
    cube([slot_width, border_height + 5, 10], center = true);
}

// Create the frame using the module
frame();