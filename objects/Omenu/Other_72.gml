/// @description Insert description here
// You can write your code in this editor
//music group load

if ds_map_find_value(async_load, "type") == "audiogroup_load"{
	if(ds_map_find_value(async_load, "group_id")== audiogroup_music){
		audio_play_sound(snd_title, 50, false);
	}
}


