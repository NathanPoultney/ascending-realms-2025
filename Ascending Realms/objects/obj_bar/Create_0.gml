// Configurable properties
totalWidth = 200;
barWidth = undefined;
height = 6;
bgColor = make_colour_rgb(112, 3, 12);  // Dark red by default
fillColor = c_red;  // Red by default

// Dynamic values
current = 65;  // Default current value, can be set externally
maximum = 350;  // Default maximum value, can be set externally

// Optional parameters for positioning relative to another object
target_object = noone;  // Object to position the bar relative to
y_offset = -10;  // Vertical offset from the target object (default to above)

percentage = undefined;
