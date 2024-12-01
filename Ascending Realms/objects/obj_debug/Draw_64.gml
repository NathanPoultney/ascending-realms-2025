 if(global.debug_mode_enabled == true)
{
	
	x = window_get_width() - 150 - margin;
	y = window_get_height() - 25 - margin;

	
	/*
	// miscellaneous debug
	if(room == global.room_id.worldmap)
	{
		var _inst_id = instance_find(obj_worker, 0);
		draw_text_color(_inst_id.x + 50, _inst_id.y, ("Unit Name: " + string(_inst_id.unit_name)), c_white, c_white, c_white, c_white, 255);
	}
	*/
	
	// draw version, target FPS, and current FPS
	draw_text_color(x, y - 30, VERSION, c_white, c_white, c_white, c_white, 255);
	draw_text_color(x, y - 15, "Set FPS: " + string(game_get_speed(gamespeed_fps)), c_white, c_white, c_white, c_white, 255);
	draw_text_color(x, y, "Current FPS: " + string(fps), c_white, c_white, c_white, c_white, 255);
	
	/*
	if(room == global.map_id.valleyofblood)
	{
		// draw unit and building selection borders
		if (global.selected_object != noone) {
		    with (global.selected_object) {
		        // Draw border around buildings
		        if (object_index == obj_building || object_is_ancestor(object_index, obj_building)) {
		            // Calculate the border dimensions to be just outside the building's rectangle with a 2-pixel gap
		            var rect_x1 = (x - 1) - 2;  // Move 2 pixels to the left
		            var rect_y1 = (y - 1) - 2;  // Move 2 pixels up
		            var rect_x2 = (x) + 40 + 3;  // Extend 2 pixels to the right
		            var rect_y2 = (y) + 40 + 3;  // Extend 2 pixels down

		            draw_set_color(make_colour_rgb(50, 205, 50));  // Lime green color

					// Draw the top border (draw two lines to make it 2 pixels thick)
					draw_line(rect_x1, rect_y1, rect_x2, rect_y1);
					draw_line(rect_x1, rect_y1 + 1, rect_x2, rect_y1 + 1);

					// Draw the bottom border (draw two lines to make it 2 pixels thick)
					draw_line(rect_x1, rect_y2, rect_x2, rect_y2);
					draw_line(rect_x1, rect_y2 - 1, rect_x2, rect_y2 - 1);

					// Draw the left border (draw two lines to make it 2 pixels thick)
					draw_line(rect_x1, rect_y1, rect_x1, rect_y2);
					draw_line(rect_x1 + 1, rect_y1, rect_x1 + 1, rect_y2);

					// Draw the right border (draw two lines to make it 2 pixels thick)
					draw_line(rect_x2, rect_y1, rect_x2, rect_y2);
					draw_line(rect_x2 - 1, rect_y1, rect_x2 - 1, rect_y2);
		        }

				// Draw border around units
				if (object_index == obj_unit || object_is_ancestor(object_index, obj_unit)) {
					draw_text(300, 300, "UNIT NAME: " + string(obj_unit.unit_name));
				}
		    }
		}
	} */
	
}