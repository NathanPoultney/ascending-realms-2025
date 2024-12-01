/// @function GetXOffsetForCount(count)
/// @description This function calculates the appropriate x_offset based on the number of digits in the count.
/// @param {real} count The count whose number of digits is used to calculate the x_offset.
/// @returns {real} Returns the calculated x_offset.
function GetXOffsetForCount(count) {
    var count_str = string(count);
    var digit_length = string_length(count_str);

    switch (digit_length) {
        case 1: return -5; // Single digit
        case 2: return -7; // Double digit
        case 3: return -4; // Triple digit
        default: return -4; // For higher than triple digits
    }
}


function CapitalizeFirstChar(input_string) {
    // Check if the string is not empty
    if (string_length(input_string) > 0) {
        var first_char = string_upper(string_char_at(input_string, 1)); // Get and uppercase the first character
        var rest_of_string = string_delete(input_string, 1, 1); // Remove the first character from the original string
        return first_char + rest_of_string; // Combine the uppercase first character with the rest of the string
    } else {
        return input_string; // Return the original string if it's empty
    }
}