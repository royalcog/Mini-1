// gradient shadow over everything drawn in the room this frame (multiply blend)
var _cam = view_camera[0];
var _cx = camera_get_view_x(_cam) - 64;
var _cy = camera_get_view_y(_cam) - 64;
var _cw = camera_get_view_width(_cam) + 128;
var _ch = camera_get_view_height(_cam) + 128;

gpu_set_blendmode_ext(bm_dest_colour, bm_zero);
draw_rectangle_colour(_cx, _cy, _cx + _cw, _cy + _ch,
    shadow_top, shadow_top, shadow_bottom, shadow_bottom, false);
gpu_set_blendmode(bm_normal);