// Get the mouse position relative to the room
var mouse_pos_x = mouse_x;
var mouse_pos_y = mouse_y;

if(room == global.map_id.valleyofblood)
{

	// draw unit and building selection borders
	if (global.selected_object != noone) {
	    with (global.selected_object) {
	        // Draw border around buildings (if selected)
	        if (object_index == obj_building || object_is_ancestor(object_index, obj_building)) {
	            // Calculate the border dimensions to be just outside the building's rectangle with a 2-pixel gap
	            var rect_x1 = (x - 1) - 2;  // Move 2 pixels to the left
	            var rect_y1 = (y - 1) - 2;  // Move 2 pixels up
	            var rect_x2 = (x) + 40 + 2;  // Extend 2 pixels to the right
	            var rect_y2 = (y) + 40 + 2;  // Extend 2 pixels down

	            draw_set_color(make_colour_rgb(50, 205, 50));  // Lime green color

	            // Draw the borders
	            draw_line(rect_x1, rect_y1, rect_x2, rect_y1);
	            draw_line(rect_x1, rect_y1 + 1, rect_x2, rect_y1 + 1);
	            draw_line(rect_x1, rect_y2, rect_x2, rect_y2);
	            draw_line(rect_x1, rect_y2 - 1, rect_x2, rect_y2 - 1);
	            draw_line(rect_x1, rect_y1, rect_x1, rect_y2);
	            draw_line(rect_x1 + 1, rect_y1, rect_x1 + 1, rect_y2);
	            draw_line(rect_x2, rect_y1, rect_x2, rect_y2);
	            draw_line(rect_x2 - 1, rect_y1, rect_x2 - 1, rect_y2);
	        }

	        // Draw border around units (if selected)
	        if (object_index == obj_unit || object_is_ancestor(object_index, obj_unit)) {
	            // Calculate the outer radius for the lime green circle
	            var outer_radius = (sprite_width * image_xscale) + 4;

	            draw_set_color(make_colour_rgb(50, 205, 50));  // Lime green color

	            // Draw the outer lime green circle (border)
	            draw_circle(x - 1, y - 1, outer_radius, true);  // Draw filled circle

	            // Draw the smaller transparent circle to "cut out" the center, leaving a 2-pixel thick border
	            var inner_radius = outer_radius - 2;
	            draw_set_alpha(0);  // Set transparency to fully transparent
	            draw_circle(x - 1, y - 1, inner_radius, true);  // Draw filled circle with transparency
	            draw_set_alpha(1);  // Reset transparency
	        }
	    }
	}

	// Add hover detection and white border for hover state
	with (all) {
		if (id != global.selected_object) {  // Check if the object is not currently selected
			if (object_index == obj_unit || object_is_ancestor(object_index, obj_unit)) {
			    // Expand hover radius slightly
			    var hover_radius = (sprite_width * image_xscale) + 6;

			    if (point_distance(mouse_pos_x, mouse_pos_y, x, y) <= hover_radius) {
			        // Draw white circle for hover (same size as before)
			        var outer_radius = (sprite_width * image_xscale) + 4;

			        draw_set_color(c_white);  // White color for hover
			        draw_circle(x - 1, y - 1, outer_radius, true);

			        // Draw smaller transparent circle to create a 2-pixel thick border
			        var inner_radius = outer_radius - 2;
			        draw_set_alpha(0);
			        draw_circle(x - 1, y - 1, inner_radius, true);
			        draw_set_alpha(1);  // Reset transparency
			    }
			}

			if (object_index == obj_building || object_is_ancestor(object_index, obj_building)) {
			    // Check for hover with slightly expanded dimensions (+4 pixels for hover area)
			    if (mouse_pos_x >= (x - 4) && mouse_pos_x <= (x + 40 + 4) &&
			        mouse_pos_y >= (y - 4) && mouse_pos_y <= (y + 40 + 4)) {
			        // Draw white border (same size as before)
			        var rect_x1 = (x - 1) - 2;  
			        var rect_y1 = (y - 1) - 2;
			        var rect_x2 = (x) + 40 + 2;
			        var rect_y2 = (y) + 40 + 2;

			        draw_set_color(c_white);  // White color for hover border

			        // Draw hover border (2 pixels thick)
			        draw_line(rect_x1, rect_y1, rect_x2, rect_y1);
			        draw_line(rect_x1, rect_y1 + 1, rect_x2, rect_y1 + 1);
			        draw_line(rect_x1, rect_y2, rect_x2, rect_y2);
			        draw_line(rect_x1, rect_y2 - 1, rect_x2, rect_y2 - 1);
			        draw_line(rect_x1, rect_y1, rect_x1, rect_y2);
			        draw_line(rect_x1 + 1, rect_y1, rect_x1 + 1, rect_y2);
			        draw_line(rect_x2, rect_y1, rect_x2, rect_y2);
			        draw_line(rect_x2 - 1, rect_y1, rect_x2 - 1, rect_y2);
			    }
			}
		}
	}

}