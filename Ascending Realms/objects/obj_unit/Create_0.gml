///@description Event
// Level, health, and assignment properties
level = 1;
unit_name = "Unnamed";  // Initialize with a default name or random generator
unit_type = "unassigned";
unit_team = TEAMS.PLAYER;
unit_sprite = "unassigned";
unit_currenthealth = 100;
unit_maxhealth = 100;
assigned_building = noone;  // No building assigned initially

// Initialize the reference to the target object and movement properties
target_object = noone; 
move_target_x = x;
move_target_y = y;
is_moving = false;
move_target_building = noone;  // Initialize the target building to noone

// Circular movement variables
angle = 0;  // Starting angle
radius = 50;  // Distance from the center
center_x = (window_get_width() / 2);  // Initial center x position
center_y = (window_get_height() / 2);  // Initial center y position

// Set visibility and depth
visible = true;

// Resize unit (scale down)
image_xscale = 0.3;
image_yscale = 0.3;

// Health bar properties
bar_totalWidth = 50;
bar_height = 5;
bar_y_offset = -20;  // 20 pixels above the unit
bar_bgColor = make_colour_rgb(112, 3, 12);  // Dark red
bar_fillColor = c_red;  // Red by default

// Initialize health bar values
bar_current = 0;
bar_maximum = 1;  // Start with 1 to avoid division by zero

// Selection state and ALT key state
selected = false;  // To be updated in your game logic

// Room where the unit is created
creation_room = room;  // Tracks the room in which the unit was created