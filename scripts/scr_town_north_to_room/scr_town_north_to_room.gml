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

/// what gets spawned when rm_two fades in: the shop's window/door effects, and Asgore in the street facing the door
function scr_flowershop_spawn_list()
{
    return [
        scr_make_warp_spawn(obj_flowershop_fx, 0, 0, "Instances"),
        scr_make_warp_spawn(obj_asgore, 0, 0, "Instances", function(_i)
        {
            // in the middle of the street (on the yellow center line), facing the shop door
            var _p = scr_town_north_to_room(1268, 170);
            _i.x = _p[0];
            _i.y = _p[1];
            _i.sprite_index = spr_asgore_police_walk_up;
            _i.image_index  = 0;
            _i.image_speed  = 0;
            
            // Z can open self_12 once the fade-in's done (100 frames)
            call_later(100, time_source_units_frames, function() { global.cutscene_lock = false; });
        }),
    ];
}

/// DEBUG: jump straight to the Flower Shop scene (rm_two, next Z opens self_12)
function scr_debug_skip_to_flowershop()
{
    global.cutscene_lock = true;
    global.dialogue_self = 11; // next Z opens self_12
    with (obj_textbox) instance_destroy();
    with (obj_cutscenefade) instance_destroy();
    scr_debug_music_reset();
    
    // start already black, go to rm_two, then fade in with everything spawned
    var _f = instance_create_depth(0, 0, -9999, obj_cutscenefade);
    _f.fade_target = 1;
    _f.fade_alpha  = 1;
    _f.target_room = rm_two;
    _f.spawn_list  = scr_flowershop_spawn_list();
}