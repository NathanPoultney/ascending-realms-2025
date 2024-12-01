/// @description Insert description here
// You can write your code in this editor

// Only call this if buildings need to be dynamically recreated
//RecreateStoredBuildings();

RecreateStoredWorkers();
global.isPaused = false;

if (room == global.map_id.valleyofblood) {
    
    // Create a new camera if it doesn't exist
    if (view_camera[0] == noone) {
        var cam = camera_create();
        view_camera[0] = cam;
    }

    // Set the camera's view size to 1024x768
    global.camera.view_w = 1024;
    global.camera.view_h = 768;
    camera_set_view_size(view_camera[0], global.camera.view_w, global.camera.view_h);

    // Set the camera's initial position (e.g., starting from the top-left corner)
    global.camera.cam_x = 0;
    global.camera.cam_y = 0;
    camera_set_view_pos(view_camera[0], global.camera.cam_x, global.camera.cam_y);

    // Ensure the view is enabled
    view_enabled = true;

	if(DEBUG_LEVEL == "ALL")
	{
	    // Add debug output to confirm camera setup
	    show_debug_message("Camera initialized at: " + string(global.camera.cam_x) + ", " + string(global.camera.cam_y));
	    show_debug_message("Camera view size: " + string(global.camera.view_w) + "x" + string(global.camera.view_h));
	}
}