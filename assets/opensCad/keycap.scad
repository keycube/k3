use <utils/rounded_square.scad>

// Parameters for the keycap
keycap_base_width = 18;      // Base width of the keycap
keycap_top_width = 14;       // Top width of the keycap
keycap_height = 6;           // Height of the keycap
keycap_thickness = 1.0;      // Thickness of the keycap walls
stem_socket_width = 4;       // Width of the stem socket
stem_socket_depth = 5;     // Depth of the stem socket

module keycap() {
    difference() {     
    // Outer keycap shape
    linear_extrude(height = keycap_height, scale = keycap_top_width / keycap_base_width)
        rounded_square(keycap_base_width, 1, true);

    // Inner keycap shape (for hollowing)
    translate([0, 0, -keycap_thickness])
        linear_extrude(height = keycap_height - keycap_thickness, scale = (keycap_top_width - 2 * keycap_thickness) / (keycap_base_width - 2 * keycap_thickness))
            square([keycap_base_width - 2 * keycap_thickness, keycap_base_width - 2 * keycap_thickness], center = true);
        
    }
    
    // Stem socket at the bottom of the keycap
    translate([0, 0, stem_socket_depth/2])
        cube([stem_socket_width, stem_socket_width, stem_socket_depth], center = true);
}

// Render the keycap
keycap();

$fa = 0.5;
$fs = 0.15;