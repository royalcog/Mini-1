var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam), _vy = camera_get_view_y(_cam);
var _vw = camera_get_view_width(_cam), _vh = camera_get_view_height(_cam);

// dust motes (soft additive specks that sway and twinkle)
gpu_set_blendmode(bm_add);
for (var i = 0; i < array_length(motes); i++)
{
    var _m = motes[i];
    var _a = mote_alpha * (0.5 + 0.5 * dsin(_m.phase * 2));
    var _mx = round(_m.x + dsin(_m.phase) * 6);
    draw_set_alpha(_a);
    draw_rectangle_colour(_mx, round(_m.y), _mx + _m.size - 1, round(_m.y) + _m.size - 1, c_white, c_white, c_white, c_white, false);
}
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);

// vignette: clear in the middle, dark blue at the edges
var _cx = _vx + _vw / 2, _cy = _vy + _vh / 2;
draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(_cx, _cy, vignette_col, 0);
for (var i = 0; i <= 32; i++)
{
    var _a = i / 32 * 2 * pi;
    draw_vertex_colour(_cx + cos(_a) * _vw * 0.72, _cy + sin(_a) * _vh * 0.72, vignette_col, vignette_alpha);
}
draw_primitive_end();