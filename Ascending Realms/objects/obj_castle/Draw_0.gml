// Define the target size for the sprite
var target_width = 40;
var target_height = 40;

// Calculate the scale factors based on the target size
var scale_x = target_width / sprite_width;
var scale_y = target_height / sprite_height;

// so the sprite frames don't cycle
image_speed = 0;

if(global.is_day) {
	image_index = 0;	
} else {
	image_index = 1;	
}

// Draw the sprite scaled to the target size
draw_sprite_ext(sprite_index, image_index, x, y, scale_x, scale_y, 0, image_blend, 1);

// Determine if the mouse is over the rectangle (hover area)
var rect_x1 = x;
var rect_y1 = y;
var rect_x2 = x + target_width;
var rect_y2 = y + target_height;
var is_hovering = (mouse_x >= rect_x1 && mouse_x <= rect_x2 && mouse_y >= rect_y1 && mouse_y <= rect_y2);

// Check if the building is selected
var selected = (global.selected_object == id);

// Set text color based on selection, prioritizing selected over is_hovering
var text_colour;
if (selected) {
    text_colour = c_white;
} else if (is_hovering) {
    text_colour = c_white;
} else {
    text_colour = c_gray;
}

// Draw the text with the determined colour
draw_text_color(x, y - 40, "Castle", text_colour, text_colour, text_colour, text_colour, 255);
