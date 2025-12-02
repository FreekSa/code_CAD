opacity_cube = .5;
width_cube = 150 + 2;
height_cube = 150 + 2;
depth_cube = 25;

first_layers = 1;

inner_width = width_cube - 2;
inner_height = height_cube - 2;
inner_depth = depth_cube;

rows = 3;
columns = 3;

compartment_width = inner_width / columns;
compartment_height = inner_height / rows;

module generate_cube(){  
    color("blue", opacity_cube)
    cube([width_cube, height_cube, depth_cube]);
}

module generate_inner_cube(){
    cube([inner_width, inner_height, inner_depth]);
}

module generate_grid(){
    for (r = [0:rows-1]) {
        for (c = [0:columns-1]) {
            translate([
                compartment_width * c + (width_cube - inner_width) / 2,
                compartment_height * r + (height_cube - inner_height) / 2,
                first_layers
            ])
            cube([
                compartment_width - 1,
                compartment_height - 1,
                inner_depth
            ]);
        }
    }
}

module generate_without_innercube(){
    difference() {
        generate_cube();
        generate_grid();
    }
}

generate_without_innercube();
