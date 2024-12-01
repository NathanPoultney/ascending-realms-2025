function SerializeGameState() {
    var game_state = {};

    // Save player resources
    game_state.player = {
        gold: global.player.gold,
        wood: global.player.wood,
        food: global.player.food
    };
    
    // Save the player's upkeep
    game_state.upkeep = global.upkeep;

    // Save game time and day/night cycle
    game_state.time = global.time;
    game_state.is_day = global.is_day;

    // Save time accumulators
    game_state.time_accumulator = global.time_accumulator;
    game_state.time_accumulators = {
        one_second: global.time_accumulators.one_second,
        clock: global.time_accumulators.clock,
        save_timer: global.time_accumulators.save_timer
    };

	// Save worker instances
	game_state.worker_instances = [];
	for (var i = 0; i < array_length(global.worker_instances); i++) {
	    var worker_data = global.worker_instances[i];

	    // Check if the instance still exists before accessing its properties
	    if (instance_exists(worker_data.instance)) {
	        var set_building_type = instance_exists(worker_data.assigned_building) ? worker_data.assigned_building.object_index : noone;
	        var set_building_team = instance_exists(worker_data.assigned_building) ? worker_data.assigned_building.building_team : noone;

	        show_debug_message("Saving worker: " + string(worker_data.unit_name) + " with building_type: " + string(set_building_type) + " and building_team: " + string(set_building_team));

	        game_state.worker_instances[i] = {
	            x: worker_data.x,
	            y: worker_data.y,
	            center_x: worker_data.center_x,
	            center_y: worker_data.center_y,
	            radius: worker_data.radius,
	            angle: worker_data.angle,
	            resource_type: worker_data.resource_type,
	            unit_name: worker_data.unit_name,
	            target_object: worker_data.target_object != undefined ? worker_data.target_object : noone, 
	            assigned_building: instance_exists(worker_data.assigned_building) ? worker_data.assigned_building : noone,
	            building_type: set_building_type,
	            building_team: set_building_team,
	            creation_room: worker_data.creation_room,
	            sprite_index: worker_data.instance.sprite_index
	        };
	    }
	}

	show_debug_message("Saving worker_instances: " + json_stringify(global.worker_instances));

    return json_stringify(game_state);
}


function SaveGame(filename) {
    // Set the save in-progress flag
    global.save_in_progress = true;

    // Perform the save operation
    var game_state_json = SerializeGameState();
    var file = file_text_open_write(filename);
    file_text_write_string(file, game_state_json);
    file_text_close(file);

    // Reset the save in-progress flag
    global.save_in_progress = false;
}

function DeleteSaveGame() {
	if (file_exists("savefile.json")) {
	    file_delete("savefile.json");
	    show_debug_message("Save file deleted.");
	} else {
	    show_debug_message("No save file found to delete.");
	}
}