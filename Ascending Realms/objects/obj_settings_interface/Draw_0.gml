draw_set_color(c_white);

// Calculate the center of the screen based on the current room size
var x_pos_center = room_width / 2;
var y_pos = room_height / 3;

// Define shared slider properties
var slider_length = 200;
var slider_height = 20;

// Draw the Sound Volume control
var sound_volume_text = "Sound Volume: " + string(round(global.settings.SoundVolume)) + "%";
draw_text(x_pos_center - (string_width(sound_volume_text) / 2), y_pos, sound_volume_text);
var sound_slider_y_position = y_pos + string_height(sound_volume_text) + 20;  // Calculate y position for the slider
var sound_slider_x = x_pos_center - (slider_length / 2);  // X position for the slider

// Draw the Sound Volume slider
draw_rectangle(sound_slider_x, sound_slider_y_position, sound_slider_x + slider_length, sound_slider_y_position + slider_height, false);

// Draw the Sound Volume slider handle
draw_set_color(c_grey);
var sound_handle_x = sound_slider_x + (global.settings.SoundVolume / 100) * slider_length;
draw_rectangle(sound_handle_x - 5, sound_slider_y_position - 5, sound_handle_x + 5, sound_slider_y_position + slider_height + 5, false);

// Reset color to white for the next elements
draw_set_color(c_white);

// Move y_pos down for the Music Volume slider
y_pos = sound_slider_y_position + slider_height + 40;  // Ensure correct y_pos is used

// Draw the Music Volume control
var volume_text = "Music Volume: " + string(round(global.settings.MusicVolume)) + "%";
draw_text(x_pos_center - (string_width(volume_text) / 2), y_pos, volume_text);
var music_slider_y_position = y_pos + string_height(volume_text) + 20;  // Calculate y position for the slider
var music_slider_x = x_pos_center - (slider_length / 2);  // X position for the slider

// Draw the Music Volume slider
draw_rectangle(music_slider_x, music_slider_y_position, music_slider_x + slider_length, music_slider_y_position + slider_height, false);

// Draw the Music Volume slider handle
draw_set_color(c_grey);
var music_handle_x = music_slider_x + (global.settings.MusicVolume / 100) * slider_length;
draw_rectangle(music_handle_x - 5, music_slider_y_position - 5, music_handle_x + 5, music_slider_y_position + slider_height + 5, false);

// Update y_pos after the music slider for the next elements
y_pos = music_slider_y_position + slider_height + 40;

if (global.features.enable_resolutions) {
    // Draw resolution settings
    var resolution_text = "Current Resolution: " + global.selected_resolution;
    draw_set_color(c_white);  // Set color to white before drawing the text
    draw_text(x_pos_center - (string_width(resolution_text) / 2), y_pos, resolution_text);
    var box_y_position = y_pos + string_height(resolution_text) + 20;  // Calculate y position for the dropdown box

    // Draw the dropdown box
    var box_width = 200;
    var box_height = 30;
    var box_x = x_pos_center - (box_width / 2);
    draw_set_color(c_white);  // Ensure dropdown box is white
    draw_rectangle(box_x, box_y_position, box_x + box_width, box_y_position + box_height, false);

    if (global.dropdown_open) {
        var keys = variable_struct_get_names(global.available_resolutions);
        for (var i = 0; i < array_length(keys); i++) {
            var resolution_value = global.available_resolutions[$ keys[i]];
            var item_y = box_y_position + box_height + (i * box_height);
            
            // Draw the option background
            if (global.selected_resolution == resolution_value) {
                draw_set_color(c_black);
                draw_rectangle(box_x, item_y, box_x + box_width, item_y + box_height, false);
                draw_set_color(c_white);  // Selected option should have white text
            } else {
                draw_set_color(c_white);
                draw_rectangle(box_x, item_y, box_x + box_width, item_y + box_height, false);
                draw_set_color(c_black);  // Non-selected options should have black text
            }
            
            // Draw the option text
            draw_text(box_x + (box_width - string_width(resolution_value)) / 2, item_y + (box_height - string_height(resolution_value)) / 2, resolution_value);
        }
    } else {
        draw_set_color(c_black);  // Text inside the box is black
        draw_text(box_x + 5, box_y_position + 5, "Select Resolution");
    }
}