/// @description Insert description here
// You can write your code in this editor

var random_size = random_range(0.3, 0.8);

image_xscale = random_size; // 0.4 default
image_yscale = random_size; // 0.4 default

gravity = 0.6;
hspeed = 0;
vspeed = 0;
friction = 0.95; // Adjust this value as needed, closer to 1 means less friction

// Create Event of obj_ball
var sprite_choice = irandom(4); // Generates a random integer between 0 and 4

switch (sprite_choice) {
    case 0:
        sprite_index = spr_enemy_unit;
        break;
    case 1:
        sprite_index = spr_neutral_unit;
        break;
    case 2:
        sprite_index = spr_player_unit;
        break;
	case 3:
		sprite_index = spr_mini_aus;
		break;
	case 4:
		sprite_index = spr_credits_shark;
		break;
}