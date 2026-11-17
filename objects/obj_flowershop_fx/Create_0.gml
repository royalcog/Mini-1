depth = 50; // in front of the town (100), behind Asgore

// shop pieces, in spr_town_north pixels (inclusive)
door_l = 1251; door_t = 67; door_r = 1285; door_b = 117; // the door, inside its frame
win_l  = 1318; win_t  = 62; win_r  = 1415; win_b  = 95;  // the big front window

door_open   = 0;      // 0-1, how dark the doorway is
door_target = 0;
door_speed  = 0.15;   // door opens/shuts fast

window_dark   = 0;    // 0-1, how black the window is
window_target = 0;
window_speed  = 1 / 50; // ~1 second, during the loud part of snd_fountain_make

/// a black rectangle (in spr_town_north pixels) that sways with the dream shader like the background does
draw_sway_rect = function(_l, _t, _r, _b, _alpha)
{
    var _tl = scr_town_north_to_room(_l, _t);
    var _br = scr_town_north_to_room(_r + 1, _b + 1); // +1: the far edge of the last pixel
    var _o  = instance_exists(obj_dream_overlay) ? obj_dream_overlay : noone;
    var _time = current_time / 1000;

    draw_set_colour(c_black);
    draw_set_alpha(_alpha);
    for (var _y = _tl[1]; _y < _br[1]; _y++)
    {
        // same sideways sway shd_night_dream gives the background on this row
        var _s = 0;
        if (_o != noone) _s = round(sin((_y + 0.5) * _o.dream_wave_freq + _time * _o.dream_wave_speed) * _o.dream_wave);
        draw_rectangle(_tl[0] + _s, _y, _br[0] - 1 + _s, _y, false);
    }
    draw_set_alpha(1);
    draw_set_colour(c_white);
}