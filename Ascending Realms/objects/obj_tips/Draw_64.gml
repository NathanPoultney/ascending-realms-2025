if(room == global.map_id.valleyofblood)
{

	// Set the draw color to white
	draw_set_color(c_white);

	// Calculate the position to draw the text centered within the modal
	var draw_x = x - (text_width / 2);

	// Ensure the text doesn't go outside the modal's boundaries
	draw_x = max(draw_x, x - (modalWidth / 2) + 10); // 10px padding from the left edge
	draw_x = min(draw_x, x + (modalWidth / 2) - text_width - 10); // 10px padding from the right edge

	// Draw the selected tip centered at the object's position
	draw_text(draw_x, y, text);
} else {
	// Set the draw color to white
	draw_set_color(c_white);

	// Calculate the position to center the text along the bottom of the window
	var draw_x = (window_get_width() / 2) - (text_width / 2);
	var draw_y = window_get_height() - 30; // Adjust this value to position it higher or lower if needed

	// Draw the text centered at the bottom of the window
	draw_text(draw_x, draw_y, text);	
}