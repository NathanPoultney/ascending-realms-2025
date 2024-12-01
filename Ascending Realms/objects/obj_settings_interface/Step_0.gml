var configFolder = working_directory + "config\\";
var settingsFile = configFolder + "settings.ini";

// Calculate the scaling factor based on the default resolution (1024x768)
var scale_x = room_width / 1024;
var scale_y = room_height / 768;

// Calculate the center of the screen using the scaling factor
var padding = 20 * scale_y;
var x_pos_center = room_width / 2;

// Initialize dragging state if not already defined
if (typeof(is_dragging) == undefined) {
    is_dragging = false;
}

// ----------------------------------------
// Define Positions for UI Elements
// ----------------------------------------

// Starting Y position
var y_pos = (room_height / 3) * scale_y;

// --------------------
// Sound Volume Slider
// --------------------
var sound_text = "Sound Volume";
var sound_slider_length = 200 * scale_x;
var sound_slider_height = 20 * scale_y;
var sound_text_height = string_height(sound_text) * scale_y;
var sound_slider_x = x_pos_center - (sound_slider_length / 2);
var sound_slider_y = y_pos + sound_text_height + 20 * scale_y;

// Handle dragging for the Sound Volume slider
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, sound_slider_x, sound_slider_y, sound_slider_x + sound_slider_length, sound_slider_y + sound_slider_height)) {
        is_dragging = "sound";
    }
}

if (is_dragging == "sound" && mouse_check_button(mb_left)) {
    var new_x = clamp(mouse_x, sound_slider_x, sound_slider_x + sound_slider_length);
    var new_volume = ((new_x - sound_slider_x) / sound_slider_length) * 100;
    global.settings.SoundVolume = clamp(new_volume, 0, 100);
    audio_group_set_gain(ag_sfx, global.settings.SoundVolume / 100, 0);

    ini_open(settingsFile);
    ini_write_string("Settings", "SoundVolume", global.settings.SoundVolume);
    ini_close();

    show_debug_message("SoundVolume setting changed and saved");
} else if (!mouse_check_button(mb_left)) {
    is_dragging = false;
}

// Update y_pos for the next element
y_pos = sound_slider_y + sound_slider_height + 40 * scale_y;

// --------------------
// Music Volume Slider
// --------------------
var music_text = "Music Volume";
var music_slider_length = 200 * scale_x;
var music_slider_height = 20 * scale_y;
var music_text_height = string_height(music_text) * scale_y;
var music_slider_x = x_pos_center - (music_slider_length / 2);
var music_slider_y = y_pos + music_text_height + 20 * scale_y;

// Handle dragging for the Music Volume slider
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, music_slider_x, music_slider_y, music_slider_x + music_slider_length, music_slider_y + music_slider_height)) {
        is_dragging = "music";
    }
}

if (is_dragging == "music" && mouse_check_button(mb_left)) {
    var new_x = clamp(mouse_x, music_slider_x, music_slider_x + music_slider_length);
    var new_volume = ((new_x - music_slider_x) / music_slider_length) * 100;
    global.settings.MusicVolume = clamp(new_volume, 0, 100);
    audio_group_set_gain(ag_music, global.settings.MusicVolume / 100, 0);

    ini_open(settingsFile);
    ini_write_string("Settings", "MusicVolume", global.settings.MusicVolume);
    ini_close();

    show_debug_message("MusicVolume setting changed and saved");
} else if (!mouse_check_button(mb_left)) {
    is_dragging = false;
}

// Update y_pos for the next element
y_pos = music_slider_y + music_slider_height + 40 * scale_y;

// --------------------
// Resolution Dropdown
// --------------------
var dropdown_y_position = y_pos;
var box_width = 200 * scale_x;
var box_height = 30 * scale_y;
var box_x = x_pos_center - (box_width / 2);
var box_y = dropdown_y_position + box_height;

if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, box_x, box_y, box_x + box_width, box_y + box_height)) {
        global.dropdown_open = !global.dropdown_open;
    } else if (global.dropdown_open) {
        var keys = variable_struct_get_names(global.available_resolutions);
        for (var i = 0; i < array_length(keys); i++) {
            var item_y = box_y + box_height + (i * box_height);
            if (point_in_rectangle(mouse_x, mouse_y, box_x, item_y, box_x + box_width, item_y + box_height)) {
                var resolution_value = global.available_resolutions[$ keys[i]];
                global.selected_resolution = resolution_value;
                global.dropdown_open = false;

                var resolutionParts = string_split(global.selected_resolution, "x");
                if (array_length(resolutionParts) >= 2) {
                    var width = real(resolutionParts[0]);
                    var height = real(resolutionParts[1]);
                    SetGameResolution(width, height);
                    global.settings.ResolutionWidth = width;
                    global.settings.ResolutionHeight = height;

                    ini_open(settingsFile);
                    ini_write_string("Settings", "ResolutionWidth", string(width));
                    ini_write_string("Settings", "ResolutionHeight", string(height));
                    ini_close();

                    show_debug_message("Resolution setting changed and saved");
				    room_restart();  // Restart the room to refresh all settings and recalculations
                } else {
                    show_debug_message("Resolution format is incorrect: " + global.selected_resolution);
                }
                break;
            }
        }
    }
}

if (global.dropdown_open) {
    exit;  // Prevent other input handling when the dropdown is open
}