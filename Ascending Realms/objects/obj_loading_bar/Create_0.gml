// Initialize the bar dimensions
totalWidth = 200;
height = 6;

bgColor = undefined;
fillColor = undefined;
percentage = undefined;

// Initialize progress values
current = 0; // Start at 0 for the progress bar
maximum = 350;
barWidth = (current / maximum) * totalWidth;

// Timer variables
duration = 1; // Duration in seconds for the loading bar to reach full
elapsedTime = 0; // Time elapsed since the loading started

// Flag to indicate whether loading is complete
loadingComplete = false;