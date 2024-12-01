event_inherited(); // Call the parent Create event

unit_sprite = ChooseRandomWorkerSprite();

// Assign the selected sprite to sprite_index
sprite_index = unit_sprite;

unit_type = "worker";
resource_type = "none";  // Default value

show_debug_message("unit_type for obj_worker " + string(id) + " is: " + unit_type); // Debug message to verify