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

// black glow coming off the window once it's dark
glow_size         = 8;    // how far the glow reaches past the window, in sprite pixels (each one is 2 on screen)
glow_alpha        = 0.65; // how dark the glow is right at the window's edge
glow_pulse_amount = 0.35; // how much it breathes in and out (0 = steady)
glow_pulse_speed  = 2.5;  // how fast it breathes

/// one exact pixel-row quad (two triangles), for use between draw_primitive_begin/end
add_quad = function(_x1, _y1, _x2, _y2, _col, _alpha)
{
    draw_vertex_colour(_x1, _y1, _col, _alpha);
    draw_vertex_colour(_x2, _y1, _col, _alpha);
    draw_vertex_colour(_x1, _y2, _col, _alpha);
    draw_vertex_colour(_x2, _y1, _col, _alpha);
    draw_vertex_colour(_x2, _y2, _col, _alpha);
    draw_vertex_colour(_x1, _y2, _col, _alpha);
}

/// a rectangle (in spr_town_north pixels) that sways with the dream shader like the background does,
/// drawn one 1px row at a time. _outline = true just draws its edges (for debugging)
draw_sway_rect = function(_l, _t, _r, _b, _alpha, _col = c_black, _outline = false)
{
    var _tl = scr_town_north_to_room(_l, _t);
    var _br = scr_town_north_to_room(_r + 1, _b + 1); // +1: the far edge of the last pixel
    var _o  = instance_exists(obj_dream_overlay) ? obj_dream_overlay : noone;
    var _time = current_time / 1000;

    draw_primitive_begin(pr_trianglelist);
    for (var _y = _tl[1]; _y < _br[1]; _y++)
    {
        // same sideways sway shd_night_dream gives the background on this row
        var _s = 0;
        if (_o != noone) _s = round(sin((_y + 0.5) * _o.dream_wave_freq + _time * _o.dream_wave_speed) * _o.dream_wave);
        var _x1 = _tl[0] + _s;
        var _x2 = _br[0] + _s;

        if (!_outline || _y == _tl[1] || _y == _br[1] - 1)
        {
            add_quad(_x1, _y, _x2, _y + 1, _col, _alpha);           // whole row
        }
        else
        {
            add_quad(_x1, _y, _x1 + 1, _y + 1, _col, _alpha);       // left edge
            add_quad(_x2 - 1, _y, _x2, _y + 1, _col, _alpha);       // right edge
        }
    }
    draw_primitive_end();
}