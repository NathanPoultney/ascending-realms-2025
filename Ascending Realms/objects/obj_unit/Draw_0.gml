// Draw the unit sprite
if (sprite_index != -1) {
    if (variable_instance_exists(id, "creation_room") && room == creation_room) {
        draw_self();
    }
} else {
    show_debug_message("obj_unit has no sprite assigned.");
}

// Check if this unit is the selected one
if (global.selected_object == id) {
    selected = true;
} else {
    selected = false;
}

// Determine if the health bar should be drawn
var show_bar = selected || keyboard_check(vk_alt);

// Only draw the health bar if the unit is selected or ALT is being held
if (show_bar && room == global.map_id.valleyofblood) {
    // Calculate the position of the health bar relative to the unit
    var bar_x = x - bar_totalWidth / 2;
    var bar_y = y - (sprite_height * image_yscale) / 2 + bar_y_offset;

    // Calculate the percentage for the fill
    var bar_percentage = bar_current / bar_maximum;
    var bar_fillWidth = bar_totalWidth * bar_percentage;

    // Draw the background
    draw_set_colour(bar_bgColor);
    draw_rectangle(bar_x, bar_y, bar_x + bar_totalWidth, bar_y + bar_height, false);

    // Draw the filled portion
    draw_set_colour(bar_fillColor);
    draw_rectangle(bar_x, bar_y, bar_x + bar_fillWidth, bar_y + bar_height, false);

    // Draw the border
    draw_set_colour(c_black);
    draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_totalWidth + 1, bar_y + bar_height + 1, true);
}