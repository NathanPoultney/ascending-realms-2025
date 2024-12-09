// TIMEKEEPING 
/* only move time forward if the game is not paused, and we are in the correct room */

if(room == global.map_id.demo_level) {
	
	global.game_started = true;

	/* Proceed with time accumulation and game logic if not paused and game has started */
	if(global.isPaused == false && global.game_started == true)
	{
		// increment the time accumulator by the delta time in seconds
		global.time_accumulators.one_second += delta_time / 1000000; // convert microseconds to seconds
		// Update clock specific accumulator by delta time
		global.time_accumulators.clock += delta_time / 1000000;  // convert microseconds to seconds
		// update clock specific accumulator by delta time
		global.time_accumulators.save_timer += delta_time / 1000000; // convert microseconds to seconds
		// Increment the message time accumulator
		global.message_time += delta_time / 1000000;  // Convert microseconds to seconds

		// Update messages
		UpdateMessages();

		// check if at least one second has passed
		if(global.time_accumulators.one_second >= 1.0) {
			// perform actions
		
	        // Increment the elapsed time by one second
	        global.elapsed_time += 1;
		
			show_debug_message("-> One second has passed using delta time");

	        SaveGame("savefile.json");
	        show_debug_message("-> Game saved automatically.");
	
		    // Call function to update resources
			//UpdateWorkerResources();
		
			//ApplyHealthRegen();
			//ApplyManaRegen();
			//if(global.gameState == GameState.MOB_ENCOUNTER) { ApplyCombatEffectiveness(); }
	
			// Subtract one second from the accumulator
			global.time_accumulators.one_second -= 1.0;
		}
	
	    // Check if 10 seconds have passed
	    if(global.time_accumulators.save_timer >= 10.0) {
	        // Perform save action
	        //SaveGame("savefile_backup.json");
	        //show_debug_message("-> Secondary game saved automatically after 10 seconds.");
        
	        // Reset the save_timer accumulator
	        global.time_accumulators.save_timer -= 10.0;
	    }

	}
} else {
	global.isPaused = true;	
}

/// HOT KEYS -- START ///

// if F12 key has been pressed, free up the used memory and exit the game
if(keyboard_check_pressed(vk_f12))
{
	QuitGame();		
}

// if the ESC key has been pressed, return to the main menu or back to the level
if(keyboard_check_pressed(vk_escape))
{
	if(room == global.map_id.demo_level)
	{
		room_goto(global.room_id.main_menu);
	} else if(room == global.room_id.main_menu) {
		room_goto(global.map_id.demo_level);	
	}
}

/*
// Center the camera on obj_castle with building_team = TEAMS.PLAYER (1) when the Home key is pressed
if (keyboard_check_pressed(global.hotkey.center_camera_on_castle)) {
    // Find all instances of obj_castle
    var castle_instance = noone;
    with (obj_castle) {
        if (building_team == TEAMS.PLAYER) {
            castle_instance = id;
            break; // Stop searching once we find the first matching castle
        }
    }

	// If a valid castle is found, center the camera on it
	if (castle_instance != noone) {
	    // Calculate the new camera position to center on the castle
	    global.camera.cam_x = castle_instance.x - (global.camera.view_w / 2);
	    global.camera.cam_y = castle_instance.y - (global.camera.view_h / 2);

	    // Clamp the camera position to the room boundaries
	    global.camera.cam_x = clamp(global.camera.cam_x, 0, room_width - global.camera.view_w);
	    global.camera.cam_y = clamp(global.camera.cam_y, 0, room_height - global.camera.view_h);

	    // Set the camera position
	    camera_set_view_pos(view_camera[0], global.camera.cam_x, global.camera.cam_y);
		AddMessage("Centered camera on the player's Castle!");
	}

}
*/

if(room == global.map_id.demo_level)
{	
	// toggle modal
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P")) || keyboard_check_pressed(vk_pause)) {
	    if (instance_exists(obj_modal)) {
	        // Modal exists, so destroy it
	        with (obj_modal) instance_destroy();
			with(obj_tips) instance_destroy();
		
			// unpause the game
			global.isPaused = false;
	    } else {
			// Pause the game
			global.isPaused = true;

			// Create the modal instance
			var modalInstance = instance_create_layer(0, 0, "Instances", obj_modal);

			modalInstance.modalText = "Game Paused";    
			modalInstance.modalWidth = 560;
			modalInstance.modalHeight = 120;
			modalInstance.x = (window_get_width() / 2) - (modalInstance.modalWidth / 2);
			modalInstance.y = (window_get_height() / 2) - (modalInstance.modalHeight / 2);

			// Calculate the position for the tip object
			var tip_x = modalInstance.x + (modalInstance.modalWidth / 2);
			var tip_y = modalInstance.y + 90; // 90 pixels lower than the top of the modal

			// Create the tip object slightly lower than the "Game Paused" text
			var tipInstance = instance_create_layer(tip_x, tip_y, "Instances", obj_tips);

			// Pass the modal's width to the tip object
			tipInstance.modalWidth = modalInstance.modalWidth;  // Ensure this line is present and correct
			tipInstance.depth = global.depth.tipModal;
		}
	}

	// toggle alt text
	if(keyboard_check_direct(vk_alt)) {
		global.showAlt = true;	
	} else {
		global.showAlt = false;	
	}

}

/*
// recruit units
if( keyboard_check_pressed(ord(global.hotkey.recruit_worker))) {
	RecruitWorker();	
}
*/

/// HOT KEYS -- END ///

/*
// Gameplay specific
if (room == global.map_id.valleyofblood && !global.isPaused) {
    
    // LockCursorToWindow();
    UpdateCameraPanning();    
    CameraZoom();

	var mouse_handled = false; // Flag to check if the mouse click has been handled

	// First, ensure the minimap's screen position is accurately set
	var minimap_x = global.minimap.minimap_x; // X position of minimap on screen
	var minimap_y = global.minimap.minimap_y; // Y position of minimap on screen
	var minimap_size = global.minimap.minimap_size; // The size of the minimap on the screen

	// Convert mouse coordinates to GUI coordinates
	var gui_mouse_x = device_mouse_x_to_gui(0); // Assuming mouse device 0
	var gui_mouse_y = device_mouse_y_to_gui(0); // Assuming mouse device 0

	if(DEBUG_LEVEL == "ALL")
	{
		// Debugging: Confirm minimap screen position and size
		show_debug_message("Minimap Screen Position - X: " + string(minimap_x) + ", Y: " + string(minimap_y) + ", Size: " + string(minimap_size));
	}

	// Minimap click handling
	if (!mouse_handled) {
	    if (mouse_check_button_pressed(mb_left)) {
	        // Check if the mouse click is within the minimap area on the screen
	        if (gui_mouse_x >= minimap_x && gui_mouse_x <= minimap_x + minimap_size && 
	            gui_mouse_y >= minimap_y && gui_mouse_y <= minimap_y + minimap_size) {

	            // Handle minimap click logic
	            var target_x = ((gui_mouse_x - minimap_x) / minimap_size) * room_width;
	            var target_y = ((gui_mouse_y - minimap_y) / minimap_size) * room_height;

	            target_x = clamp(target_x - global.camera.view_w / 2, 0, room_width - global.camera.view_w);
	            target_y = clamp(target_y - global.camera.view_h / 2, 0, room_height - global.camera.view_h);

	            camera_set_view_pos(view_camera[0], target_x, target_y);

	            global.camera.cam_x = target_x;
	            global.camera.cam_y = target_y;
				
				if(DEBUG_LEVEL == "ALL") 
				{
					show_debug_message("Minimap Click - Target X: " + string(target_x) + " Target Y: " + string(target_y));
					show_debug_message("Camera X after move: " + string(global.camera.cam_x) + " Camera Y after move: " + string(global.camera.cam_y));
				}
			
	            mouse_handled = true; // Mark the click as handled
	        } else {
				if(DEBUG_LEVEL == "ALL")
				{
					show_debug_message("Click was outside the minimap area.");
				}
	        }
	    }
	}

	// If not handled, check for recruit square click
	if (!mouse_handled && global.is_hovering_recruit && mouse_check_button_pressed(mb_left)) {
	    RecruitWorker();
	    mouse_handled = true;
	}

	// Other mouse handling (selection, movement, etc.)
	if (!mouse_handled) {
	    // Handle left mouse click for selecting an object
	    if (mouse_check_button_pressed(mb_left)) {
	        var clicked_object = noone;

	        // First, check for obj_building at mouse position
	        with (all) {
	            if (object_is_ancestor(object_index, obj_building)) {
	                // Expand the selectable area (same as hover area)
	                var target_width = 40 + 8;  // +8 for expanding the selectable area
	                var target_height = 40 + 8; // +8 for expanding the selectable area

	                var rect_x1 = x - 4;  // Expand the area 4 pixels to the left
	                var rect_y1 = y - 4;  // Expand the area 4 pixels up
	                var rect_x2 = x + target_width - 4;  // Compensate for the left expansion
	                var rect_y2 = y + target_height - 4; // Compensate for the top expansion

	                // Check if the mouse is within the calculated bounding box
	                if (mouse_x >= rect_x1 && mouse_x <= rect_x2 && mouse_y >= rect_y1 && mouse_y <= rect_y2) {
	                    clicked_object = id;
	                    show_debug_message("Building selected: " + string(object_index));
	                    break;
	                }
	            }
	        }

	        // If no building was clicked, check for obj_unit
	        if (clicked_object == noone) {
	            with (all) {
	                if (object_is_ancestor(object_index, obj_unit)) {
	                    // Expand the selectable area for units
	                    var hover_radius = (sprite_width * image_xscale) + 6;  // Same as hover area

	                    // Check if the mouse click is within the expanded radius
	                    if (point_distance(mouse_x, mouse_y, x, y) <= hover_radius) {
	                        clicked_object = id;
	                        show_debug_message("Unit selected: " + string(object_index) + " Name: " + string(unit_name));
	                        break;
	                    }
	                }
	            }
	        }

	        // Handle new selection or move command
	        if (instance_exists(clicked_object)) {
	            global.selected_object = clicked_object;
	            show_debug_message("global.selected_object set to: " + string(global.selected_object));

	            if (object_is_ancestor(global.selected_object.object_index, obj_unit) || global.selected_object.object_index == obj_unit) {
	                // Update the health bar properties within obj_unit
	                with (global.selected_object) {
	                    if (variable_instance_exists(id, "unit_currenthealth") && variable_instance_exists(id, "unit_maxhealth")) {
	                        bar_current = unit_currenthealth;
	                        bar_maximum = unit_maxhealth;
	                    }
	                }
	            }
	        } else {
	            // Clear invalid selection
	            global.selected_object = noone;
	            show_debug_message("Invalid selection, object does not exist.");
	        }

	        mouse_handled = true; // Mark the click as handled
	    }
	}

		// Handle right mouse click for moving an object
		if (mouse_check_button_pressed(mb_right)) {
		    if (global.selected_object != noone && object_is_ancestor(global.selected_object.object_index, obj_unit)) {
		        var target_x = mouse_x;
		        var target_y = mouse_y;
		        var target_building = noone;

		        // Iterate over all obj_building instances to check if the click is within their scaled area
		        with (all) {
		            if (object_is_ancestor(object_index, obj_building)) {
		                // Calculate the bounding box based on the top-left origin
		                var target_width = 40;
		                var target_height = 40;

		                var rect_x1 = x;
		                var rect_y1 = y;
		                var rect_x2 = x + target_width;
		                var rect_y2 = y + target_height;

		                // Check if the mouse is within the calculated bounding box
		                if (mouse_x >= rect_x1 && mouse_x <= rect_x2 && mouse_y >= rect_y1 && mouse_y <= rect_y2) {
		                    target_building = id;
		                    break;
		                }
		            }
		        }

		        with (global.selected_object) {
		            if (target_building != noone) {
		                move_to_building(target_building, target_x, target_y);
		            } else {
		                move_to_position(target_x, target_y);
		            }
		        }

		        mouse_handled = true; // Mark the right-click as handled for movement
		    }
		}

}
*/