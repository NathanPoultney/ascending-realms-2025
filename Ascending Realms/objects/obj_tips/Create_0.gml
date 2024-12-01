// Randomly select a tip from the array
selected_tip = global.tips[irandom(array_length(global.tips) - 1)];

text = "Tip: " + string(selected_tip);

// Calculate the width of the selected tip
text_width = string_width(text);

// default width
modalWidth = 560;