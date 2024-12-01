// Check the global day/night state and set fading accordingly
if (global.is_day && !fading_out) {
    fading_in = false;
    fading_out = true;
} else if (!global.is_day && !fading_in) {
    fading_in = true;
    fading_out = false;
}

// Handle fading in (night)
if (fading_in) {
    overlay_alpha += fade_speed;
    if (overlay_alpha >= 0.3) {  // Set your desired max alpha for the night effect
        overlay_alpha = 0.3;
        fading_in = false;  // Stop fading in once fully dark
    }
}

// Handle fading out (day)
if (fading_out) {
    overlay_alpha -= fade_speed;
    if (overlay_alpha <= 0) {
        overlay_alpha = 0;
        fading_out = false;  // Stop fading out once fully transparent
    }
}
