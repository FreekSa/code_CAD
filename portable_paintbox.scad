// box
width_box = 80;
length_box = 120;
height_box = 50;
bottom_box = 4;

// separators
separator_width = 4;
separator_length = 80;
amount_separators = 3;
height_separators = (height_box - bottom_box) / 1.25;


// general box
// box
difference(){
    cube([width_box + separator_width, length_box + separator_width, height_box]){};

    translate([separator_width, separator_width, bottom_box]){
        cube([width_box - separator_width, length_box - separator_width, height_box]);
    }
}


// top tray
// separators
for (i=[1:amount_separators - 1]) {
    translate([0, i * (length_box / amount_separators), bottom_box]){
        cube([(separator_length + separator_width) / 2, separator_width, height_separators]);
    }
}

// bottom tray
translate([(separator_length + separator_width) / 2, 0, bottom_box]){
    cube([separator_width, length_box, height_separators]);
}

// lid
$translate([0, 0, height_box/2]){
    cube([width_box + 2, length_box + 2, 5]);
}