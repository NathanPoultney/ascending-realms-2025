function CreateWorkersWithoutAssignments() {
    // Clear the existing worker instances array to avoid duplication
    //global.worker_instances = [];

    // Create unassigned workers for each building except obj_castle
    for (var i = 0; i < array_length(global.building_types); i++) {
        var building_type = global.building_types[i];
        var count = instance_number(building_type);

        for (var j = 0; j < count; j++) {
            var building_instance = instance_find(building_type, j);

            if (building_instance != noone && building_type != obj_castle) {
                // Create unassigned workers (e.g., 2 per building)
                for (var k = 0; k < 2; k++) {
                    var worker_instance = instance_create_layer(building_instance.x, building_instance.y, "Unit_Instances", obj_worker);
                    with (worker_instance) {
                        // Set worker properties
                        unit_name = GetRandomFantasyName();
                        center_x = building_instance.x;
                        center_y = building_instance.y;
                        radius = 50;
                        angle = 180 * k;
                        creation_room = room;
                        target_object = noone;
                        assigned_building = noone;
                        resource_type = "none";
                        sprite_index = ChooseRandomWorkerSprite();

                        // Add worker to global array
						var worker_data = {
						    x: x,
						    y: y,
						    center_x: center_x,
						    center_y: center_y,
						    radius: radius,
						    angle: angle,
						    unit_name: unit_name,
						    resource_type: resource_type,
						    creation_room: creation_room,
						    target_object: target_object,
						    assigned_building: assigned_building,
						    building_type: noone,  // Initialize to noone
						    building_team: noone,  // Initialize to noone
						    sprite_index: sprite_index,
						    instance: id
						};
						array_push(global.worker_instances, worker_data);
                    }
                }
            }
        }
    }
}


function CreateWorkerForBuilding(building_instance) {
    if (instance_exists(building_instance)) {
        var worker_instance = instance_create_layer(building_instance.x, building_instance.y, "Unit_Instances", obj_worker);
        with (worker_instance) {
            unit_name = GetRandomFantasyName();
            center_x = building_instance.x;
            center_y = building_instance.y;
            radius = 50;
            angle = irandom(359);
            creation_room = room;
            resource_type = "none";
            target_object = noone;
            assigned_building = noone;
            sprite_index = ChooseRandomWorkerSprite();

            // Ensure building_type and building_team are set correctly (if no building is assigned, default to noone)
            var building_type = instance_exists(building_instance) ? building_instance.object_index : noone;
            var building_team = instance_exists(building_instance) ? building_instance.building_team : noone;

            // Store worker properties in global array
            var worker_data = {
                x: x,
                y: y,
                center_x: center_x,
                center_y: center_y,
                radius: radius,
                angle: angle,
                unit_name: unit_name,
                resource_type: resource_type,
                creation_room: creation_room,
                target_object: target_object,
                assigned_building: assigned_building,
                building_type: building_type, // Save building type
                building_team: building_team, // Save building team
                sprite_index: sprite_index,
                instance: id
            };
            array_push(global.worker_instances, worker_data);
        }
    } else {
        show_debug_message("Invalid building instance provided.");
    }
}


function UpdateWorkerResources() {
    global.gold_production_rate = 0;
    global.wood_production_rate = 0;
    global.food_production_rate = 0;

    for (var i = 0; i < array_length(global.worker_instances); i++) {
        var worker_data = global.worker_instances[i];

        if (instance_exists(worker_data.instance)) {
            with (worker_data.instance) {
                // Only contribute to resources if assigned to a building
                if (assigned_building != noone) {
                    var production_rate = CalculateProductionRate(resource_type, global.is_day);
                    switch (resource_type) {
                        case "gold":
                            global.gold_production_rate += production_rate;
                            break;
                        case "wood":
                            global.wood_production_rate += production_rate;
                            break;
                        case "food":
                            global.food_production_rate += production_rate;
                            break;
                    }
                }
            }
        }
    }

    // Apply night-time reductions and upkeep
    if (!global.is_day) {
        global.gold_production_rate *= 0.8;
        global.wood_production_rate *= 0.8;
        global.food_production_rate *= 0.8;
    }

    // Calculate food consumption per unit
    if (array_length(global.worker_instances) > 0) {
        var production_ratio = 0.20;
        global.player.food_consumption_per_unit = min(global.food_production_rate * production_ratio / array_length(global.worker_instances), 0.10);
    } else {
        global.player.food_consumption_per_unit = 0;
    }

    global.player.total_food_consumption = array_length(global.worker_instances) * global.player.food_consumption_per_unit;
    global.upkeep = min(global.player.total_food_consumption / global.player.food, 0.30);

    global.player.gold += max(global.gold_production_rate - (global.gold_production_rate * global.upkeep), 0);
    global.player.wood += max(global.wood_production_rate - (global.wood_production_rate * global.upkeep), 0);
    global.player.food += max(global.food_production_rate - global.player.total_food_consumption, 0);
}


function CalculateProductionRate(resource_type, is_day) {
    // Base production rate per worker
    var base_rate = 1;

    // Apply day/night modifiers
    var production_rate = base_rate;
    if (!is_day) {
        production_rate *= 0.8; // Reduce production by 20% during the night
    }

    // Return the calculated production rate
    return production_rate;
}



// this is for ALL workers simultaneously, individually is done at obj_unit level
function DrawWorkerNames() {
    for (var i = 0; i < array_length(global.worker_instances); i++) {
        var worker_data = global.worker_instances[i];

        if (instance_exists(worker_data.instance)) {
            var worker_instance = worker_data.instance;

            if (global.showAlt == true) {
                with (worker_instance) {
                    // Draw the unit name above or next to the worker
                    draw_text_color(x + 50, y - 10, 
                        "Unit Name: " + string(unit_name), 
                        c_white, c_white, c_white, c_white, 255);

                    // Ensure the health bar is visible when ALT is pressed
                    if (variable_instance_exists(id, "unit_currenthealth") && variable_instance_exists(id, "unit_maxhealth")) {
                        bar_current = unit_currenthealth;  // Use the existing health variable for the worker
                        bar_maximum = unit_maxhealth;  // Use the existing maximum health variable for the worker
                    }
                }
            } else {
                // If ALT is not pressed, hide or reset the health bar if necessary
                with (worker_instance) {
                    if (variable_instance_exists(id, "selected") && !selected) {
                        bar_current = 0;  // Hide the health bar by setting current health to 0
                    }
                }
            }
        }
    }
}


function RecreateStoredWorkers() {
    // Destroy existing workers to avoid duplicates
    with (obj_worker) {
        instance_destroy();
    }

    // Recreate workers
    for (var i = 0; i < array_length(global.worker_instances); i++) {
        var worker_data = global.worker_instances[i];

        var new_instance = instance_create_layer(worker_data.center_x, worker_data.center_y, "Unit_Instances", obj_worker);

        with (new_instance) {
            // Restore basic properties
            x = worker_data.x;
            y = worker_data.y;
            center_x = worker_data.center_x;
            center_y = worker_data.center_y;
            radius = worker_data.radius;
            angle = worker_data.angle;
            resource_type = worker_data.resource_type != undefined ? worker_data.resource_type : "none";
            unit_name = worker_data.unit_name;
            creation_room = worker_data.creation_room;
            target_object = worker_data.target_object;

            // Restore sprite
            sprite_index = worker_data.sprite_index != undefined && worker_data.sprite_index != -1 ? worker_data.sprite_index : sprite_index;

            // Restore assigned building
            if (worker_data.assigned_building != noone && instance_exists(worker_data.assigned_building)) {
                assign_to_building(worker_data.assigned_building);
            } else {
                assigned_building = noone;
                target_object = noone;
                resource_type = "none";
            }

            // Restore building_type and building_team
            var building_type = worker_data.building_type != noone ? worker_data.building_type : noone;
            var building_team = worker_data.building_team != noone ? worker_data.building_team : noone;

            if (building_type != noone && building_team != noone) {
                var building_instance = find_building_by_type_and_team(building_type, building_team);
                if (building_instance != noone) {
                    assign_to_building(building_instance);
                }
            }

            // Update global array
            global.worker_instances[i].instance = new_instance;
        }
    }
}


function CountPlayerUnits() {
    var count = 0;
    
    // Iterate through all instances of obj_unit
    with (obj_unit) {
        if (unit_team == 1) {
            count += 1;
        }
    }
    
    return count;
}

function RecruitWorker() {
    if (global.player.food >= 100) {
        // Subtract food and recruit worker
        global.player.food -= 100;
        CreateWorkerForBuilding(global.selected_object); // Assuming global.selected_object is the castle
        AddMessage("Worker recruited for 100 food!");
    } else {
        AddMessage("Not enough food!");
    }
}


function ChooseRandomWorkerSprite() {
    // Create an array of the available worker sprites
    var worker_sprites = [spr_player_worker1, spr_player_worker2, spr_player_worker3];
    
    // Choose a random index from the array
    var random_index = irandom(array_length(worker_sprites) - 1);
    
    // Return the selected sprite
    return worker_sprites[random_index];
}