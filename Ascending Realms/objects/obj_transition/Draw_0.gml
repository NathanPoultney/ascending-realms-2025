// Set the draw color to black and apply the fade effect
draw_set_color(c_black);
draw_set_alpha(fade_alpha);

// Draw a rectangle covering the entire room
draw_rectangle(0, 0, room_width, room_height, false);

// Reset alpha and color after drawing
draw_set_alpha(1);
draw_set_color(c_white);