// Get the mouse position relative to the GUI
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// Draw the gray background rectangle across the top of the window
var rect_height = global.hud_top.height;
draw_set_color(make_colour_rgb(30, 34, 38)); // Gray color
draw_rectangle(0, 0, display_get_gui_width(), rect_height, false);

// draw border
var border_size = 5;
draw_set_color(make_colour_rgb(149, 132, 87));
draw_rectangle(0, rect_height, display_get_gui_width(), rect_height + border_size, false);

// Reset the color to white for the text
draw_set_color(c_white);

// Calculate the width of the left and right sections
var left_section_width = display_get_gui_width() * 0.5;
var right_section_width = display_get_gui_width() * 0.5;

// Calculate the center of each section
var left_section_center_x = left_section_width * 0.5;
var right_section_center_x = display_get_gui_width() - (right_section_width * 0.5);

// Text for the left section (Gold, Wood, Food)
var left_text = "Gold: " + FormatNumber(global.player.gold) + 
                " | Wood: " + FormatNumber(global.player.wood) +
                " | Food: " + FormatNumber(global.player.food);

// Calculate the width of the left section text
var left_text_width = string_width(left_text);

// Draw the left section text centered
draw_text(floor(left_section_center_x - (left_text_width / 2)), floor(rect_height / 4), left_text);

// Count the player's units and prepare the right section text
var population_count = CountPlayerUnits();
var population_text = "Population: " + FormatNumber(population_count);
var upkeep_text = "Upkeep: " + string(global.upkeep * 100) + "%";

// Combine the right section text
var right_text = population_text + " | " + upkeep_text;

// Calculate the width of the right section text
var right_text_width = string_width(right_text);

// Draw the right section text centered
draw_text(floor(right_section_center_x - (right_text_width / 2)), floor(rect_height / 4), right_text);

// Calculate and format the play time
var play_time = CalculatePlayTime();
var play_time_text = FormatPlayTime(play_time[0], play_time[1], play_time[2]);

// Calculate the x position for the playtime text to be on the far right side
var play_time_x = display_get_gui_width() - string_width(play_time_text) - 10; // 10 pixels padding from the right edge
// Calculate the y position just below the top HUD's gold border and shift it down by 5 pixels
var play_time_y = rect_height + border_size + 10; // 10 pixels total padding below the gold border

// Calculate the rectangle size and position
var rect_x1 = play_time_x - 30; // Shift left by 30 pixels for the gradient area
var rect_y1 = play_time_y - 5; // Shift up by 5 pixels for padding
var rect_x2 = play_time_x + string_width(play_time_text) + 5; // Extend right by 5 pixels for padding
var rect_y2 = play_time_y + string_height(play_time_text) + 5; // Extend down by 5 pixels for padding

// Draw the main opaque rectangle with 80% opacity
draw_set_alpha(0.8); // Set opacity to 80%
draw_set_color(c_black);
draw_rectangle(rect_x1 + 20, rect_y1, rect_x2, rect_y2, false); // Draw the main rectangle

// Draw the gradient portion on the right side of the rectangle
for (var i = 0; i < 20; i++) { // 20-pixel gradient
    var opacity = 0.4 * (i / 20.0); // Gradually decrease opacity from 40% to 0%
    draw_set_alpha(opacity);
    draw_set_color(c_black);
    draw_rectangle(rect_x1 + i, rect_y1, rect_x1 + i + 1, rect_y2, false);
}

// Reset alpha to full
draw_set_alpha(1.0);

// Draw the playtime text
draw_set_color(c_white);
draw_text(play_time_x, play_time_y, play_time_text);

// Determine if the mouse is hovering over the left section
var is_hovering_left_section = gui_mouse_x >= (left_section_center_x - (left_text_width / 2)) && 
                                gui_mouse_x <= (left_section_center_x + (left_text_width / 2)) && 
                                gui_mouse_y >= 0 && gui_mouse_y <= rect_height / 2;

var display_prod_per_sec = false;

if(is_hovering_left_section) {
    display_prod_per_sec = true;
} else if(global.showAlt) {
    display_prod_per_sec = true;    
} else {
    display_prod_per_sec = false;    
}

// Check if ALT is held down or the mouse is hovering over the left section
if (display_prod_per_sec) {
    // Adjust the vertical position for the production rate text
    var production_y_offset = 30; // Distance below the first line of text

    // The text to be displayed
    var production_text = "Gold " + FormatNumber(global.gold_production_rate) + " per sec" + 
                          " | Wood " + FormatNumber(global.wood_production_rate) + " per sec" +
                          " | Food " + FormatNumber(global.food_production_rate) + " per sec";

    // Calculate the text dimensions
    var text_width = string_width(production_text);
    var text_height = string_height(production_text);

    // Calculate the position for the text
    var text_x = floor(left_section_center_x - (text_width / 2));
    var text_y = floor(rect_height / 4) + production_y_offset;

    // Draw the black rectangle behind the text
    draw_set_alpha(0.6); // Set opacity to 60%
    draw_set_color(c_black); // Set color to black
    draw_rectangle(text_x - 5, text_y - 5, text_x + text_width + 5, text_y + text_height + 5, false); // Draw the rectangle

    // Reset alpha to full opacity for the text
    draw_set_alpha(1.0);

    // Draw the production rates text
    draw_set_color(c_white);
    draw_text(text_x, text_y, production_text);
}

var y_offset = play_time_y + string_height(play_time_text) + 15; // Start below the playtime

for (var i = 0; i < array_length(global.messages); i++) {
    var msg = global.messages[i];

    // Ensure msg is an array
    if (is_array(msg)) {
        // Calculate how much time has passed since the message was created
        var elapsed_time = global.message_time - msg[1];

        // Calculate remaining time for fading (fade out during the last second)
        var fade_time = 7.0 - elapsed_time;
        var opacity = clamp(fade_time, 0, 1); // Fade out from 1 to 0 over the last second

        // Calculate the position of the message
        var msg_text = msg[0]; // Get the message text
        var msg_width = string_width(msg_text);
        var msg_height = string_height(msg_text);

        var msg_x = display_get_gui_width() - msg_width - 10; // Align to the right side
        var msg_y = y_offset + i * (msg_height + 10); // Stack messages with spacing

        // Draw the background rectangle with the gradient and opacity
        rect_x1 = msg_x - 30;
        rect_y1 = msg_y - 5;
        rect_x2 = msg_x + msg_width + 5;
        rect_y2 = msg_y + msg_height + 5;

        // Draw the main rectangle with fading opacity
        draw_set_alpha(opacity * 0.8); // 80% base opacity, adjusted by fade
        draw_set_color(c_black);
        draw_rectangle(rect_x1 + 20, rect_y1, rect_x2, rect_y2, false); // Draw the main rectangle

        // Draw the gradient portion on the left side of the rectangle
        for (var j = 0; j < 20; j++) { // 20-pixel gradient
            var gradient_opacity = opacity * 0.4 * (j / 20.0); // Gradually decrease opacity from 40% to 0%
            draw_set_alpha(gradient_opacity);
            draw_set_color(c_black);
            draw_rectangle(rect_x1 + j, rect_y1, rect_x1 + j + 1, rect_y2, false);
        }

        // Draw the text with fading opacity
        draw_set_alpha(opacity);
        draw_set_color(c_white);
        draw_text(msg_x, msg_y, msg_text);
    }
}

// Reset alpha to full
draw_set_alpha(1.0);