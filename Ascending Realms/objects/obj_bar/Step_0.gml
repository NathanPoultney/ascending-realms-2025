// Ensure the bar follows the target object
if (instance_exists(target_object)) {
    // Update the position of the bar to be above the target object
    x = target_object.x;
    y = target_object.y + y_offset;
}