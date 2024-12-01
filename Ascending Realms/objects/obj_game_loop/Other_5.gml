// Stop the music only if the next room is NOT main_menu or settings or credits
if(room != global.room_id.main_menu && room != global.room_id.settings && room != global.room_id.credits)
{
	StopMainMenuTheme();
	show_debug_message("-> Stopped Main Menu Theme song.");
}