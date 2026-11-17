if (door_open > 0) draw_sway_rect(door_l, door_t, door_r, door_b, door_open);

if (window_dark > 0)
{
    var _a = window_dark * window_dark * (3 - 2 * window_dark); // eased

    // soft black glow: stacked rings, each one a pixel bigger, so it's darkest at the window and fades outward
    var _pulse = 1 - glow_pulse_amount * (0.5 + 0.5 * sin(current_time / 1000 * glow_pulse_speed));
    var _per   = 1 - power(1 - glow_alpha * _pulse, 1 / glow_size); // per ring, so they stack up to glow_alpha at the edge
    for (var k = glow_size; k >= 1; k--)
    {
        draw_sway_rect(win_l - k, win_t - k, win_r + k, win_b + k, _per * _a);
    }

    // the window itself, solid black
    draw_sway_rect(win_l, win_t, win_r, win_b, _a);
}