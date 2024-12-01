// Total cycle duration for a full cycle (day + night = 240 seconds)
//cycle_duration = 240;

// Duration for either day or night
dayNightDuration = global.cycle_duration / 2;  // 2 minutes for day and 2 minutes for night

// Initialize the clock specific accumulator if not already initialized
if (global.time_accumulators == undefined) {
    global.time_accumulators = {};
}
if (global.time_accumulators.clock == undefined) {
    global.time_accumulators.clock = 0;
}

/*
// Initialize the global time and day/night flag if not already initialized
if (!variable_global_exists("global.time")) {
    global.time = 0;
}
if (!variable_global_exists("global.is_day")) {
    global.is_day = 1;
}
*/