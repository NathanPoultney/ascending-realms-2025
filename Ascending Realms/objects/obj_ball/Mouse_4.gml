/// @description Insert description here
// You can write your code in this editor

// Mouse Left Pressed Event of obj_ball
var throw_speed = 30; // Adjust as needed
var throw_angle = point_direction(x, y, mouse_x, mouse_y);
hspeed = lengthdir_x(throw_speed, throw_angle);
vspeed = lengthdir_y(throw_speed, throw_angle);