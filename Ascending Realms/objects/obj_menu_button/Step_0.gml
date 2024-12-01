if (global.game_started == true) {
    // Convert mouse coordinates to GUI coordinates
    var gui_mouse_x = device_mouse_x_to_gui(0);
    var gui_mouse_y = device_mouse_y_to_gui(0);

    // Get the button's position on the GUI layer
    var button_x = window_get_width() - (sprite_width / 2) - margin;
    var button_y = (sprite_height / 2) + margin;

    // Calculate the top-left corner of the sprite based on the origin
    var top_left_x = button_x - (sprite_width / 2);
    var top_left_y = button_y - (sprite_height / 2);

    // Check if the mouse is hovering over the button using GUI coordinates
    if (gui_mouse_x >= button_x - (sprite_width / 2) && gui_mouse_x <= button_x + (sprite_width / 2) &&
        gui_mouse_y >= button_y - (sprite_height / 2) && gui_mouse_y <= button_y + (sprite_height / 2)) {
        
        // If the mouse is over the button, switch to the hover sprite
        sprite_index = Spr_MainMenu_OnHover;

        // Check if the left mouse button is clicked while hovering
        if (mouse_check_button_pressed(mb_left)) {

            // Play mouse click sound
            audio_play_sound(snd_click4, 1, false);

            if (room == global.map_id.valleyofblood) {
                // Go to the main menu room from valley of blood map
                room_goto(global.room_id.main_menu);
            } else if (room == global.room_id.main_menu || room == global.room_id.settings) {
                // Go to valley of blood map if in main menu or settings
                room_goto(global.map_id.valleyofblood);  
            }
        }
    } else {
        // If the mouse is not over the button, switch to the default sprite
        sprite_index = Spr_MainMenu_Default;
    }
}
