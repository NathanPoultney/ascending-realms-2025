// Check if we're in the settings room
if (room == global.room_id.settings) {
    var back_button = instance_find(obj_back_button, 0);  // Assuming there's only one instance of obj_back_button

    if (back_button != noone && !global.dropdown_open) {
        // Position the underline based on the back button's position
        x = back_button.x;
        y = back_button.y + (back_button.sprite_height / 2) - 10;  // 10px above the bottom of the back button

        // Calculate the rectangle's corners for the hover effect
        var rect_x1 = x - hover_width / 2;
        var rect_y1 = y - hover_height;
        var rect_x2 = x + hover_width / 2;
        var rect_y2 = y;

        // Check if the mouse is within the hover area
        if (mouse_x >= rect_x1 && mouse_x <= rect_x2 && mouse_y >= rect_y1 && mouse_y <= rect_y2) {
            visible = true;
        } else {
            visible = false;
        }
    }
} else {
    // Default behavior for other rooms

    // Calculate the rectangle's corners
    var rect_x1 = x - hover_width / 2;
    var rect_y1 = (y + 16) - hover_height - (sprite_height / 2);  // Positioned below the underline
    var rect_x2 = x + hover_width / 2;
    var rect_y2 = (y + 6) - (sprite_height / 2);

    // Check if the mouse is within the hover area
    if (mouse_x >= rect_x1 && mouse_x <= rect_x2 && mouse_y >= rect_y1 && mouse_y <= rect_y2) {
        visible = true;
    } else {
        visible = false;
    }
}