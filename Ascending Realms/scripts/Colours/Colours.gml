/// hex_to_color(hexString)
/// @param hexString A string representing the color in hexadecimal format, can be "#RRGGBB" or "RRGGBB".
/// @description var myColor = hex_to_color("#FF5733"); Converts the hex code to a GameMaker color
/// draw_set_colour(myColor); Sets the drawing color
/// draw_circle(100, 100, 50, true); Draws a circle with the color derived from the hex code
function hex_to_color(hexString) {
    // Remove '#' from the hex string if present
    var cleanedHex = string_replace_all(hexString, "#", "");
    
    // Convert the cleaned hex string to a real number (base 16)
    var num = strtoreal(cleanedHex, 16);
    
    // Extract RGB components
    var red = (num >> 16) & 0xFF;
    var green = (num >> 8) & 0xFF;
    var blue = num & 0xFF;
    
    // Return the GameMaker color
    return make_colour_rgb(red, green, blue);
}
/*
// Example usage
var myColor = hex_to_color("#FF5733"); // Converts the hex code to a GameMaker color
draw_set_colour(myColor); // Sets the drawing color
draw_circle(100, 100, 50, true); // Draws a circle with the color derived from the hex code
*/