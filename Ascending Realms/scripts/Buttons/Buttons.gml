/// @function CheckClick()
/// @description This function checks if a button has been clicked.
/// @returns {bool} Returns true if a button has been clicked, false otherwise.
function CheckClick() {

	// Get the sprite's bounding box
	var left = x - sprite_width/2;
	var right = x + sprite_width/2;
	var top = y - sprite_height/2;
	var bottom = y + sprite_height/2;

	// Check if the mouse is inside the bounding box and if the left mouse button is clicked
	if (mouse_x >= left && mouse_x <= right && mouse_y >= top && mouse_y <= bottom)
	{
		
		// check if left mouse button has been pressed
		if(mouse_check_button_pressed(mb_left))
		{
			// Play the click sound
            audio_play_sound(snd_click4, 1, false);
			
			if(global.debug_mode_enabled == true)
			{
				show_debug_message("-> Button Clicked! " + string(random_range(1, 10)));
			}
			return true;
		}
	}
}