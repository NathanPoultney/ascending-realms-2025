// Only allow interaction if the dropdown menu is not open
if ((room == global.room_id.settings || room == global.room_id.credits) && !global.dropdown_open) {
    // Dynamically set the position 50px above the bottom of the room
    x = room_width / 2; // Center the button horizontally
    y = room_height - (sprite_height / 2) - 50; // 50px above the bottom of the room

    if (CheckClick() == true) {
        var _goto_room = "";

        switch (room_get_name(room)) {
            case "room_Settings":   
                _goto_room = global.room_id.main_menu;
                break;
            default:
                _goto_room = global.room_id.main_menu;
        }   

        room_goto(_goto_room);
    }
}