function CreateBuilding(x, y, building_type) {
    var building_instance = instance_create_layer(x, y, "Building_Instances", building_type);

    with (building_instance) {
        // Assign other necessary properties
        building_name = GetBuildingName(building_type); // Set the building name based on type
        workers = []; // Initialize an array to keep track of assigned workers
    }
    
    return building_instance;
}


function GetBuildingName(building) {
    switch (building.object_index) {
        case obj_goldmine:
            return "Goldmine";
        
        case obj_forest:
            return "Forest";

        case obj_farm:
            return "Farm";

        case obj_castle:
            return "Castle";
        
        default:
            return "none";  // Default or unassigned
    }
}

// Only call this if buildings need to be dynamically recreated,
// NOT Currently used but may be useful down the track (maybe)
function RecreateStoredBuildings() {
    // Recreate building instances from stored data
    var building_types = global.building_types;
    for (var i = 0; i < array_length(building_types); i++) {
        var building_type = building_types[i];
        var count = instance_number(building_type);

        for (var j = 0; j < count; j++) {
            var building_instance = instance_find(building_type, j);
            if (building_instance != noone) {
                // Reassign workers or any other necessary properties based on building type
                with (building_instance) {
                    // Logic to reassign workers or reset properties if needed
                    workers = []; // Reinitialize worker array if necessary
                }
            }
        }
    }
}

function find_building_by_type_and_team(building_type, building_team) {
    // Check if the building_type or building_team is invalid
    if (building_type == noone || building_team == noone) {
        return noone;
    }

    // Check if building_type is in global.building_types array
    var is_valid_building_type = false;
    for (var i = 0; i < array_length(global.building_types); i++) {
        if (global.building_types[i] == building_type) {
            is_valid_building_type = true;
            break;
        }
    }

    // If building_type is not in global.building_types, return noone
    if (!is_valid_building_type) {
        return noone;
    }

    // Use building_type directly in instance_number and instance_find
    var count = instance_number(building_type);
    
    // Loop through the instances to find the one with the matching team
    for (var i = 0; i < count; i++) {
        var building_instance = instance_find(building_type, i);
        
        // Check if the building's team matches the specified team
        if (building_instance.building_team == building_team) {
            return building_instance;
        }
    }

    // If no match is found, return noone
    return noone;
}