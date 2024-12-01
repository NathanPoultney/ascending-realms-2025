/// @description Insert description here
// You can write your code in this editor

// Apply gravity
vspeed += gravity;

// Update position
x += hspeed;
y += vspeed;

// Apply friction
hspeed *= friction;
vspeed *= friction;

// Stop the ball if speed is very low
if (abs(hspeed) < 0.1) hspeed = 0;
if (abs(vspeed) < 0.1) vspeed = 0;

// Collision with the floor
if (y >= global.default_measurements.room_vertical_height - sprite_height / 2) {
    y = global.default_measurements.room_vertical_height - sprite_height / 2; // Keep the ball above the floor
    vspeed *= -0.8; // Reverse vertical speed and apply bounce factor

    // Additional: Make vspeed more negative to increase bounce height
    // vspeed -= additionalBounce;
}

// Check for collision with left and right room boundaries
if (x < sprite_width / 2) {
    x = sprite_width / 2; // Keep the ball inside the room
    hspeed *= -1; // Reverse horizontal direction
} else if (x > global.default_measurements.room_horizontal_width - sprite_width / 2) {
    x = global.default_measurements.room_horizontal_width - sprite_width / 2; // Keep the ball inside the room
    hspeed *= -1; // Reverse horizontal direction
}

// Check for collision with the top room boundary
if (y < sprite_height / 2) {
    y = sprite_height / 2; // Keep the ball inside the room
    vspeed *= -1; // Reverse vertical direction
}
