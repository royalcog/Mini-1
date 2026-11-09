dark_alpha = (dark_alpha < dark_target)
    ? min(dark_alpha + dark_speed, dark_target)
    : max(dark_alpha - dark_speed, dark_target);

// fully black and a room is waiting -> switch rooms, then fade in over there
if (goto_room != noone && dark_alpha >= 1)
{
    room_goto(goto_room);
    goto_room   = noone;
    dark_target = 0;
}

// finished fading back in -> clean up
if (dark_target == 0 && dark_alpha <= 0) instance_destroy();