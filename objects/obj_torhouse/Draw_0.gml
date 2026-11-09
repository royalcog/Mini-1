var _uv = sprite_get_uvs(sprite_index, image_index);

shader_set(shd_night_dream);
shader_set_uniform_f(u_time, current_time / 1000);
shader_set_uniform_f(u_uvs, _uv[0], _uv[1], _uv[2], _uv[3]);
shader_set_uniform_f(u_tint, colour_get_red(night_tint) / 255, colour_get_green(night_tint) / 255, colour_get_blue(night_tint) / 255);
shader_set_uniform_f(u_wave, dream_wave);
shader_set_uniform_f(u_blur, dream_blur);
shader_set_uniform_f(u_glow, dream_glow);
draw_self();
shader_reset();