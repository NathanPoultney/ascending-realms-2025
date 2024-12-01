if (overlay_alpha > 0) {
    draw_set_color(c_black);  // Set the color to black
    draw_set_alpha(overlay_alpha);  // Apply the transparency level

    // Draw the overlay rectangle across the entire room
    draw_rectangle(0, 0, room_width, room_height, false);

    // Reset the alpha and color to their default values
    draw_set_alpha(1);
    draw_set_color(c_white);
}