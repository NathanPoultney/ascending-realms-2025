extends Node

var current_realm = 0  # Stores the current realm or level number
var faction_progress = {}  # Dictionary to track faction progress
var campaign_state = "incomplete"  # Campaign status (could be "incomplete", "complete", etc.)

func start_new_game():
	# Initialize or reset game progression variables
	current_realm = 0
	faction_progress.clear()
	campaign_state = "incomplete"

func save_game():
	# Code to save the current game state
	pass  # Implement your save logic here

func load_game():
	# Code to load the saved game state
	pass  # Implement your load logic here

func transition_to_scene(scene_path):
	# Changes the current scene to the specified one
	get_tree().change_scene(scene_path)


# Example usage in any other script
# GameFlowManager.start_new_game()  # Starts a new game
# $GameFlowManager.transition_to_scene("res://scenes/Level1.tscn")  # Transition to a new scene
