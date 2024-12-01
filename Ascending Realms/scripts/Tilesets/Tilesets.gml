// Function to get color based on tile ID
function get_tile_color(tile_id) {
    // Map tile IDs to specific colors
    switch(tile_id) {
        case 1: return c_green;    // Grass
        case 2: return make_colour_rgb(203, 189, 147);  // Sand
        case 3: return make_colour_rgb(203, 189, 147);  // Sand
        case 18: return make_colour_rgb(139, 69, 19); // Dirt
		case 19: return make_colour_rgb(139, 69, 19); // Dirt 
        case 20: return make_colour_rgb(159, 148, 132);  // Stone
        case 21: return make_colour_rgb(159, 148, 132);  // Stone
		case 37: return make_colour_rgb(131, 192, 242);    // Blue (Water)
		case 38: return make_colour_rgb(131, 192, 242);    // Blue (Water)
        // Add more cases based on your specific tile IDs
        default: return c_white;   // Default color for unknown tiles
    }
}