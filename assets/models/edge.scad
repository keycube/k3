module edge(radius, height, screwhole, thickness) {
    difference() {
        union() {
            // curved edge 
            difference() {
                cylinder(h = height, r = radius, center = true);
                
                translate([0, (radius+1)/2, 0])
                    cube([radius*2+1, radius+1, height+1], true);
                translate([(radius+1)/-2, (radius)/-2, 0])
                    cube([radius+1, radius+1, height+1], true);
                
                cylinder(h = height+1, r = radius-2, center = true);
            }
            
            // border
            translate([(radius-1)/2, -1, 0])
                cube([radius-1, 2, height], true);
            translate([1, (radius-1)/-2, 0])
                cube([2, radius-1, height], true);
            
            // inside fortification
            rotate([0, 0, -45])
            translate([radius/2+0.5, 0, 0])
                cube([radius-2, 2, height], true);
            
            // plate
            translate([4, -4, height/2-2])
            cube([8, 8, 4], center = true);
        }
     
        translate([3.5+screwhole, -3.5-screwhole, height/2])
        cylinder(r=screwhole, h=16, $fn=200, center = true);
        size = 4.5;
        nheight = 2;
        translate([0, 0, height/2-1-1.25])
        rotate([0, 0, -45])
            translate([size/2, 0, 0])
            union() {
                cube([size*2, size, nheight], center = true);
                inradius = (size/2)/(sqrt(3)/2);
                translate([size, 0, 0])
                cylinder(r=inradius, h=nheight, $fn=6, center = true);
            }
    }
}

edge(12, 76, 1.15, 1.25);

$fa = 5;
$fs = 1.5;

//use <corner.scad>
//translate([0, 0, 76/2])
//    corner(12, 1.15, 2.05, 1.25);