module edge(radius, height, screwhole, thickness) {
    union() {
        difference() {
            cylinder(h = height, r = radius, center = true);
            
            translate([0, (radius+1)/2, 0])
                cube([radius*2+1, radius+1, height+1], true);
            translate([(radius+1)/-2, (radius)/-2, 0])
                cube([radius+1, radius+1, height+1], true);
            
            cylinder(h = height+1, r = radius-2, center = true);
        }
        
        translate([(radius-1)/2, -1, 0])
            cube([radius-1, 2, height], true);
        translate([1, (radius-1)/-2, 0])
            cube([2, radius-1, height], true);
        
        rotate([0, 0, -45])
        translate([radius/2+0.5, 0, 0])
            cube([radius-2, 2, height], true);
    }
}

edge(12, 76, 1.05, 1.25);

$fa = 1.5;
$fs = 0.15;