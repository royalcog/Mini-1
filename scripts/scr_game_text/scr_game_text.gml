// scr_text_shake(23, 28); -> Shake the letters between (and indcluding) x and y
// scr_text_color(23, 28, color, color, color, color); -> Turn the letters between (and indcluding) x and y different colors
// scr_text_face_spr(LEFT, spr_noelle_left_happy); -> Turning a sprite a direction (4-directional only)
// scr_obj_spawn_after_textbox(obj_desscircle, 680, 215, "Instances"); -> Spawning an object after the full textbox is done
// scr_obj_sprite_after_textbox(obj_dess, spr_dess_intro_body, false, snd_appear, 0.7); -> Sprite animation after textbox is done
// scr_obj_sprite_after_textbox_delayed(obj_dess, spr_dess_drool, true, 60); -> Same as above, but with a delay
// scr_text_speaker_shake(.5, 1); -> Shake the speaker during the line of text
// scr_text_cutoff_slow(11, 11, 0.1); -> Slows down the text, and cuts it off at letter x

/// @param text_id
function scr_game_text(_text_id)
{
	switch (_text_id)
	{
		case "self_1":
			scr_text("* I think...", "asgore", 21);
			scr_text("* I think I need to take a short break from this.", "asgore", 12);
			scr_text("* Sure, buddy.", "flowery", 0);
			scr_text("* Take all the time you need.", "flowery", 11);
				scr_text_voice_clip(snd_flowery_myking);
			scr_text("* ...", "asgore", 13);
				scr_obj_sprite_on_page(obj_asgore, spr_asgore_armor_walk_left_look_down, false);
		break;
		
		case "self_2":
			scr_text("* What's on your mind, Gorey?", "flowery", 19);
				scr_obj_sprite_on_page(obj_flowery, spr_flowery_sad_down_left, false);
			scr_text("* Nothing much, Flowery.", "asgore", 11);
			scr_text("* I'm just...", "asgore", 22);
			scr_text("* Remembering what happened.", "asgore", 46);
			scr_text("* ...", "asgore", 47);
		break;
		
		case "self_3":
			scr_text("* I pushed everyone away.", "asgore", 20);
				scr_obj_sprite_on_page(obj_asgore, spr_asgore_armor_walk_up, false);
			scr_text("* Toriel, the Holidays...", "asgore", 36);
			scr_text("* It's all mostly been a blur, but...", "asgore", 48);
				scr_obj_sprite_on_page(obj_asgore, spr_asgore_armor_up_expressions, false, 3);
			scr_text("* ...", "asgore", 13);
				scr_obj_sprite_on_page(obj_asgore, spr_asgore_armor_up_expressions, false, 2);
			scr_text("* ...", "flowery", 29);
				scr_obj_sprite_on_page(obj_asgore, spr_asgore_armor_walk_up, false);
			scr_text("* I'm here for you, Asgore.", "flowery", 18);
				scr_obj_sprite_on_page(obj_flowery, spr_flowery_walk_down_left, false);
			scr_text("* Talk to me.", "flowery", 17);
				scr_text_voice_clip(snd_flowery_leafittome);
			scr_text("* ...", "asgore", 47);
		break;
		
		case "self_4":
			scr_flashback_dark(true);   // fade to black + no portraits from here on
			scr_text("* After... that day...", "asgore", 47);
			scr_text("* There was another incident.", "asgore", 46);
			scr_text("* More driven \"craziness\", as they called it.", "asgore", 22);
			scr_text("* I was... sitting at home, one night.", "asgore", 13);
			scr_text("* The Holidays were over, and the kids were all asleep.", "asgore", 9);
		break;
		
		case "self_5":
			scr_flashback_dark(false, 0.02, rm_one);
		break;
		
		case "self_6":
			scr_text("* Asgore, we're getting worried about you.", "rudy", 4);
			scr_text("* This is... all you do.", "rudy", 9);
			scr_text("* The flower shop is growing vines on it, buddy.", "rudy", 7);
			scr_text("* ...", "asgorepol", 4);
			scr_text("* Don't you all see?", "asgorepol", 24);
			scr_text("* These fountains aren't just a means of transportation.", "asgorepol", 23);
			scr_text("* You can talk to inanimate objects! Speak with people from the dead!", "asgorepol", 30);
			scr_text("* This isn't some... conspiracy.", "asgorepol", 19);
			scr_text("* Why is it so hard for all of you to just...", "asgorepol", 16);
			scr_text("* BELIEVE me???", "asgorepol", 0);
			scr_text("* Asgore, I think you have had a little too much to drink.", "toriel", 15);
			scr_text("* Tori, please.", "asgorepol", 24);
			scr_text("* This is real.|* I know it is.", "asgorepol", 22);
			scr_text("* Isn't there...", "asgorepol", 18);
			scr_text("* Shouldn't there be trust in a marriage!?", "asgorepol", 3);
			scr_text("* Asgore, this craziness is not part of the man I married.", "toriel", 6);
			scr_text("* I've forgiven you for many things before, but this?", "toriel", 7);
			scr_text("* You don't spend any time with me or the children anymore.", "toriel", 12);
			scr_text("* You barely leave this house,", "toriel", 6);
			scr_text("* and when you do it's to wander towards that bunker at the bottom of town.", "toriel", 7);
			scr_text("* The only phone calls you make are to Officer Undyne these days...", "toriel", 15);
			scr_text("* ...", "carol", 8);
			scr_text("* Carol, was there something you would like to say?", "toriel", 9);
			scr_text("* He's been calling me too.", "carol", 3);
			scr_text("* To talk about... all of this.", "carol", 9);
			scr_text("* ...", "toriel", 3);
			scr_text("* Tori, I can explain", "asgorepol", 16);
				scr_text_cutoff_skip(21);
			scr_text("* Do not \"Tori\" me, Asgore.", "toriel", 14);
			scr_text("* Undyne is one thing, but Carol too?", "toriel", 6);
			scr_text("* It was only once or twice... I had some mayoral questions I needed to", "asgorepol", 8);
				scr_text_cutoff_skip(71);
			scr_text("* Enough with the excuses.", "toriel", 3);
			scr_text("* Just... tell me the truth.", "toriel", 10);
			scr_text("* Is it... me?", "toriel", 12);
			scr_text("* No, no. This is nothing of that sort, Toriel.", "asgorepol", 17);
			scr_text("* This is real, solid proof I've been collecting.", "asgorepol", 23);
			scr_text("* Trust me, when this comes into the light...", "asgorepol", 31);
			scr_text("* It will open up so many areas of study.|* Of research.", "asgorepol", 30);
			scr_text("* Don't you want that?", "asgorepol", 24);
			scr_text("* You're a teacher, you should...", "asgorepol", 22);
			scr_text("* I think it's getting a bit late.", "rudy", 3);
			scr_text("* Carol, do you wanna...", "rudy", 4);
			scr_text("* Yes.", "carol", 6);
		break;
		
		// (Rudy and Carol get up, but Carol stops at the door after Asgore leaves)
		case "self_7":
			scr_text("* One more thing.", "carol", 0);
			scr_text("* Next time you call me, Asgore.", "carol", 1);
			scr_text("* Hang up the phone afterwards.", "carol", 9);
			scr_text("* ...", "asgorepol", 15);
		break;
		
		// (Carol leaves)
		case "self_8":
			scr_text("* ...", "toriel", 3);
			scr_text("* Asgore...?", "toriel", 12);
			scr_text("* It was nothing, I was just...", "asgorepol", 8);
			scr_text("* ...", "asgorepol", 21);
			scr_text("* It was nothing. Really.", "asgorepol", 19);
			scr_text("* ...", "toriel", 10);
			scr_text("* How can I trust you?", "toriel", 12);
			scr_text("* ...", "asgorepol", 6);
			scr_text("* Toriel, if you just let me explain all of this to you...", "asgorepol", 16);
			scr_text("* You've tried, Asgore. So many times.", "toriel", 10);
			scr_text("* But this all just sounds like some...", "toriel", 15);
			scr_text("* ...conspiratory garba", "toriel", 6);
				scr_text_cutoff_skip(23);
			scr_text("* This is NOT conspiratory! This is NOT garbage!", "asgorepol", 25);
			scr_text("* This is real, damn it!", "asgorepol", 10);
			scr_text("* I've. Seen. The fountains!", "asgorepol", 12);
			scr_text("* One was in my own SHOP, for crying out loud!", "asgorepol", 25);
			scr_text("* And I made it! It wasn't even that hard to make!", "asgorepol", 9);
			scr_text("* Asgore, you're spiraling again.", "toriel", 9);
			scr_text("* If you really made it, then...", "toriel", 15);
			scr_text("* Recreate it.", "toriel", 6);
			scr_text("* ...", "asgorepol", 26);
			scr_text("* ...What?", "asgorepol", 32);
			scr_text("* Make another \"fountain\".", "toriel", 7);
			scr_text("* Right here, right now.", "toriel", 6);
			scr_text("* In...", "asgorepol", 22);
			scr_text("* In the house?", "asgorepol", 26);
			scr_text("* In the house.", "toriel", 3);
			scr_text("* ...", "asgorepol", 4);
			scr_text("* It's too dangerous...", "asgorepol", 18);
			scr_text("* ...especially with the kids in the house.", "asgorepol", 21);
			scr_text("* If you want me to believe you, do it.", "toriel", 6);
			scr_text("* I...", "asgorepol", 19);
			scr_text("* I'm not going to compromise our safety just for proof, Toriel.", "asgorepol", 14);
			scr_text("* But you still need to believe me.", "asgorepol", 24);
			scr_text("* If you come to the Flower Shop, I can", "asgorepol", 23);
				scr_text_cutoff_skip(39);
			scr_text("* Asgore.", "toriel", 3);
			scr_text("* This is...", "toriel", 12);
			scr_text("* ...", "toriel", 10);
			scr_text("* Why are you doing this?", "toriel", 12);
			scr_text("* It's...", "asgorepol", 20);
				// (Asgore turns away)
			scr_text("* I...", "asgorepol", 6);
			scr_text("* You what?", "toriel", 9);
			scr_text("* I'll... write it down.", "asgorepol", 6);
			scr_text("* I'd prefer not to... say it out loud.", "asgorepol", 5);
		break;
		
		// (Asgore writes it down, and Toriel walks over to look at it)
		case "self_9":
			scr_text("* ...", "toriel", 3);
			scr_text("* !", "toriel", 13);
			scr_text("* A-Asgore...", "toriel", 8);
			scr_text("* This can't be...", "toriel", 8);
			scr_text("* You...", "toriel", 12);
			scr_text("* You wanted the truth?", "asgorepol", 27);
			scr_text("* I told you... I'm ashamed of what happened.", "asgorepol", 28);
			scr_text("* But that's why I need to prove these fountains!", "asgorepol", 3);
			scr_text("* I need to show everyone that these things are evil.", "asgorepol", 11);
			scr_text("* I...", "asgorepol", 29);
			scr_text("* Asgore.", "toriel", 10);
			scr_text("* ...", "asgorepol", 6);
			scr_text("* You should get some rest.", "toriel", 11);
			scr_text("* You...", "asgorepol", 33);
			scr_text("* You STILL don't believe me?", "asgorepol", 1);
			scr_text("* I think you've been working a little too hard lately.", "toriel", 11);
			scr_text("* You need a mental refresh.", "toriel", 4);
			scr_text("* ...", "asgorepol", 15);
		break;
		
		// (Asgore runs out of the house)
		case "self_10":
			scr_text("* Asgore!", "toriel", 13);
			// (the screen fades out)
		break;
/*

*/


		/*array_push(obj_cutscenehandler_midfightattacks.after_textbox_queue, {
			type: "tenna_battle_intro"
			});*/
				
	
		/* Warp Code:
		if (instance_exists(obj_cutscenehandler_midfightattacks))
			    {
			        obj_cutscenehandler_midfightattacks.waiting_for_warp = true;
			    }
		*/
		
		/* Pitching Music:
			global.song = { sound: sng_?, bpm: ?, beats: ? };
			global.music = audio_play_sound(sng_?, 1, true);
			audio_sound_pitch(global.music, 0.7);
			global.song_start = current_time;
		*/
		/* Summoning UI (Not in battle):
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    audio_stop_all();
		    global.song = { sound: sng_cmmm, bpm: 130, beats: 9999 };
			global.music = audio_play_sound(sng_cmmm, 1, true);
			audio_sound_pitch(global.music, 1.25);
			global.song_start = current_time;
		*/
		
		/* Movement Queue:
			scr_queue_movement_group_after_textbox([
				   { obj: obj_gerson, sprite: spr_gerson_hammer_walkright_lantern, loop: true, dx: 15, dy: 3, speed: .2, duration: 75 },
				   { obj: obj_mewmew, sprite: spr_ghost_shocked_left, loop: false, dx: 0, dy: -10, speed: .2, duration: 75 }
			]);
		*/
		
		// Battle Example:
		/* case "self_18":
			if (instance_exists(obj_UI))
			{
			    instance_destroy(obj_UI);
			}
			instance_create_depth(0, 0, -5000, obj_UI);
		    obj_UI.sprite_index = spr_UI_Pink;
			obj_mewmew.sprite_index = spr_ghost_shocked_left;
		    var pink = obj_mewmew;
		    var _seq = instance_create_depth(0, 0, 0, obj_fight_sequencer);
		    _seq.sequence = [
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "Hey! Hey!!! HEY!!!"} ] },
				{ type: "talk", batch: [ { speaker: pink, text: "GERSON!!! I'M ON YOUR SIDE!!!" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHAT'S GOING ON???" } ] },
		        { type: "attack", attacker: obj_sound_of_justice, data: global.atk_sound_of_justice_hammers },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
		        { type: "talk", batch: [ { speaker: pink, text: "DIDN'T WE PLAN TO DO THIS???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "WHY ARE YOU ATTACKING ME???" } ] },
		        { type: "attack", kind: "custom", start_func: scr_start_giant_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "talk", batch: [ { speaker: pink, text: "You know I can't take damage... right???" } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So... quit it!!!" } ] },
				{ type: "attack", kind: "custom", start_func: scr_start_falling_hammer_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "We need to... find my body..." } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_yelling_right },
				{ type: "talk", batch: [ { speaker: pink, text: "Damn it, Gerson, don't you double-cross me too!!!" } ] },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_shocked_left },
				{ type: "attack", kind: "custom", start_func: scr_start_gavel_slam_attack },
				{
			        type: "ui_sequence",
			        steps: [
			            { sprite: spr_UI_Pink, delay: 30 },
			            { sprite: spr_UI_Pink_Defend, snd: snd_select_reverb, delay: 30 },
			        ]
			    },
				{ type: "sprite", target: obj_mewmew, new_sprite: spr_ghost_wistful },
				{ type: "talk", batch: [ { speaker: pink, text: "Come on, Gerson. I don't want to fight you." } ] },
				{ type: "talk", batch: [ { speaker: pink, text: "So stop fighting me..." } ] },
		        // add more talk/attack pairs as you write more dialogue/attacks
		    ];		
		break;
		
		case "self_19":
			scr_ui_reverse(sng_empty);
			audio_stop_all();
			scr_text("* Please...", "mewmewghost");
				scr_portrait_on_page(spr_pinkghost_scared);
	        scr_portrait_tail_off();
	        scr_snd_after_textbox(snd_sojlaugh, 1);
	        scr_obj_sprite_after_textbox(obj_sound_of_justice, spr_sound_of_justice_laugh, true);
	        scr_custom_call_after_textbox_delayed(scr_spawn_soj_hit_hammer, 113); // mid-laugh hammer hit
			scr_obj_sprite_after_textbox_delayed(obj_mewmew, spr_ghost_shocked_left, false, 120);
	        scr_custom_call_after_textbox_delayed(scr_start_pan_and_reveal_left, 150); // shortly after the hit
		break;
	*/
	}
}