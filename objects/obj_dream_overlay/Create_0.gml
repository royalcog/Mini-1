depth = -14000; // over the room, under obj_flashback_dark's black (-15000) and the textbox

// ===== settings =====
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