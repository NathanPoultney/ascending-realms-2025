function SetGameResolution(res_width, res_height) {
    // Validate input
    if (res_width == undefined || res_height == undefined || res_width <= 0 || res_height <= 0) {
        res_width = 1024;
        res_height = 768;
        show_debug_message("Resolution not specified. Setting the default of " + string(res_width) + "x" + string(res_height));
        return false;
    }

    // Set the window size and center it on the display
    window_set_size(res_width, res_height);
    window_set_position((display_get_width() - res_width) / 2, (display_get_height() - res_height) / 2);

    // Resize the application surface to match the new resolution
    surface_resize(application_surface, res_width, res_height);
    draw_clear(c_black);  // Clear the surface after resizing to avoid any remnants

    // Set the view and viewport sizes to match the new resolution
    global.camera.view_w = min(room_width, res_width);
    global.camera.view_h = min(room_height, res_height);

    // Define panning constraints
    var pan_margin = 50;
    var max_view_x = room_width - global.camera.view_w + pan_margin;
    var max_view_y = room_height - global.camera.view_h + pan_margin;

    // Enable the view and set the camera size and position within the allowed range
    view_enabled = true;
    camera_set_view_size(view_camera[0], global.camera.view_w, global.camera.view_h);
    global.camera.cam_x = clamp(global.camera.cam_x, -pan_margin, max_view_x);
    global.camera.cam_y = clamp(global.camera.cam_y, -pan_margin, max_view_y);
    camera_set_view_pos(view_camera[0], global.camera.cam_x, global.camera.cam_y);

    // Set the viewport to match the window size
    view_wport[0] = res_width;
    view_hport[0] = res_height;

    // Update the global measurements to reflect the new resolution
    global.default_measurements.room_horizontal_width = res_width;
    global.default_measurements.room_vertical_height = res_height;

    global.measurements.room_center_horizontal = res_width / 2;
    global.measurements.room_center_vertical = res_height / 2;

    // Refresh the display to ensure everything is rendered correctly
    window_set_rectangle(window_get_x(), window_get_y(), res_width, res_height);

    return true;
}