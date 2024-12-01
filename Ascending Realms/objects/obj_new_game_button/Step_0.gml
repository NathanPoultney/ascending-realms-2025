/// @description Insert description here
// You can write your code in this editor

if(CheckClick() == true)
{
	// go to the map if the game has already started
	if(global.game_started == true)
	{
		StopMainMenuTheme();
		room_goto(global.map_id.valleyofblood);	
	} else { // otherwise, show the loading screen first
		room_goto(global.map_id.valleyofblood_loadingscreen);
	}
}