function UpdateCameraPanning() {
    var cam_speed = 10; // Speed of the camera movement

    // Keyboard-based panning
    if (keyboard_check(vk_left)) {
        global.camera.cam_x = max(0, global.camera.cam_x - cam_speed);
    } else if (keyboard_check(vk_right)) {
        global.camera.cam_x = min(room_width - global.camera.view_w, global.camera.cam_x + cam_speed);
    }

    if (keyboard_check(vk_up)) {
        global.camera.cam_y = max(0, global.camera.cam_y - cam_speed);
    } else if (keyboard_check(vk_down)) {
        global.camera.cam_y = min(room_height - global.camera.view_h, global.camera.cam_y + cam_speed);
    }

    // Apply the new camera position
    camera_set_view_pos(view_camera[0], global.camera.cam_x, global.camera.cam_y);
}


function CameraZoom() {
    var zoom_min = 0.5; // Minimum zoom (50% of the original size)
    var zoom_max = 1.5; // Maximum zoom (150% of the original size)
    var zoom_speed = 0.05; // How fast the zoom changes

    // Get the camera and its current view
    var cam = view_camera[0];

    // Calculate the cursor's position in room coordinates
    var mouse_room_x = global.camera.cam_x + (mouse_x / window_get_width()) * global.camera.view_w;
    var mouse_room_y = global.camera.cam_y + (mouse_y / window_get_height()) * global.camera.view_h;

    // Handle mouse scroll input
    if (mouse_wheel_up()) {
        global.current_zoom = max(global.current_zoom - zoom_speed, zoom_min);
    } else if (mouse_wheel_down()) {
        global.current_zoom = min(global.current_zoom + zoom_speed, zoom_max);
    }

    // Calculate the new view size based on the zoom level
    var new_view_w = 1024 * global.current_zoom; // Assuming default width is 1024
    var new_view_h = 768 * global.current_zoom; // Assuming default height is 768

    // Adjust the camera position to zoom towards the cursor
    global.camera.cam_x = mouse_room_x - (new_view_w * (mouse_x / window_get_width()));
    global.camera.cam_y = mouse_room_y - (new_view_h * (mouse_y / window_get_height()));

    // Ensure the camera stays within the room bounds
    global.camera.cam_x = clamp(global.camera.cam_x, 0, room_width - new_view_w);
    global.camera.cam_y = clamp(global.camera.cam_y, 0, room_height - new_view_h);

    // Update the camera's view size and position
    camera_set_view_size(cam, new_view_w, new_view_h);
    camera_set_view_pos(cam, global.camera.cam_x, global.camera.cam_y);

    // Update the global view size variables
    global.camera.view_w = new_view_w;
    global.camera.view_h = new_view_h;
}