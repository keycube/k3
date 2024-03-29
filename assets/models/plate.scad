use <utils/mirror_copy.scad>

module plate(size, matrixSize, switchSize, spacing) {
    thickness = size[2];
    
    union() {
        difference() {
            cube([size[0], size[1], thickness], true);
            translate([
                (matrixSize*switchSize+(spacing-switchSize)*(matrixSize-1))/-2, 
                (matrixSize*switchSize+(spacing-switchSize)*(matrixSize-1))/-2,
                (thickness+1)/-2
            ])
            union() {
                for (i = [0 : 1 : matrixSize-1]) {
                    for (j = [0 : 1 : matrixSize-1]) {
                        translate([spacing*i, spacing*j, 0])
                            cube([switchSize, switchSize, thickness+1]);
                    }
                }            
            }
            
            mirror_copy([0, 1, 0])
                mirror_copy([1, 0, 0])
                    translate([size[0]/2, size[1]/2, 0])
                        cube([4, 4, thickness+1], true);
        }
        
        mirror_copy([0, 0, 1]) {
            translate([0, 0, 1]) {
                cube([matrixSize*spacing, thickness, 1], true);
                cube([thickness, size[1]-(spacing-switchSize), 1], true);
                translate([spacing, 0, 0])
                cube([thickness, size[1]-(spacing-switchSize), 1], true);
                translate([-spacing, 0, 0])
                cube([thickness, size[1]-(spacing-switchSize), 1], true);
            }
        }
    }
}

//plate([80, 80, 1.4], 4, 14.1, 19);
plate([80, 40, 1.4], 4, 14.2, 19);