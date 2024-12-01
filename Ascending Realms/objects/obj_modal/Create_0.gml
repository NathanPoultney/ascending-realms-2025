// set default modal properties
if (!variable_instance_exists(self, "modalWidth")) {
    modalWidth = 400;  // Default width
}

if (!variable_instance_exists(self, "modalHeight")) {
    modalHeight = 300; // Default height
}

if (!variable_instance_exists(self, "modalText")) {
    modalText = "This is a modal pop-up!"; // Default text
}

depth = global.depth.defaultModal; // A low depth value to ensure it's on top