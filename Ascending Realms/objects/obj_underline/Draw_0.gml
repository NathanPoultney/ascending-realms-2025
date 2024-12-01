/* // For debugging the on hover rectangle area
// Set the color for the hover area (for debugging purposes)
draw_set_color(c_blue);

// Calculate the rectangle's corners
var rect_x1 = x - hover_width / 2;
var rect_y1 = (y + 16) - hover_height - (sprite_height / 2);  // Positioned below the underline
var rect_x2 = x + hover_width / 2;
var rect_y2 = (y + 6) - (sprite_height / 2);

// Draw the hover area rectangle (for debugging purposes)
draw_rectangle(rect_x1, rect_y1, rect_x2, rect_y2, false);
*/

draw_self();