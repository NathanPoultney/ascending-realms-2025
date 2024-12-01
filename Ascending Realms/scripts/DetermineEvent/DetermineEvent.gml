/// @description determine what event is next and the weightings

/// @description SelectWeightedEvent()
/// @return Selected event name based on adjusted weights for rarity
function SelectWeightedEvent() {
    var totalWeight = 0;
    var cumulativeWeights = [];
    
    // Calculate total weight and prepare cumulative weights
    for (var i = 0; i < array_length(global.random_chance); i++) {
        var event = global.random_chance[i];
        var effectiveChance = 1.0 / event.chance;  // Inverse probability to make rare events less likely
        totalWeight += effectiveChance;
        cumulativeWeights[i] = totalWeight;
    }
    
    // Randomly select based on weight
    var randomValue = random(totalWeight);
    for (var i = 0; i < array_length(cumulativeWeights); i++) {
        if (randomValue <= cumulativeWeights[i]) {
            return global.random_chance[i].name;
        }
    }
    
    return "explore";  // Default event if something goes wrong
}

// Updated DetermineNextEvent function
function DetermineNextEvent() {
    if (global.gameState == GameState.EXPLORING) {
        var selectedEvent = SelectWeightedEvent();

        switch (selectedEvent) {
            case "mob_encounter":
                MobEncounter();
                global.gameState = GameState.MOB_ENCOUNTER;
                break;

            case "found_herb":
                FoundHerb();
                global.gameState = GameState.FOUND_HERB;
                break;

            case "explore":
                Explore();
                break;

            case "rare_event":
                // Call rare event function
                break;

            case "epic_event":
                // Call epic event function
                break;

            case "legendary_event":
                // Call legendary event function
                break;

            case "ultra_legendary_event":
                // Call ultra legendary event function
                break;

            case "cosmic_event":
                // Call cosmic event function
                break;

            default:
                Explore(); // Fallback if no valid event is selected
                break;
        }
    }
}