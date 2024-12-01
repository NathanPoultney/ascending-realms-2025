/// @description Insert description here
// You can write your code in this editor

// Initialize slider dimensions and position
is_dragging = false; // Flag to track dragging state

// DEBUG // Force a specific resolution
/*
					var configFolder = working_directory + "config\\";
					var settingsFile = configFolder + "settings.ini";
                    SetGameResolution(1024, 768);
                    global.settings.ResolutionWidth = 1024;
                    global.settings.ResolutionHeight = 768;
                    ini_open(settingsFile);
                    ini_write_string("Settings", "ResolutionWidth", string("1024"));
                    ini_write_string("Settings", "ResolutionHeight", string("768"));
                    ini_close();
					*/
					

// Initialize dropdown variables
global.dropdown_open = false; // Initially, the dropdown is not open
global.selected_resolution = string(global.settings.ResolutionWidth) + "x" + string(global.settings.ResolutionHeight); // Set a default resolution or load from saved settings

depth = global.depth.objSettingsInterface;