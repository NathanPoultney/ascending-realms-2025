// @description free up the used memory
function CleanUp() {
    // Clear array contents by resetting them
	//e.g., global.classCards = [];
	audio_group_unload(ag_music);
	audio_group_unload(ag_sfx)
	show_debug_message("-> Audio Groups unloaded.");
	
	layer_destroy_instances("Instances");
	show_debug_message("-> \"Instances\" Layer destroyed.");
	
    // Additional cleanup if any other global resources or singletons need to be reset
	show_debug_message("-> Clean up successful. Gracefully exiting the game.");
	return;
}

// @description free memory and close the game
function QuitGame() {
	
	// if saving is in progress, wait until it's done before closing the game
	while(global.save_in_progress == true)
	{
		show_debug_message("-> Saving in progress. Can't close game.");
		if(global.save_in_progress == false) { show_debug_message("-> Game Saved. Can close the game now."); break; };
	}
	CleanUp();
	game_end();

}