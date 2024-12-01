/// @description hacky mainmenu music start up

/* this is very hacky. For whatever reason the mainmenu theme was refusing to 
   start on Room Start for the main menu. Somehow this works despite basically doing the same thing
   but in a Step event. But we have to force the loop to stop after 1 iteration to get the music playing
   otherwise we get an infinite loop of sound starting that immediately crashes the game
*/
if(room == global.room_id.main_menu || room == global.room_id.settings || room == global.room_id.credits)
{

	var check_audio = false;
	var check_audio_inc = 0;

	while(check_audio == false && check_audio_inc < 1)
	{
	    // Check if the main menu theme is already playing
	    if (audio_is_playing(snd_mainmenu_theme) == false) {
	        audio_play_sound(snd_mainmenu_theme, 0, true);
			if(DEBUG_MODE == true)
			{
				show_debug_message("-> Started playing snd_mainmenu_theme");
			}
			check_audio = true;
	    }
		check_audio_inc += 1;
	}
}