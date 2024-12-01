// Set text based on loading status
var loadingText = loadingComplete ? "Press any key" : "Loading...";

// Draw the text
draw_text_color(x, y - 25, loadingText, c_white, c_white, c_white, c_white, 255);

bgColor = make_colour_rgb(112, 3, 12); // Dark red
fillColor = c_red; // Red

current = min(current, maximum);
percentage = current / maximum;
percentage = min(1, percentage); // Clamp to 1 (100%)

// Calculate the width of the filled portion
barWidth = totalWidth * percentage;

// Draw the background
draw_set_colour(bgColor);
draw_rectangle(x, y, x + totalWidth, y + height, false);

// Draw the filled portion
draw_set_colour(fillColor);
draw_rectangle(x, y, x + barWidth, y + height, false);

// Draw the border
draw_set_colour(fillColor); // Use the fill color for the border
draw_rectangle(x - 1, y - 1, x + totalWidth + 1, y + height + 1, true); // Border
