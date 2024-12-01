function DeserializeGameState(game_state_json) {
    var game_state = json_parse(game_state_json);

    if (game_state != undefined) {
        // Step 1: Restore player resources
        if (game_state.player != undefined) {
            global.player.gold = game_state.player.gold;
            global.player.wood = game_state.player.wood;
            global.player.food = game_state.player.food;
            global.upkeep = game_state.upkeep;
            show_debug_message("Player resources restored: Gold = " + string(global.player.gold) + ", Wood = " + string(global.player.wood) + ", Food = " + string(global.player.food));
        } else {
            show_debug_message("No player resource data found in save file.");
        }

        // Step 2: Restore game time and day/night cycle
        if (game_state.time != undefined && game_state.is_day != undefined) {
            global.time = game_state.time;
            global.is_day = game_state.is_day;
            show_debug_message("Game time and day/night cycle restored.");
        } else {
            show_debug_message("No time/day-night data found.");
        }

        // Step 3: Restore time accumulators
        if (game_state.time_accumulator != undefined && game_state.time_accumulators != undefined) {
            global.time_accumulator = game_state.time_accumulator;
            global.time_accumulators.one_second = game_state.time_accumulators.one_second;
            global.time_accumulators.clock = game_state.time_accumulators.clock;
            global.time_accumulators.save_timer = game_state.time_accumulators.save_timer;
            show_debug_message("Time accumulators restored.");
        } else {
            show_debug_message("No time accumulators data found.");
        }

        // Step 4: Restore worker instances
        var worker_data_array = game_state.worker_instances;

        if (array_length(worker_data_array) > 0) {
            global.worker_instances = [];

            for (var i = 0; i < array_length(worker_data_array); i++) {
                var worker_data = worker_data_array[i];
                show_debug_message("Recreating worker " + string(i) + ": " + json_stringify(worker_data));

                var worker_instance = instance_create_layer(worker_data.center_x, worker_data.center_y, "Unit_Instances", obj_worker);

                with (worker_instance) {
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
                        assigned_building = worker_data.assigned_building;
                        UpdateWorkerBuildingDetails(assigned_building);
                        target_object = assigned_building;
                        building_type = worker_data.building_type;
                        building_team = worker_data.building_team;
                    } else {
                        assigned_building = noone;
                        target_object = noone;
                        resource_type = "none";
                        building_type = noone;
                        building_team = noone;
                    }
                }

                array_push(global.worker_instances, {
                    x: worker_instance.x,
                    y: worker_instance.y,
                    center_x: worker_instance.center_x,
                    center_y: worker_instance.center_y,
                    radius: worker_instance.radius,
                    angle: worker_instance.angle,
                    resource_type: worker_instance.resource_type,
                    unit_name: worker_instance.unit_name,
                    creation_room: worker_instance.creation_room,
                    target_object: worker_instance.target_object,
                    assigned_building: worker_instance.assigned_building,
                    building_type: worker_instance.building_type,
                    building_team: worker_instance.building_team,
                    sprite_index: worker_instance.sprite_index,
                    instance: worker_instance
                });
            }
        } else {
            show_debug_message("No worker data found in save file.");
        }
    }
}


function LoadGame(filename) {
    if (file_exists(filename)) {
        var file = file_text_open_read(filename);
        var game_state_json = file_text_read_string(file);
        file_text_close(file);
        DeserializeGameState(game_state_json);
    } else {
        show_debug_message("Save file not found: " + filename);
    }
}