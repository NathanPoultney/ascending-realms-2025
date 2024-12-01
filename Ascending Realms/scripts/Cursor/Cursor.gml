function LockCursorToWindow() {
	// Define the padding within which the cursor is allowed to move
	var padding = 10; // Increase this value for more freedom

	// Get the current mouse position
	var mouse_x_pos = display_mouse_get_x();
	var mouse_y_pos = display_mouse_get_y();

	// Get the window position and size
	var win_x = window_get_x();
	var win_y = window_get_y();
	var win_w = window_get_width();
	var win_h = window_get_height();

	// Lock the cursor within the game window if it's in focus
	if (window_has_focus()) {
	    // Check if the cursor is too close to the left or right boundary
	    if (mouse_x_pos < win_x + padding) {
	        window_mouse_set(win_x + padding + (padding / 2), mouse_y_pos);
	    } else if (mouse_x_pos > win_x + win_w - padding) {
	        window_mouse_set(win_x + win_w - padding - (padding / 2), mouse_y_pos);
	    }

	    // Check if the cursor is too close to the top or bottom boundary
	    if (mouse_y_pos < win_y + padding) {
	        window_mouse_set(mouse_x_pos, win_y + padding + (padding / 2));
	    } else if (mouse_y_pos > win_y + win_h - padding) {
	        window_mouse_set(mouse_x_pos, win_y + win_h - padding - (padding / 2));
	    }
	}
}