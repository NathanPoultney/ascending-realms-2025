if (!global.isPaused) {
    // Movement towards a target position if is_moving is true
    if (is_moving) {
        // Calculate the direction and distance to the target position
        var move_direction = point_direction(x, y, move_target_x, move_target_y);
        var distance = point_distance(x, y, move_target_x, move_target_y);

        // Check if the unit should keep moving towards the target
        if (distance > global.unit_speed.worker) {
            // Calculate movement components based on the global unit speed
            var move_x = lengthdir_x(global.unit_speed.worker, move_direction);
            var move_y = lengthdir_y(global.unit_speed.worker, move_direction);

            // Collision detection with obj_tile_collision
            var new_x = x + move_x;
            var new_y = y + move_y;

            // Check for collision before updating the position
            if (!place_meeting(new_x, new_y, obj_tile_collision)) {
                // No collision, so update the unit's position
                x = new_x;
                y = new_y;

                // Update the worker's position in the global array
                for (var i = 0; i < array_length(global.worker_instances); i++) {
                    if (global.worker_instances[i].instance == id) {
                        global.worker_instances[i].x = x;
                        global.worker_instances[i].y = y;
                        break;
                    }
                }
            } else {
                // Handle what happens if there's a collision (optional)
                // For example, stop movement or handle differently
                is_moving = false;  // Stop moving if collision occurs
            }
        } else {
            // Stop moving if close enough to the target
            x = move_target_x;
            y = move_target_y;
            is_moving = false;  // Stop the movement

            // Check if there is a building to assign to
            if (move_target_building != noone && instance_exists(move_target_building)) {
                assign_to_building(move_target_building);
                move_target_building = noone;  // Clear the target building after assignment
            }
        }
    } else if (assigned_building != noone && instance_exists(assigned_building)) {
        // If assigned to a building, orbit the building
        var center_x = assigned_building.x + (sprite_width * assigned_building.image_xscale) / 2;
        var center_y = assigned_building.y + (sprite_height * assigned_building.image_yscale) / 2;

        // Set the center to the building's center
        self.center_x = center_x;
        self.center_y = center_y;

        // Increment the angle for circular motion
        angle += 0.3; // Adjust the speed as needed

        // Update the worker's position for circular orbit
        x = self.center_x + cos(degtorad(angle)) * radius;
        y = self.center_y + sin(degtorad(angle)) * radius;

        // Update the worker's position and building details in the global array
        for (var i = 0; i < array_length(global.worker_instances); i++) {
            if (global.worker_instances[i].instance == id) {
                global.worker_instances[i].x = x;
                global.worker_instances[i].y = y;
                global.worker_instances[i].building_type = assigned_building.object_index;
                global.worker_instances[i].building_team = assigned_building.building_team;
                break;
            }
        }
    }
}

// Update the health bar values
bar_current = unit_currenthealth;
bar_maximum = unit_maxhealth;
