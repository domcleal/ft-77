// Replacement tuning dial for a Yaesu FT-77

// Bottom slightly slanted rim
// From 49 to 50mm, 3mm thickness
rotate_extrude($fn=100) polygon( points=[[47,0],[50,0],[49,3],[46,3]] );

// Middle slanted rim
// From 47 to 49mm, 4-3mm thickness
// TODO: little indents every 3mm
translate([0,0,3])
rotate_extrude($fn=100) polygon( points=[[46,0],[49,0],[47,4],[43,4]] );

// Small rim above outer dial
// 46mm diameter, 8mm thickness (for overlap with central)
translate([0,0,7])
rotate_extrude($fn=100) polygon( points=[[38,0],[46,0],[46,2],[38,2]] );

// Central knob
// 40mm diameter, 3mm thickness
difference() {
	translate([0,0,9])
	rotate_extrude($fn=100) polygon( points=[[37,0],[40,0],[40,10],[37,10]] );

	// Drilled 5mm hole, 1mm above bottom
	translate([34,0,12.5])
	rotate ([0,90,0])
	cylinder (h = 6, r=2.5, center = false, $fn=100);
}

// Central hole
// 6mm approx hole, with 3mm slanted outside
difference() {
	translate([0,0,6])
	cylinder (h = 13, r1=12, r2=14, center = false, $fn=100);

	translate([0,0,5])
	cylinder (h = 15, r1=6, r2=5.9, center = false, $fn=100);

	// Drilled 5mm hole
	translate([2,0,12.5])
	rotate ([0,90,0])
	cylinder (h = 12, r=2.5, center = false, $fn=100);
}

// Top of knob
// 7mm thick
difference() {
	translate([0,0,19])
	cylinder (h = 7, r=40, center = false, $fn=100);

	// Drilled 3mm hole
	translate([0,0,18])
	cylinder (h = 8, r=1.5, center = false, $fn=100);
}
