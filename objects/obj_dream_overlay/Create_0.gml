depth = -14000; // over the room, under obj_flashback_dark's black (-15000) and the textbox

// ===== settings =====
night_tint = make_colour_rgb(120, 115, 175); // multiplied in. lower = darker night, more blue = cooler
dream_wave       = 2;      // sway in room pixels (0 = still)
dream_wave_freq  = 0.021;  // bigger = more waves stacked down the screen
dream_wave_speed = 1.2;    // how fast the waves roll
dream_blur       = 3;      // how far the glow spreads, in room pixels
dream_glow = 0.35;    // how strong the glow is (0 = none)
vignette_col   = make_colour_rgb(10, 10, 40);
vignette_alpha = 0.75;  // darkness at the very edges
mote_count     = 35;    // floating dust specks (0 = none)
mote_alpha     = 0.35;

motes = [];
var _cam = view_camera[0];
for (var i = 0; i < mote_count; i++)
{
    array_push(motes, {
        x: camera_get_view_x(_cam) + random(camera_get_view_width(_cam)),
        y: camera_get_view_y(_cam) + random(camera_get_view_height(_cam)),
        spd: random_range(0.15, 0.45),
        phase: random(360),
        size: choose(2, 2, 4)
    });
}

// ===== soft blur + glow (whole screen, textbox stays sharp) =====
post_soft        = 0.35;  // blur mix (0 = sharp, 1 = fully blurry)
post_spread      = 1.5;   // blur size, in game pixels
post_glow        = 2.0;   // bloom strength (0 = none)
post_glow_spread = 8;     // how far the bloom reaches, in game pixels
post_thresh      = 0.25;  // how bright something must be to glow (lower = more things glow)

u_post_texel     = shader_get_uniform(shd_dream_post, "u_texel");
u_post_step      = shader_get_uniform(shd_dream_post, "u_step");
u_post_glow_step = shader_get_uniform(shd_dream_post, "u_glow_step");
u_post_soft      = shader_get_uniform(shd_dream_post, "u_soft");
u_post_glow      = shader_get_uniform(shd_dream_post, "u_glow");
u_post_thresh    = shader_get_uniform(shd_dream_post, "u_thresh");

application_surface_draw_enable(false); // Post Draw draws the screen instead, through the shader