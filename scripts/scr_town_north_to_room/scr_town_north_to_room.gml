/// sprite pixel on spr_town_north -> room position (follows wherever obj_town_north got centered)
function scr_town_north_to_room(_px, _py)
{
    if (!instance_exists(obj_town_north)) return [_px, _py];
    var _t = obj_town_north;
    return [
        _t.x + (_px - sprite_get_xoffset(_t.sprite_index)) * _t.image_xscale,
        _t.y + (_py - sprite_get_yoffset(_t.sprite_index)) * _t.image_yscale
    ];
}