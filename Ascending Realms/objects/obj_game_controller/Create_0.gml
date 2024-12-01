/// @description Insert description here
// You can write your code in this editor

if(room == global.map_id.valleyofblood)
{	
	// Create the fade-in transition object
	instance_create_layer(0, 0, "Instances", obj_transition);
	
	//CreateBuilding(347, 493, obj_farm);
	
	if(global.new_game == true)
	{
		CreateWorkersWithoutAssignments();
		show_debug_message("> CreateWorkersWithoutAssignments() initiated as new_game is true");
	}
	
}	