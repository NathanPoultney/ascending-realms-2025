// Get the mouse position relative to the GUI
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// Draw the gray background rectangle across the entire width of the window
var rect_height = global.hud_bot.height;
var rect_x1 = 0;  // Start at the left edge of the window
var rect_x2 = window_get_width();  // Extend to the right edge of the window
var rect_y1 = window_get_height() - rect_height;
var rect_y2 = rect_y1 + rect_height;

draw_set_color(make_colour_rgb(30, 34, 38)); // Gray color
draw_rectangle(rect_x1, rect_y1, rect_x2, rect_y2, false);

// Draw border
var border_size = 5;
draw_set_color(make_colour_rgb(149, 132, 87));
draw_rectangle(rect_x1, rect_y1 - border_size, window_get_width(), rect_y1, false);

// Draw the information text just above the bottom HUD and centered horizontally
var text_x = (window_get_width() / 2) - 100;
var text_y = rect_y1 - 24;
draw_set_color(c_white);
draw_text(text_x, text_y, global.hud_text);

// Calculate the width of each column
var column1_6_width = (rect_x2 - rect_x1) * 0.25; // 25% width for columns 1 and 6
var column2_5_width = (rect_x2 - rect_x1) * 0.125; // 12.5% width for columns 2, 3, 4, and 5
var padding = 10;
text_y = rect_y1 + padding; // Adjust 'padding' to position the text vertically

// First column (leftmost)
var col1_x = rect_x1 + padding;

// Second column (previously col3)
var col2_x = col1_x + column1_6_width + padding;

// Third column (previously col4)
var col3_x = col2_x + column2_5_width + padding;

// Fourth column (previously col5)
var col4_x = col3_x + column2_5_width + padding;

// Fifth column (previously col6)
var col5_x = col4_x + column2_5_width + padding;

// Sixth column (remains the same)
var col6_x = col5_x + column2_5_width + padding;

// MINIMAP //

/*
// Adjusted minimap size and position
global.minimap.minimap_x = col1_x;
global.minimap.minimap_y = text_y;

// Set the color to white for the sprite drawing
draw_set_color(c_white);

// Calculate the scale factor for the minimap
var scale_x = global.minimap.minimap_size / room_width;
var scale_y = global.minimap.minimap_size / room_height;

// Draw the tileset as simplified colored rectangles on the minimap
var tilemap_id = layer_tilemap_get_id("Tiles_Medieval");  // Replace with your tileset layer name
var tile_width = tilemap_get_tile_width(tilemap_id);
var tile_height = tilemap_get_tile_height(tilemap_id);

// Loop through the tiles and draw them on the minimap
for (var tx = 0; tx < room_width; tx += tile_width) {
    for (var ty = 0; ty < room_height; ty += tile_height) {
        var tile_id = tilemap_get_at_pixel(tilemap_id, tx, ty);
        if (tile_id > 0) {  // If there's a tile at this position
            var tile_x = global.minimap.minimap_x + (tx * scale_x);
            var tile_y = global.minimap.minimap_y + (ty * scale_y);

            // Set a color based on the tile ID (you can customize this to reflect different tiles)
            var tile_color = get_tile_color(tile_id);
            draw_set_color(tile_color);

            // Draw a rectangle for the tile, scaled to fit the minimap
            draw_rectangle(tile_x, tile_y, tile_x + (tile_width * scale_x), tile_y + (tile_height * scale_y), false);
        }
    }
}

// Draw the grey border around the minimap
var minimap_border_col = make_colour_rgb(105, 105, 105); // Darker grey color for the border
draw_set_color(minimap_border_col);
draw_rectangle(global.minimap.minimap_x, global.minimap.minimap_y, global.minimap.minimap_x + global.minimap.minimap_size + 4, global.minimap.minimap_y + global.minimap.minimap_size + 4, true);

// Define colors
var unit_colour = make_colour_rgb(0, 255, 100);  // Lighter green for units
var building_colour = make_colour_rgb(0, 150, 50);  // Darker green for buildings

// Draw the units and buildings on the minimap
with (obj_unit) {
    var minimap_unit_x = global.minimap.minimap_x + (x / room_width) * global.minimap.minimap_size;
    var minimap_unit_y = global.minimap.minimap_y + (y / room_height) * global.minimap.minimap_size;

    draw_set_color(unit_colour);
    draw_circle(minimap_unit_x, minimap_unit_y, global.minimap.obj_unit_scaling, false); // Green circle for units
}

with (obj_building) {
    var minimap_building_x = global.minimap.minimap_x + (x / room_width) * global.minimap.minimap_size;
    var minimap_building_y = global.minimap.minimap_y + (y / room_height) * global.minimap.minimap_size;

    draw_set_color(building_colour);
    draw_rectangle(minimap_building_x - global.minimap.obj_building_scaling, minimap_building_y - global.minimap.obj_building_scaling, 
                   minimap_building_x + global.minimap.obj_building_scaling, minimap_building_y + global.minimap.obj_building_scaling, false); // Green square for buildings
}

// Calculate the camera's position and size in the room using global variables
var cam_x = global.camera.cam_x;
var cam_y = global.camera.cam_y;
var cam_w = global.camera.view_w;
var cam_h = global.camera.view_h;

// Scale the camera's position and size to fit within the minimap
var minimap_cam_x = global.minimap.minimap_x + (cam_x / room_width) * global.minimap.minimap_size;
var minimap_cam_y = global.minimap.minimap_y + (cam_y / room_height) * global.minimap.minimap_size;
var minimap_cam_w = (cam_w / room_width) * global.minimap.minimap_size + 5;
var minimap_cam_h = (cam_h / room_height) * global.minimap.minimap_size + 5;

// Draw a white rectangle representing the camera's view on the minimap
draw_set_color(c_white);
draw_rectangle(minimap_cam_x, minimap_cam_y, 
               minimap_cam_x + minimap_cam_w, minimap_cam_y + minimap_cam_h, true);

// END MINIMAP //

*/

// Draw the grey border square in the second column (moved from col3 to col2)
var square_size = global.hud_bot.object_display_square_size;
var border_col = make_colour_rgb(211, 168, 98); // gold colour for the border
var bg_col = make_colour_rgb(0, 0, 0); // Black for the background

// Draw the background (filled rectangle)
draw_set_color(bg_col);
draw_rectangle(col2_x, text_y, col2_x + square_size, text_y + square_size, false);

// Draw the border (non-filled rectangle)
draw_set_color(border_col);
draw_rectangle(col2_x, text_y, col2_x + square_size, text_y + square_size, true);

/*
// Check if a unit or building is selected
if (instance_exists(global.selected_object)) {
    var square_center_x = col2_x + square_size / 2;
    var square_center_y = text_y + square_size / 2;

    if (object_is_ancestor(global.selected_object.object_index, obj_unit)) {
        // Draw the selected unit's sprite centered in the square
        var unit_size = 1;

        draw_sprite_ext(global.selected_object.sprite_index, global.selected_object.image_index,
            square_center_x, 
            square_center_y, 
            unit_size, unit_size, 0, global.selected_object.image_blend, 1);

        // Update the third column with unit details (was fourth column)
        draw_set_color(c_white);
        draw_text(floor(col3_x), floor(text_y), 
            CapitalizeFirstChar(string(global.selected_object.unit_type)));
        
        draw_text(floor(col3_x), floor(text_y) + 20,
            "Health: " + string(global.selected_object.unit_currenthealth) + "/" + string(global.selected_object.unit_maxhealth));

        // Calculate the center position for the text within column 2
        var text_width = string_width(string(global.selected_object.unit_name));
        text_x = col2_x + (square_size / 2) - (text_width / 2); // Center the text within the square

        // Draw the unit's name centered horizontally within column 2
        draw_set_color(c_white);
        draw_text(floor(text_x), floor(text_y + square_size + 5), string(global.selected_object.unit_name));
        
    } else if (object_is_ancestor(global.selected_object.object_index, obj_building)) {
        // Count how many workers are assigned to the selected building
        var assigned_worker_count = 0;
        with (obj_worker) {
            if (assigned_building == global.selected_object) {
                assigned_worker_count += 1;
            }
        }
        
		// Check if a castle is selected
		if (global.selected_object.building_type == "castle") {
		    // Calculate the position for the new square in column 3
		    var recruit_square_size = 50;
		    var recruit_square_x = col3_x;
		    var recruit_square_y = text_y + 50; // Moved down 50 pixels below the building name text

		    // Draw the black background for the recruit square
		    draw_set_color(c_black);
		    draw_rectangle(recruit_square_x, recruit_square_y, recruit_square_x + recruit_square_size, recruit_square_y + recruit_square_size, false);

		    // Draw the gold border for the recruit square
		    draw_set_color(border_col);
		    draw_rectangle(recruit_square_x, recruit_square_y, recruit_square_x + recruit_square_size, recruit_square_y + recruit_square_size, true);

		    // Draw the sprite (e.g., a worker icon) inside the recruit square
		    var worker_sprite = spr_axe_stump;
		    var worker_scale = min(recruit_square_size / sprite_get_width(worker_sprite), 
		                           recruit_square_size / sprite_get_height(worker_sprite));
		    draw_sprite_ext(worker_sprite, 0, recruit_square_x + (recruit_square_size - sprite_get_width(worker_sprite) * worker_scale) / 2, 
		                    recruit_square_y + (recruit_square_size - sprite_get_height(worker_sprite) * worker_scale) / 2, 
		                    worker_scale, worker_scale, 0, c_white, 1);

		    // Detect mouse hover over the recruit square using GUI coordinates
		    global.is_hovering_recruit = gui_mouse_x >= recruit_square_x && gui_mouse_x <= recruit_square_x + recruit_square_size &&
		                                 gui_mouse_y >= recruit_square_y && gui_mouse_y <= recruit_square_y + recruit_square_size;

		    // Draw the inner border when hovering over the square
		    if(global.is_hovering_recruit) {
		        // Draw the white inner border (2 pixels wide)
		        var inner_border_offset = 2;  // The thickness of the inner border
		        draw_set_color(c_white);
		        draw_rectangle(recruit_square_x + inner_border_offset, recruit_square_y + inner_border_offset, 
		                       recruit_square_x + recruit_square_size - inner_border_offset, 
		                       recruit_square_y + recruit_square_size - inner_border_offset, true);

		        UpdateHudText("Recruit Worker (" + string(global.hotkey.recruit_worker) + ") (Food: " + string(global.unit_costs.worker_food) + ")");
		    } else {
		        UpdateHudText("");
		    }
		}
        
        // Ensure sprite exists before scaling
        if (global.selected_object.sprite_index != -1) {
            var building_scale = min(square_size / sprite_get_width(global.selected_object.sprite_index), 
                                     square_size / sprite_get_height(global.selected_object.sprite_index));
            // Draw the selected building's sprite centered in the square
            draw_sprite_ext(global.selected_object.sprite_index, global.selected_object.image_index,
                square_center_x - sprite_get_width(global.selected_object.sprite_index) * building_scale / 2, 
                square_center_y - sprite_get_height(global.selected_object.sprite_index) * building_scale / 2, 
                building_scale, building_scale, 0, global.selected_object.image_blend, 1);
        } else {
            // Fallback if no sprite is assigned, draw the colored square
            building_colour = c_purple;  // Default color, adjust based on building type
            switch(global.selected_object.building_type)
            {
                case "farm":
                    building_colour = c_purple;
                break;

                case "castle":
                    building_colour = c_blue;
                break;

                case "forest":
                    building_colour = c_green;
                break;

                case "goldmine":
                    building_colour = c_yellow;
                break;
            }
            draw_set_color(building_colour);
            draw_rectangle(square_center_x - 40, square_center_y - 40, square_center_x + 40, square_center_y + 40, false);
        }
        
        // Update the third column with building details (was in fourth column)
        draw_set_color(c_white);
        draw_text(floor(col3_x), floor(text_y), 
            "Building: " + string(global.selected_object.building_name));

        // Display the number of workers assigned to the building in the third column, below the building details
        draw_text(floor(col3_x), floor(text_y) + 20, 
            "Assigned Workers: " + string(assigned_worker_count));
    }
}
*/