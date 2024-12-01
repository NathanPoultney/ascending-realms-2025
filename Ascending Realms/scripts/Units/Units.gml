// Moves the unit to a specific position with stopping condition
function move_to_position(target_x, target_y) {
    // Clamp the target position within the room boundaries
    target_x = clamp(target_x, 0, room_width);
    target_y = clamp(target_y, 0, room_height);

    // If the unit was assigned to a building, unassign it
    if (assigned_building != noone) {
        unassign_from_building();
    }

    // Set the target position and start moving
    move_target_x = target_x;
    move_target_y = target_y;
    is_moving = true;
}

// Moves the unit to a building and handles assignment with stopping condition
function move_to_building(target_building, target_x, target_y) {
    // Clamp the target position within the room boundaries
    target_x = clamp(target_x, 0, room_width);
    target_y = clamp(target_y, 0, room_height);

    // Set the target position and start moving
    move_target_x = target_x;
    move_target_y = target_y;
    is_moving = true;

    // Set the building to assign when reached
    move_target_building = target_building;
}

/// @function assign_to_building
/// @description Assigns the unit to a building and updates the building's worker list.
/// @param building
function assign_to_building(building) {
    // Check if the building instance exists
    if (instance_exists(building)) {
        // Assign the unit to the building
        assigned_building = building;

        // Update the worker's resource type based on the building
        UpdateWorkerBuildingDetails(building);

        // Set the target object for rotation around the building
        target_object = building;

        // Set the center for rotation around the building
        center_x = building.x;
        center_y = building.y;

        // Save building type and team, checking if building_team exists
        building_type = building.object_index;  // Store the building's object index
		building_name = building.building_name;
        
        if (variable_instance_exists(building, "building_team")) {
            building_team = building.building_team; // Store the building's team
        } else {
            building_team = 0;  // Default team if not defined
            show_debug_message("Warning: building_team not defined for building " + string(building.object_index));
        }

        // Add this worker to the building's worker list (create the list if it doesn't exist)
        if (!variable_instance_exists(building, "workers")) {
            building.workers = [];
        }
        array_push(building.workers, id);  // Push worker instance ID to the workers array in the building

        // Update the worker's data in the global worker_instances array
        for (var i = 0; i < array_length(global.worker_instances); i++) {
            if (global.worker_instances[i].instance == id) {
                global.worker_instances[i].assigned_building = assigned_building;  // Save building assignment
                global.worker_instances[i].resource_type = resource_type;         // Save resource type
                global.worker_instances[i].building_type = building_type;         // Save building type
                global.worker_instances[i].building_team = building_team;         // Save building team
				global.worker_instances[i].building_name = building_name;
                break;  // Exit loop once we find the matching worker
            }
        }

        // Debugging output to ensure assignment is correctly done
        show_debug_message("Worker " + string(id) + " assigned to building " + building.building_name + " with resource type: " + resource_type);
    } else {
        // Handle the case when the building instance doesn't exist
        show_debug_message("Error: Building instance does not exist.");
    }
}


/// @function unassign_from_building
/// @description Unassigns the unit from the building, allowing it to move freely.
/// @param none
function unassign_from_building() {
    if (assigned_building != noone && instance_exists(assigned_building)) {
        // Check if the building has a workers array
        if (variable_instance_exists(assigned_building, "workers")) {
            var index = -1;

            // Loop through the workers array to find this unit
            for (var i = 0; i < array_length(assigned_building.workers); i++) {
                if (assigned_building.workers[i] == id) {
                    index = i;
                    break;
                }
            }

            // If the unit was found in the workers array, remove it
            if (index != -1) {
                array_delete(assigned_building.workers, index, 1);
            }
        }

        assigned_building = noone;  // Clear the reference to the building

        // Update the worker's data in global.worker_instances
        for (var i = 0; i < array_length(global.worker_instances); i++) {
            if (global.worker_instances[i].instance == id) {
                global.worker_instances[i].assigned_building = noone;
                break;
            }
        }

        show_debug_message("Unit " + string(id) + " unassigned from building.");
    } else {
        show_debug_message("Unit is not currently assigned to any building.");
    }
}


function UpdateWorkerBuildingDetails(building) {
    if (instance_exists(building)) {
        if (building.object_index == obj_goldmine) {
            resource_type = "gold";
        } else if (building.object_index == obj_forest) {
            resource_type = "wood";
        } else if (building.object_index == obj_farm) {
            resource_type = "food";
        } else {
            resource_type = "none";
        }

        // After updating the resource type, immediately update the worker's data in the global array
        for (var i = 0; i < array_length(global.worker_instances); i++) {
            if (global.worker_instances[i].instance == id) {
                global.worker_instances[i].resource_type = resource_type;
                break;
            }
        }

        show_debug_message("Worker " + string(id) + " updated for building " + string(building) + " with resource: " + resource_type);
    } else {
        show_debug_message("Building instance does not exist for worker " + string(id));
    }
}