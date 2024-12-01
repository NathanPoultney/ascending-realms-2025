function CalculatePlayTime() {
    // Calculate the play time in hours, minutes, and seconds
    var hours = global.elapsed_time div 3600;
    var minutes = (global.elapsed_time mod 3600) div 60;
    var seconds = global.elapsed_time mod 60;

    // Return the calculated time components
    return [hours, minutes, seconds];
}

function FormatPlayTime(hours, minutes, seconds) {
    // Ensure leading zeros
    var hours_text = (hours < 10) ? "0" + string(hours) : string(hours);
    var minutes_text = (minutes < 10) ? "0" + string(minutes) : string(minutes);
    var seconds_text = (seconds < 10) ? "0" + string(seconds) : string(seconds);

    // Combine the formatted time components
    return hours_text + ":" + minutes_text + ":" + seconds_text;
}