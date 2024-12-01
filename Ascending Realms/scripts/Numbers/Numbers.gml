function FormatNumber(value) {
    if (value >= 10000) {
        return string_format(value / 1000, 0, 1) + "k";  // Format with one decimal and add "k"
    } else if (value >= 1000) {
        return AddCommasToNumber(value); // Add commas for thousands
    } else {
        return string(value);  // Return the exact number
    }
}

function AddCommasToNumber(value) {
    var str = string(value);
    var decimal_index = string_pos(".", str);
    
    // Separate the integer part and the decimal part
    var integer_part, decimal_part;
    if (decimal_index > 0) {
        integer_part = string_copy(str, 1, decimal_index - 1);
        decimal_part = string_copy(str, decimal_index, string_length(str) - decimal_index + 1);
    } else {
        integer_part = str;
        decimal_part = "";
    }
    
    // Insert commas in the integer part
    var length = string_length(integer_part);
    for (var i = length - 3; i > 0; i -= 3) {
        integer_part = string_insert(",", integer_part, i + 1);
    }
    
    // Return the formatted number
    return integer_part + decimal_part;
}
