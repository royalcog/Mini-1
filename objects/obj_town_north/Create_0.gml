image_xscale = 2;
image_yscale = 2;
depth = 100;

// center the Flower Shop in the camera
shop_center_px = 1329; // the shop's middle, in sprite pixels (nudge this to fine-tune)
var _cam = view_camera[0];
var _view_center = camera_get_view_x(_cam) + camera_get_view_width(_cam) / 2;
x = round(_view_center - (shop_center_px - sprite_get_xoffset(sprite_index)) * image_xscale);