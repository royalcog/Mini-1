sprite_index = spr_flowery_walk_down_left;
image_xscale = 2;
image_yscale = 2;
depth = -101;

// stops a little behind asgore, on his right (coming back from the flashback, he's already there)
if (variable_global_exists("flashback_done") && global.flashback_done)
{
    walking = false;
    x = 510;
}
else scr_walk_in_setup(510, 500, 2.2);