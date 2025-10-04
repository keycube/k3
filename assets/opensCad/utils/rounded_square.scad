module rounded_square( width, radius_corner, center = false ) {
    translate = (center == false) ?
		[radius_corner, radius_corner, 0] :
		[radius_corner - width / 2, radius_corner - width / 2, 0];
    
	translate( v = translate )
		minkowski() {
			square( width - 2 * radius_corner );
			circle( radius_corner );
		}
}