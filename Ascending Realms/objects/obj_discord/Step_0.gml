// Check if the mouse is over the object
if (position_meeting(mouse_x, mouse_y, id)) {
    // Check if the left mouse button is pressed
    if (mouse_check_button_pressed(mb_left)) {
        // Open the Discord URL in the player's default web browser
        url_open(global.config.game_discord);
    }
}