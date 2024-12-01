// Set the clock's radius
var radius = 75;

// reduce clock size on the smallest resolution 1024x768
if(global.settings.ResolutionWidth == "1024" && global.settings.ResolutionHeight == "768") {
	radius = 50;
}

// Recalculate the center of the window horizontally every frame
var clock_x = display_get_gui_width() / 2;

// Set the vertical position so that it is just below the top of the window
var clock_y = 0;  // Adjust to ensure the clock stays halfway into the room

// Draw the filled semi-circle for the clock (bottom half circle)
if (global.game_started) {
    draw_set_colour(global.is_day ? make_colour_rgb(144, 185, 224) : c_black);
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(clock_x, clock_y); // Center point

    for (var angle = 0; angle <= 180; angle += 1) {
        var radAngle = degtorad(angle);
        var posX = clock_x + cos(radAngle) * radius;
        var posY = clock_y + sin(radAngle) * radius;
        draw_vertex(posX, posY);
    }

    draw_vertex(clock_x + radius, clock_y); // Ensure this connects to the starting side
    draw_primitive_end();

    // Calculate the angle for the sun/moon position
    var cycle_fraction = global.time / dayNightDuration;
    var indicatorAngle = lerp(0, 180, cycle_fraction);
    var radIndicatorAngle = degtorad(indicatorAngle);

    // Draw the sun/moon indicator
    draw_set_colour(global.is_day ? c_yellow : c_gray);
    var indicatorX = clock_x + cos(radIndicatorAngle) * (radius - 10);
    var indicatorY = clock_y + sin(radIndicatorAngle) * (radius - 10);
    draw_circle(indicatorX, indicatorY, 7, false);
}

// Get the mouse position relative to the GUI
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

// Check if the mouse is hovering over the clock
var is_hovering = false;
if (point_in_circle(gui_mouse_x, gui_mouse_y, clock_x, clock_y, radius)) {
    is_hovering = true;
}

// Show the day/night text if hovering over the clock or if showAlt is true
if (global.showAlt || is_hovering) {
    var dayOrNight = global.is_day ? "Currently Day" : "Currently Night";
    draw_set_colour(c_white);
    draw_text(clock_x - 60, clock_y + 80, dayOrNight);
}