// Parameters
base_width = 14;  
base_height = 5;
cover_bottom_width = 15.6;  
cover_top_width = 12;   
cover_height = 6.2;       
stem_width = 6;          
stem_height = 3.8;         

module switch() {
    // Base part
    translate([0, 0, -base_height / 2])
        cube([base_width, base_width, base_height], center = true);
    
    // Cover (using linear_extrude)
    linear_extrude(height = cover_height, scale = cover_top_width / cover_bottom_width)
        square([cover_bottom_width, cover_bottom_width], center = true);

    // Stem
    translate([0, 0, cover_height + stem_height/2])
        cube([stem_width, stem_width, stem_height], center = true);
}

// Render the switch
switch();
