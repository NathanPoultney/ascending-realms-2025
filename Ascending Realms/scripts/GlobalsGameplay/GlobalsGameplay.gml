// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GlobalsGameplay() {
	GlobalsDepths();
	GlobalsHUD();
	GlobalsMiniMap();
	GlobalsHotkeys();
	GlobalsGameplayConfig();
	GlobalsBuildings();
	GlobalsUnits();	
	
}

function GlobalsDepths() {
	global.depth = {
		tipModal: -10001,
		objBuilding: -10,
		healthBar: -10000,
		objSettingsInterface: -10,
		defaultModal: -10000,
		objGlobalController: -10001,
		objUnit: -1000,
		objDebug: -10002
	}
}

function GlobalsHUD() {
	
	global.hud_top = {
		height: 50
	}
	
	global.hud_bot = {
		height: 200,
		object_display_square_size: 125
	}
	
}

function GlobalsMiniMap() {
	global.minimap = {
		minimap_size: 175, // Size of the minimap (square)
		obj_building_scaling: 3, // scale down (lower = smaller)
		obj_unit_scaling: 2,
		minimap_x: 0,
		minimap_y: 0
	};
}

function GlobalsHotkeys() {
	global.hotkey = {
		recruit_worker: "W",
		center_camera_on_castle: vk_home
	};
}

function GlobalsBuildings() {
	global.building_types = [obj_forest, obj_goldmine, obj_farm, obj_castle];	
}

function GlobalsUnits() {
	
	// Initialize the global array
	global.worker_instances = [];
	
	global.total_units = 0;
	
	global.unit_costs = {
		worker_food: 100
	}
	
	global.unit_speed = {
		worker: 0.5	
	};
	
}

function GlobalsGameplayConfig() {
	
	enum TEAMS 
	{
		NONE = 0,
		PLAYER = 1,
		ENEMY = 2,
		NEUTRAL = 9
	}
	
	global.player = {
		gold: 100,
		wood: 100,
		food: 100,
		// Define food consumption per unit per second
		food_consumption_per_unit: 0.01, // Each unit consumes 0.01 food per second
		max_food_consumption: 100, // Example maximum for full upkeep, adjust as needed
		total_food_consumption: 0
	}
	
	global.upkeep = 0;
	
	global.gold_production_rate = 0;
	global.wood_production_rate = 0;
	global.food_production_rate = 0;
		
}