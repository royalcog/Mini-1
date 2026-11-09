// whoever's lower on screen draws in front
with (obj_asgore) depth = -bbox_bottom;
with (obj_toriel) depth = -bbox_bottom;
with (obj_carol)  depth = -bbox_bottom;
with (obj_rudy)   depth = -bbox_bottom;
var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam), _vy = camera_get_view_y(_cam);
var _vw = camera_get_view_width(_cam), _vh = camera_get_view_height(_cam);

for (var i = 0; i < array_length(motes); i++)
{
    var _m = motes[i];
    _m.y -= _m.spd;
    _m.phase += 1.5;
    if (_m.y < _vy - 8) // drifted off the top -> come back in at the bottom
    {
        _m.y = _vy + _vh + 8;
        _m.x = _vx + random(_vw);
    }
}