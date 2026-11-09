sprite_index = spr_asgore_armor_walk_left_mad;
image_xscale = 2;
image_yscale = 2;
depth = -102;        // in front of flowery
reflect_offset = -3; // his reflection was floating a pixel below his feet

// walks in only in the opening room; anywhere else he stays where you placed him
if (room == rm_zero) scr_walk_in_setup(430, 500, 2.2);
else walking = false;