// If a target object is assigned, position the bar relative to it
if (target_object != noone && instance_exists(target_object)) {
    x = target_object.x - totalWidth / 2;  // Center the bar on the target object
    y = target_object.y - (target_object.sprite_height * target_object.image_yscale) / 2 + y_offset + 5;  // Move the bar higher
}

// Calculate the current percentage
current = clamp(current, 0, maximum);  // Ensure current is within valid range
percentage = current / maximum;
barWidth = totalWidth * percentage;

// Draw the background
draw_set_colour(bgColor);
draw_rectangle(x, y, x + totalWidth, y + height, false);

// Draw the filled portion
draw_set_colour(fillColor);
draw_rectangle(x, y, x + barWidth, y + height, false);

// Draw the border
draw_set_colour(fillColor);
draw_rectangle(x - 1, y - 1, x + totalWidth + 1, y + height + 1, true);  // Border