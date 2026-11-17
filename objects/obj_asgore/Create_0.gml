sprite_index = spr_asgore_armor_walk_left_mad;
image_xscale = 2;
image_yscale = 2;
depth = -102;        // in front of flowery
reflect_offset = -3; // his reflection was floating a pixel below his feet

// walks in only the first time in the opening room; coming back from the flashback, he's right where he was
var _back = variable_global_exists("flashback_done") && global.flashback_done;
if (room == rm_zero && !_back) scr_walk_in_setup(430, 500, 2.2);
else
{
    walking = false;
    if (room == rm_zero)
    {
        x = 430;
        sprite_index = spr_asgore_armor_walk_up;
        image_index  = 0;
    }
}