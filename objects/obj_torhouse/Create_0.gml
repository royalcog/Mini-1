image_xscale = 2;
image_yscale = 2;

// ===== night / dream settings =====
night_tint = make_colour_rgb(120, 115, 175); // multiplied in. lower = darker night, more blue = cooler
dream_wave = 0.0015;  // sway strength (0 = still)
dream_blur = 0.004;   // how far the glow spreads
dream_glow = 0.35;    // how strong the glow is (0 = none)

u_time = shader_get_uniform(shd_night_dream, "u_time");
u_uvs  = shader_get_uniform(shd_night_dream, "u_uvs");
u_tint = shader_get_uniform(shd_night_dream, "u_tint");
u_wave = shader_get_uniform(shd_night_dream, "u_wave");
u_blur = shader_get_uniform(shd_night_dream, "u_blur");
u_glow = shader_get_uniform(shd_night_dream, "u_glow");