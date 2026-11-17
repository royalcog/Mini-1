if (door_open > 0) draw_sway_rect(door_l, door_t, door_r, door_b, door_open);

if (window_dark > 0)
{
    var _a = window_dark * window_dark * (3 - 2 * window_dark); // eased
    draw_sway_rect(win_l, win_t, win_r, win_b, _a);
}

// TEMP debug: red boxes around the window and door areas
if (debug_show)
{
    var _w1 = scr_town_north_to_room(win_l, win_t),  _w2 = scr_town_north_to_room(win_r + 1, win_b + 1);
    var _d1 = scr_town_north_to_room(door_l, door_t), _d2 = scr_town_north_to_room(door_r + 1, door_b + 1);
    draw_set_colour(c_red);
    draw_rectangle(_w1[0], _w1[1], _w2[0] - 1, _w2[1] - 1, true);
    draw_rectangle(_d1[0], _d1[1], _d2[0] - 1, _d2[1] - 1, true);
    draw_set_colour(c_white);
}