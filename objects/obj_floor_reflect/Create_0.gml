// ===== settings =====
shadow_top    = make_colour_rgb(110, 110, 135); // multiply colour at the top of the screen (darker = lower numbers)
shadow_bottom = make_colour_rgb(225, 225, 235); // multiply colour at the bottom (c_white = no shadow)
reflect_alpha  = 0.35;   // reflection strength right at their feet
reflect_fade   = 50;     // how many pixels down the reflection fades out
reflect_col    = c_white;
floor_top      = 200;    // reflections only show between these room y values (the pink floor)
floor_bottom   = 320;
reflect_objects = [obj_kris, obj_asgore, obj_flowery]; // add more with scr_reflect_add(obj_whoever)

depth = -1; // in front of the background (depth 0), behind characters (depth = -bbox_bottom)

/// draws one instance's reflection under its feet, one sprite row at a time so it can fade
draw_reflection = function(_i)
{
    var _spr = _i.sprite_index;
    if (_spr < 0 || !_i.visible) return;

    var _img = _i.image_index;
    var _xs  = _i.image_xscale;
    var _ys  = abs(_i.image_yscale);
    var _xo  = sprite_get_xoffset(_spr);
    var _yo  = sprite_get_yoffset(_spr);
    var _w   = sprite_get_width(_spr);
    var _top = sprite_get_bbox_top(_spr);
    var _bot = sprite_get_bbox_bottom(_spr);

    var _feet = _i.y + (_bot + 1 - _yo) * _ys; // room y of the bottom of their feet
    var _x    = _i.x - _xo * _xs;              // left edge (works when flipped too)

    for (var r = _bot; r >= _top; r--)
    {
        var _dist = (_bot - r) * _ys;          // how far below the feet this row lands
        var _a = reflect_alpha * (1 - _dist / reflect_fade);
        if (_a <= 0) break;

        var _ry = _feet + _dist;
        if (_ry < floor_top || _ry + _ys > floor_bottom) continue; // stay on the floor

        draw_sprite_part_ext(_spr, _img, 0, r, _w, 1, _x, _ry, _xs, _ys, reflect_col, _a * _i.image_alpha);
    }
}