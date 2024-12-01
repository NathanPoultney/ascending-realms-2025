// Increment cycle time using the global time accumulator and only increment once character has been created
if (global.game_started == true) {
    global.time += global.time_accumulators.clock;  // Add elapsed real-time seconds to cycle time
    global.time_accumulators.clock = 0;  // Reset the accumulator after updating time
}

// Check if we need to switch from day to night or vice versa
if (global.time >= dayNightDuration) {
    global.is_day = !global.is_day; // Toggle between day (1) and night (0)
    global.time -= dayNightDuration;  // Reset the timer for the next half (day or night)
}