if (dark_alpha <= 0) exit;

var _cam = view_camera[0];
var _cx = camera_get_view_x(_cam) - 64;
var _cy = camera_get_view_y(_cam) - 64;
draw_set_alpha(dark_alpha);
draw_rectangle_colour(_cx, _cy, _cx + camera_get_view_width(_cam) + 128, _cy + camera_get_view_height(_cam) + 128,
    c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);