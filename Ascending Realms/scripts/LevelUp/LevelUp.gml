// XP requirement for next level
function XPRequiredForNextLevel(currentLevel) {
	return round(power((currentLevel / 0.07), 2));
}

function LevelUp() {
	// check if the player is eligible to level up
	if(global.player.currentXP >= global.player.requiredXP) {
		global.player.currentXP = 0; // reset players current XP to zero
		global.player.level += 1; // increase player level by 1
		global.player.requiredXP = XPRequiredForNextLevel(global.player.level); // set the XP requirement for the next level up


	    // Modal does not exist, so create it
	    var modalInstance = instance_create_layer(0, 0, "Instances", obj_modal);
		modalInstance.modalText = "Level up! [Lvl " + string(global.player.level) + "] spacebar to close";
		modalInstance.modalWidth = 560;
		modalInstance.modalHeight = 120;
		modalInstance.x = (window_get_width() / 2) - (modalInstance.modalWidth / 2);
		modalInstance.y = (window_get_height() / 2) - (modalInstance.modalHeight / 2);
	}
	
	return;
}