function DrawCircle(x, y, radius, show_percentage, percentage) {
    var steps = 360; // Define the number of steps for smoother arcs
    
    // Draw the full background pie in black
    draw_set_colour(c_black);
    for (var i = 0; i <= 360; i += (360/steps)) {
        var angle1 = degtorad(i);
        var angle2 = degtorad(i + (360/steps));
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(x, y); // Center
        draw_vertex(x + cos(angle1) * radius, y + sin(angle1) * radius);
        draw_vertex(x + cos(angle2) * radius, y + sin(angle2) * radius);
        draw_primitive_end();
    }

    // Draw the XP progress slice in purple
    draw_set_colour(c_purple);
    var endAngle = percentage * 360; // Calculate end angle based on XP
    for (var i = 0; i <= endAngle; i += (360/steps)) {
        var angle1 = degtorad(i);
        var angle2 = degtorad(i + (360/steps));
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(x, y); // Center
        draw_vertex(x + cos(angle1) * radius, y + sin(angle1) * radius);
        if (i < endAngle) { // Avoid drawing beyond the XP slice
            draw_vertex(x + cos(angle2) * radius, y + sin(angle2) * radius);
        }
        draw_primitive_end();
    }

   // Calculate the text position and percentage to display
    var textPercentage = string(round(percentage * 100)) + "%"; // Convert to string and add '%' sign
    var textRadius = radius / 2; // Position the text in the middle of the radius for visibility
    var angleForText = (percentage / 2) * 2 * pi; // Halfway through the filled arc

    // Set color and font for the percentage text if needed
    draw_set_colour(c_white);

    // Calculate text position
    var textX = x + cos(angleForText) * textRadius - string_width(textPercentage) / 2;
    var textY = y + sin(angleForText) * textRadius - string_height(textPercentage) / 2;

    // Draw the percentage text
	if(show_percentage == true)
	{
		draw_text(textX, textY, textPercentage);
	}
}