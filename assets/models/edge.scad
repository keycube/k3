module edge(radius, height, screwhole, thickness) {
    difference() {
        cylinder(h = height, r = radius, center = true);
        
        translate([0, (radius+1)/2, 0])
            cube([radius*2+1, radius+1, height+1], true);
        translate([(radius+1)/-2, (radius)/-2, 0])
            cube([radius+1, radius+1, height+1], true);
    }
}

edge(12, 80, 1.05, 1.25);

$fa = 1.5;
$fs = 0.15;