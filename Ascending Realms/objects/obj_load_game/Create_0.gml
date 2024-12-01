/// @description Insert description here
// You can write your code in this editor
if(global.game_started == true && room == global.map_id.valleyofblood && global.game_loaded == false && global.save_game_available == true)
{
	// Ensure layers exist before loading game state
	EnsureLayersExist();

	// Load game state from the save file
	LoadGame("savefile.json");
	show_debug_message("-> Game Loaded from savefile.json");
	
	/* we use this variable to understand that either "New Game" or "Continue Game" has been initiated
	   and therefore the match (game) is currently in progress even when in the Main Menu or Settings menu
	*/
	global.game_loaded = true;
}