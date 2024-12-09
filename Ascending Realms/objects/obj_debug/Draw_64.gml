 if(global.debug_mode_enabled == true)
{
	
	x = window_get_width() - 150 - margin;
	y = window_get_height() - 25 - margin;

	
	/*
	// miscellaneous debug

	*/
	
	// draw version, target FPS, and current FPS
	draw_text_color(x, y - 30, VERSION, c_white, c_white, c_white, c_white, 255);
	draw_text_color(x, y - 15, "Set FPS: " + string(game_get_speed(gamespeed_fps)), c_white, c_white, c_white, c_white, 255);
	draw_text_color(x, y, "Current FPS: " + string(fps), c_white, c_white, c_white, c_white, 255);
	
	
}