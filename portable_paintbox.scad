// box
width_box = 80;
length_box = 120;
height_box = 50;
bottom_box = 4;

// separators
separator_width = 4;
separator_length = 80;
amount_separators = 3;


// box
difference(){
    cube([width_box + separator_width, length_box + separator_width, height_box]);

    translate([separator_width, separator_width, bottom_box]){
        cube([width_box - separator_width, length_box - separator_width, height_box]);
    }
}

// separators
for (i=[1:amount_separators - 1]) {
    translate([0, i * (length_box / amount_separators), bottom_box]){
        cube([width_box + separator_width, separator_width, height_box - bottom_box]);
    }
}

// lid
$translate([0, 0, height_box/2]){
    cube([width_box + 2, length_box + 2, 5]);
}


// translate([width_box + separator_width, 60, bottom_box]){
//     rotate([0, 0, 90]){
//         cube([separator_width, width_box, height_box - bottom_box]);
//     }
// }