if (fading_in) {
    // Fade in by decreasing the alpha value
    fade_alpha -= fade_speed;
    
    // When fully transparent, we're done fading in
    if (fade_alpha <= 0) {
        fade_alpha = 0;
        instance_destroy();  // Remove the transition object after the fade-in is complete
    }
}