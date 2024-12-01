// Calculate the center of the window dynamically
var modal_x = window_get_width() / 2 - (modalWidth / 2);
var modal_y = window_get_height() / 2 - (modalHeight / 2);

// Draw a semi-transparent background to "dim" the rest of the game
draw_set_alpha(0.5);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1); // Reset alpha to fully opaque

// Set the border color and draw the border
var borderColor = make_color_rgb(255, 242, 0); // RGB color for the border
draw_set_color(borderColor);
// Draw the border rectangle slightly larger to create a 3px border effect
draw_rectangle(modal_x - 3, modal_y - 3, modal_x + modalWidth + 3, modal_y + modalHeight + 3, false); 

// Draw the modal background inside the border
var backgroundColor = make_color_rgb(68, 68, 68); // Modal background color
draw_set_color(backgroundColor);
draw_rectangle(modal_x, modal_y, modal_x + modalWidth, modal_y + modalHeight, false); 

// Reset color to white and alpha to fully opaque for subsequent drawings
draw_set_color(c_white);
draw_set_alpha(1);

// Calculate the position to center the text
var text_width = string_width(modalText);
var text_height = string_height(modalText);

var text_x = modal_x + (modalWidth - text_width) / 2;
var text_y = modal_y + (modalHeight - text_height) / 2;

// Draw the modal text centered within the modal
draw_text(text_x, text_y, modalText);