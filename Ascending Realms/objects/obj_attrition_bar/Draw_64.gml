/// @description Insert description here
// You can write your code in this editor

// Percentages (from 0 to 1)
//var percentage_green = 0.4; // 40% green
//var percentage_red = 0.3; // 30% red
// teal will take up the remainder

// Draw the attrition bar using the calculated percentages
var percentages = global.attrition_percentages;

// Check if 'percentages' has enough elements
if (array_length(percentages) >= 2) {
    DrawAttritionBar(bar_length, bar_height, bar_vertical_offset, percentages[0], percentages[1]);
} else {
    // Handle the case where 'percentages' does not have enough elements
    show_debug_message("Error: Not enough data in 'attrition_percentages'. Expected 2, got " + string(array_length(percentages)));
}