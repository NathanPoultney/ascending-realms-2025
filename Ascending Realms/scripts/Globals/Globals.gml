/// @description Global vars and constants (macros)
function Globals() {
	
	/// CORE CONFIG ///
	
	#macro DEBUG_MODE true
	#macro DEBUG_LEVEL "STANDARD" // values either "ALL" or "STANDARD"
	#macro RELEASE_MODE false
	#macro VERSION "Alpha v0.0.5"
	
	gml_release_mode(RELEASE_MODE);
	
	global.config = {
		game_name: "Ascending Realms",
		game_website: "www.5yearsnow.com",
		game_developer: "5 Years Now",
		game_discord: "https://discord.gg/URsQvAdYRN"
	};
	
	/// SETTINGS ///

	// enable or disable certain features, particularly if they're experimental or broken
	global.features = {
		enable_resolutions: true // enable/disable resolution selection in Settings
	};
	
	global.available_resolutions = {
			xga: "1024x768", // default
			hd_ready: "1280x720",
			steam_deck: "1280x800",
			full_hd: "1920x1080",
			quad_hd: "2560x1440",
			uhd: "3840x2160"
	};	
	
	global.game_speed = game_get_speed(gamespeed_fps);

	
	/// ROOMS ///

	global.room_id = {
		main_menu: asset_get_index("room_MainMenu"),
		credits: asset_get_index("room_Credits"),
		settings: asset_get_index("room_Settings"),
		skirmish_level: asset_get_index("room_SkirmishLevel"),
		worldmap: asset_get_index("room_WorldMap")
	};		

	global.map_id = {
		valleyofblood: asset_get_index("map_valleyofblood"),
		valleyofblood_loadingscreen: asset_get_index("map_valleyofblood_intro"),
		demo_level: asset_get_index("map_demolevel")
	};


	/// MEASUREMENTS ///

	global.default_measurements = {
		room_horizontal_width: window_get_width(),
		room_vertical_height: window_get_height()
	};
	
	global.measurements = {
		room_center_vertical: global.default_measurements.room_vertical_height / 2,
		room_center_horizontal: global.default_measurements.room_horizontal_width / 2
	};

	
	/// CAMERA ///

	global.camera = {
	    cam_x: 0,
	    cam_y: 0,
	    view_w: camera_get_view_width(view_camera[0]),
	    view_h: camera_get_view_height(view_camera[0])
	};	
	
	/// TIMEKEEPING ///
	
	global.time_accumulators = {
		one_second: 0,
		clock: 0,
		save_timer: 0 
	}
	
	global.time_accumulator = 0;
	global.elapsed_time = 0;
	global.message_time = 0;  // Initialize a separate time accumulator for messages
	global.time = 0;
	global.is_day = 1;
	// Total cycle duration for a full cycle (day + night = 240 seconds)
	global.cycle_duration = 240;
	
	// day/night are 2 minutes each
	global.cycle_duration_each = (global.cycle_duration / 2 / 60);

	global.isPaused = false;
	global.showModal = false;
	global.showAlt = false;
	global.new_game = true;
	global.game_started = false;
	global.save_in_progress = false;
	global.game_loaded = false;
	global.save_game_available = false;
	global.isWaitingForKeyPress = true;
	global.current_zoom = 1.0; // Start at 100% zoom
	global.dropdown_open = false;
	global.selected_object = noone; // Initially, no object is selected
	global.messages = []; // An empty array to store messages
	global.hud_text = "";
	
	// HUD buttons
	global.is_hovering_recruit = false;
	
	/// TIPS ///

	global.tips = [
	    "Holding ALT while playing shows additional information.",
	    "Game progress is automatically saved while you play.",
	    "The music volume can be adjusted in the settings menu.",
	    "Day/Night last for " + string(global.cycle_duration_each) + " minutes each."
	];	

	GlobalsGameplay()

	// Set Default Font
	draw_set_font(fnt_Verdana);

}