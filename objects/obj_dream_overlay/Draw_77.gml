if (!surface_exists(application_surface)) exit;

var _pos = application_get_position();
var _sw  = surface_get_width(application_surface);
var _sh  = surface_get_height(application_surface);
var _px  = _sw / camera_get_view_width(view_camera[0]); // surface pixels per game pixel

draw_clear(c_black);
shader_set(shd_dream_post);
shader_set_uniform_f(u_post_texel, 1 / _sw, 1 / _sh);
shader_set_uniform_f(u_post_step, post_spread * _px / 3);
shader_set_uniform_f(u_post_soft, post_soft);
shader_set_uniform_f(u_post_glow, post_glow);
shader_set_uniform_f(u_post_thresh, post_thresh);
gpu_set_blendenable(false);
draw_surface_stretched(application_surface, _pos[0], _pos[1], _pos[2] - _pos[0], _pos[3] - _pos[1]);
gpu_set_blendenable(true);
shader_reset();