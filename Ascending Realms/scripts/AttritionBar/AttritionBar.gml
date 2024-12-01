function DrawAttritionBar(bar_length, bar_height, bar_vertical_offset, percentage_player, percentage_enemy) { 
    // Calculate horizontal center and vertical position
    var screen_center_x = global.settings.ResolutionWidth / 2;
    var bar_x = screen_center_x - (bar_length / 2);
    var bar_y = bar_vertical_offset; // Y position just below the top of the screen

    // Calculate lengths of each segment based on percentages
    var player_length = percentage_player * bar_length;
    var enemy_length = percentage_enemy * bar_length;
    //var neutral_length = bar_length - player_length - enemy_length;

    // Calculate border size
    var border_size = 2; // Change this to adjust the size of the border

    // Draw border (a larger grey rectangle behind the progress bar)
    draw_rectangle_colour(bar_x - border_size, bar_y - border_size, bar_x + bar_length + border_size, bar_y + bar_height + border_size, c_grey, c_grey, c_grey, c_grey, false);

    // Draw player (green) segment
    draw_rectangle_colour(bar_x, bar_y, bar_x + player_length, bar_y + bar_height, c_green, c_green, c_green, c_green, false);

    // Draw enemy (red) segment
    draw_rectangle_colour(bar_x + player_length, bar_y, bar_x + player_length + enemy_length, bar_y + bar_height, c_red, c_red, c_red, c_red, false);

    // Draw neutral (teal) segment
    draw_rectangle_colour(bar_x + player_length + enemy_length, bar_y, bar_x + bar_length, bar_y + bar_height, c_teal, c_teal, c_teal, c_teal, false);
}


function CalculateInfluencePercentages() {
	var totalUnits = GetTotalUnitCount();
	var unitCountsByTeam = GetUnitCountsByTeam();

	var playerCount = ds_map_find_value(unitCountsByTeam, "Team1");
	var enemyCount = ds_map_find_value(unitCountsByTeam, "Team2");
	//var neutralCount = ds_map_find_value(unitCountsByTeam, "Team3");

	var percentage_player = (totalUnits > 0) ? playerCount / totalUnits : 0;
	var percentage_enemy = (totalUnits > 0) ? enemyCount / totalUnits: 0;

	// Remember to destroy the map when done to prevent memory leaks
	ds_map_destroy(unitCountsByTeam);

	//show_debug_message("Percentage of Player Units: " + string(percentage_player) + "%");
	//show_debug_message("Percentage of Enemy Units: " + string(percentage_enemy) + "%");
	//show_debug_message("Percentage of Neutral Units: " + string(percentage_neutral) + "%");

	return [percentage_player, percentage_enemy];
}