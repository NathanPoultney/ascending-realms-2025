// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Initialise(){

	show_debug_message("--- Game Initialisation in progress ---");

	// declare global variables
	Globals();
	show_debug_message("-> Global variables defined.");
	
	// Is this the release build?
	global.release_build = false;
	gml_release_mode(global.release_build);
	show_debug_message("-> Release Build: " + string(global.release_build));
	
	// debug mode
	global.debug_mode_enabled = DEBUG_MODE;
	show_debug_message("-> DEBUG MODE: " + string(global.debug_mode_enabled));
	
	// cap the FPS
	global.game_fps = 144;
	game_set_speed(global.game_fps, gamespeed_fps);
	show_debug_message("-> FPS capped at: " + string(global.game_fps));
	
	// Randomize the seed
	randomize();
	show_debug_message("-> Seed randomized");
	
	
	/*
	var sections = ["Settings", "PlayerProgress"];
	var keys = [["SoundVolume", "MusicVolume"], ["Level", "Score"]];
	*/


	var sections = ["Settings"];
	var keys = [["SoundVolume", "MusicVolume", "ResolutionWidth", "ResolutionHeight"]];

	// Define the path to the settings file in the "config" subfolder
	var configFolder = working_directory + "config\\";
	var settingsFile = configFolder + "settings.ini";

	// Create the "config" subfolder if it doesn't exist
	if (!directory_exists(configFolder)) {
	    directory_create(configFolder);
	}

	// Check if the settings file already exists
	if (!file_exists(settingsFile)) {
	    ini_open(settingsFile);
	    ini_write_string("Settings", "SoundVolume", "60");
	    ini_write_string("Settings", "MusicVolume", "40");
	    ini_write_string("Settings", "ResolutionWidth", "1024");
	    ini_write_string("Settings", "ResolutionHeight", "768");
	    ini_close();
	    show_debug_message(settingsFile + " did not already exist. Created successfully.");
	} else {
	    show_debug_message(settingsFile + " already exists. No need to create it. The contents of the file are as follows: ");
	}

	// Read from the settings file
	ini_open(settingsFile);
	var section, key, value;

	for (var i = 0; i < array_length(sections); i++) {
	    section = sections[i];

	    for (var j = 0; j < array_length(keys[i]); j++) {
	        key = keys[i][j];
	        value = ini_read_string(section, key, "Undefined");

	        show_debug_message("Section: " + section + ", Key: " + key + ", Value: " + value);
	    }
	}

	global.settings = {
	    SoundVolume: ini_read_string("Settings", "SoundVolume", "60"),
	    MusicVolume: ini_read_string("Settings", "MusicVolume", "40"),
	    ResolutionWidth: ini_read_string("Settings", "ResolutionWidth", "1024"),
	    ResolutionHeight: ini_read_string("Settings", "ResolutionHeight", "768")
	};

	// close settings file
	ini_close();

	// Load the audio groups
	audio_group_load(ag_music);
	audio_group_load(ag_sfx);
	show_debug_message("-> Audio Groups loaded.");

	// Set the volumes for the audio groups
	audio_group_set_gain(ag_music, global.settings.MusicVolume / 100, 0); // Set music volume
	audio_group_set_gain(ag_sfx, global.settings.SoundVolume / 100, 0);   // Set sound effects volume
	show_debug_message("-> Music Volume set to " + string(global.settings.MusicVolume) + "%");
	show_debug_message("-> Sound Volume set to " + string(global.settings.SoundVolume) + "%");

	// set the game resolution at start up
	SetGameResolution(global.settings.ResolutionWidth, global.settings.ResolutionHeight);
	show_debug_message("-> Resolution set to: " + string(global.settings.ResolutionWidth) + "x" + string(global.settings.ResolutionHeight));

	//DeleteSaveGame(); show_debug_message("-> Successfully deleted save game file");

	if(file_exists("savefile.json"))
	{
		global.new_game = false;
		global.save_game_available = true;
		show_debug_message("-> Save Game found.");
	} else {
		show_debug_message("-> No Save Game found.");	
	}
	
	// initialisation is complete, go to the Main Menu
	show_debug_message("-> Initialisation complete. Going to the Main Menu now.");	
	room_goto(global.room_id.main_menu);
}