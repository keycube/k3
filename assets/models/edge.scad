module edge(radius, height, screwhole, thickness) {
    
    cylinder(h = height, r = radius, center = true);
}

edge(12, 80, 1.05, 1.25);

$fa = 1.5;
$fs = 0.15;