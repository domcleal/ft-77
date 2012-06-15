/*
 * Replacement tuning dial for a Yaesu FT-77
 *
 * Copyright (c) 2012, Dominic Cleal <dominic@computerkb.co.uk>
 * Licensed under Attribution-ShareAlike 2.0 Generic (CC BY-SA 2.0)
 */

thickness = 3;
$fn = 30;

// Bottom slightly slanted rim
// 49mm, 3mm thickness
rim1_r1 = 24.5;
rim1_h = 3;
rotate_extrude()
polygon(points=[
	[rim1_r1-thickness,0],
	[rim1_r1,0],
	[rim1_r1,rim1_h],
	[rim1_r1-thickness,rim1_h]
]);

// Middle slanted rim
// From 44 to 49mm, 4-3mm thickness
// TODO: little indents every 3mm
rim2_r1 = 22;
rim2_r2 = 24.5;
rim2_h = 4;  // 7
rim2_padding = 1;
translate([0,0,rim1_h])
rotate_extrude()
polygon(points=[
    [rim2_r2-thickness,0],
    [rim2_r2,0],
    [rim2_r1,rim2_h],
    [rim2_r1-thickness-rim2_padding,rim2_h] 
]);

// Small rim above outer dial
// 44mm diameter, 7mm thickness, plus overlap with central, 2mm height
rim3_r1 = 22;
rim3_r2 = rim3_r1 - 7;
rim3_h = 2;  // 9
rim3_padding = 2;
translate([0,0,rim1_h+rim2_h])
rotate_extrude()
polygon(points=[
	[rim3_r2-rim3_padding,0],
	[rim3_r1,0],
	[rim3_r1,rim3_h],
	[rim3_r2-rim3_padding,rim3_h]
]);

// Central knob
// 37-38mm diameter, 3mm thickness
rim4_r1 = 18.5;
rim4_r2 = 19;
rim4_h = 10;  // 19
cent_screw_r1 = 2;
cent_screw_y = 12;
difference() {
	translate([0,0,rim1_h+rim2_h+rim3_h])
	rotate_extrude()
	polygon(points=[
		[rim4_r2-thickness,0],
		[rim4_r2,0],
		[rim4_r1,rim4_h],
		[rim4_r1-thickness,rim4_h]
	]);

	// Drilled 4mm hole, 12mm above base
	translate([rim4_r1-thickness,0,cent_screw_y])
	rotate ([0,90,0])
	cylinder(h=thickness+2, r=cent_screw_r1, center=false);
}

// Central hole
// 6mm approx hole, with 3mm slanted outside
cent_r1 = 6;
cent_r2 = 7;
cent_thickness = 3;
cent_i1 = cent_r1 - cent_thickness;
cent_i2 = cent_i1 - 0.1; // slight tapering towards the top
cent_h = 13;
cent_y = 6;
difference() {
	translate([0,0,cent_y])
	cylinder(h=cent_h, r1=cent_r1, r2=cent_r2, center=false);

	// Hollow centre
	translate([0,0,cent_y-1])
	cylinder(h=cent_h+2, r1=cent_i1, r2=cent_i2, center=false);

	// Drilled 4mm hole
	translate([cent_i1-1,0,cent_screw_y])
	rotate([0,90,0])
	cylinder(h=cent_thickness+2, r=cent_screw_r1, center=false);
}

// Top of knob
// 7mm thick
rim5_r1 = rim4_r1;
rim5_h = 7;
top_hole_r1 = 1.5;
difference() {
	translate([0,0,rim1_h+rim2_h+rim3_h+rim4_h])
	cylinder (h=rim5_h, r=rim5_r1, center=false);

	// Drilled 3mm hole
	translate([0,0,rim1_h+rim2_h+rim3_h+rim4_h-1])
	cylinder (h=rim5_h+2, r=top_hole_r1, center=false);
}
