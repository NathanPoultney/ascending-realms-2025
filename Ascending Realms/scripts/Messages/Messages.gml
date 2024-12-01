function AddMessage(new_message) {
    var ctime = global.message_time; // Get the current time in seconds
    var message_data = [
        new_message,  // The message text
        ctime, // The time the message was added
        false         // Fade out state (initially false)
    ];
    array_push(global.messages, message_data);
}

function UpdateMessages() {
    var ctime = global.message_time; // Get the current time in seconds
    for (var i = 0; i < array_length(global.messages); i++) {
        var msg = global.messages[i]; // Access the array element
        var msg_time = msg[1]; // Get the message creation time from the second element

        // Check if the message should start fading out
        if (ctime - msg_time > 7.0) {
            global.messages[i][2] = true; // Mark for fade-out
        }
    }

    // Remove messages that have faded out
    for (var i = array_length(global.messages) - 1; i >= 0; i--) {
        var msg = global.messages[i]; // Access the array element
        if (msg[2] && ctime - msg[1] > 8.0) {
            array_delete(global.messages, i, 1); // Remove message after 1 additional second for fading
        }
    }
}