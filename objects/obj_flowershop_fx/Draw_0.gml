if (door_open > 0) draw_sway_rect(door_l, door_t, door_r, door_b, door_open);

if (window_dark > 0)
{
    var _a = window_dark * window_dark * (3 - 2 * window_dark); // eased
    draw_sway_rect(win_l, win_t, win_r, win_b, _a);
}