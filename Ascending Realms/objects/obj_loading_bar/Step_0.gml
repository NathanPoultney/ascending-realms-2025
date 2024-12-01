// Increment the elapsed time by the delta time
elapsedTime += delta_time / 1000000; // Assuming delta_time is in microseconds

// Calculate the new current value based on the elapsed time
current = (elapsedTime / duration) * maximum;

// Ensure current does not exceed maximum
if (current > maximum) {
    current = maximum;
    loadingComplete = true; // Set the flag to true when loading is complete
}

if (loadingComplete && (keyboard_check_pressed(vk_anykey) || mouse_check_button_released(mb_left))) {
        // A key was pressed, continue to the next state
		switch(room)
		{
			case global.map_id.valleyofblood_loadingscreen:
				global.game_started = true;
				room_goto(global.map_id.valleyofblood);
			break;
		}
    show_debug_message("-> Continuing to the next part of the game...");
}