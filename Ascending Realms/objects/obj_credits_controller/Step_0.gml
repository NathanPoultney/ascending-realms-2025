/// @description Insert description here
// You can write your code in this editor

if(instance_number(obj_ball) < ball_spawn_limit)
{
	if(keyboard_check_pressed(vk_space))
	{
	    // Generate a random position within the room boundaries
	    var random_x = random(global.default_measurements.room_horizontal_width);
	    var random_y = random(global.default_measurements.room_vertical_height);

		// Create an instance of obj_ball at the random position
	    instance_create_depth(random_x, random_y, 1, obj_ball);
	}	
}