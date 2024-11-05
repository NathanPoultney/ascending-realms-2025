extends Node

# Example usage
# ResourceManager.add_resource("food", 50)  # Add 50 food
# ResourceManager.spend_resource("wood", 30)  # Spend 30 wood
# if ResourceManager.has_sufficient_resource("stone", 20):
#    print("Enough stone available")


# Define resource variables
var food = 0
var wood = 0
var ore = 0

# Define resource limits
var max_food = 1000
var max_wood = 1000
var max_ore = 1000

# Initialize resources
func initialize_resources(f: int, w: int, o: int):
	food = f
	wood = w
	ore = o

# Add resources
func add_resource(type: String, amount: int):
	match type:
		"food":
			food = min(food + amount, max_food)
		"wood":
			wood = min(wood + amount, max_wood)
		"ore":
			ore = min(ore + amount, max_ore)

# Spend resources
func spend_resource(type: String, amount: int) -> bool:
	match type:
		"food":
			if food >= amount:
				food -= amount
				return true
		"wood":
			if wood >= amount:
				wood -= amount
				return true
		"ore":
			if ore >= amount:
				ore -= amount
				return true
	return false  # Not enough resources

# Check resource levels
func has_sufficient_resource(type: String, amount: int) -> bool:
	match type:
		"food":
			return food >= amount
		"wood":
			return wood >= amount
		"ore":
			return ore >= amount
	return false
