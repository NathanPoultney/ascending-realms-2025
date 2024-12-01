// Set the position based on the current window size
x = window_get_width() - sprite_width - margin;
y = margin;

// Ensure the visibility is managed based on whether the game has started
visible = global.game_started;

if(visible)
{
	// Draw the button with the current sprite
	draw_self();
}