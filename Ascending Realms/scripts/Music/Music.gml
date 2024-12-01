function StartMainMenuTheme() {
	// Check if the main menu theme is already playing
	if (!audio_is_playing(snd_mainmenu_theme)) {
	    audio_play_sound(snd_mainmenu_theme, 0, true);
		if(DEBUG_MODE == true)
		{
				show_debug_message("Started playing snd_mainmenu_theme");
		}
	}
}

function StopMainMenuTheme() {
	if(audio_is_playing(snd_mainmenu_theme))
	{
		audio_stop_sound(snd_mainmenu_theme);
		if(DEBUG_MODE == true)
		{
			show_debug_message("Stopped playing snd_mainmenu_theme");
		}
	}		
}