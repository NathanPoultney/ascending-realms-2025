// @description Checks if a value exists in an array.
// @param _array The array to search through.
// @param _value The value to check for in the array.
// @return Returns true if the value exists in the array, false otherwise.
function array_exists(_array, _value) {
    for (var _i = 0; _i < array_length(_array); _i++) {
        if (_array[_i] == _value) {
            return true;
        }
    }
    return false;
}

// @description Adds a value to the end of an array.
// @param _array The array to which the value will be added.
// @param _value The value to add to the array.
// @return No return value, modifies the array by appending the new value.
function array_push(_array, _value) {
    var _length = array_length(_array);
    _array[_length] = _value;
}

// @description Removes a value from an array.
// @param _array The array to remove the value from.
// @param _value The value to be removed.
// @return The modified array with the value removed (if found).
function array_remove(_array, _value) {
    var _newArray = [];
    for (var _i = 0; _i < array_length(_array); _i++) {
        if (_array[_i] != _value) {
            array_push(_newArray, _array[_i]);
        }
    }
    return _newArray;
}

// @description Inserts a value at a specified index in an array.
// @param _array The array to insert the value into.
// @param _value The value to insert.
// @param _index The index at which to insert the value.
// @return The modified array with the value inserted.
function array_insert(_array, _value, _index) {
    var _newArray = [];
    for (var _i = 0; _i < _index; _i++) {
        array_push(_newArray, _array[_i]);
    }
    array_push(_newArray, _value);
    for (var _i = _index; _i < array_length(_array); _i++) {
        array_push(_newArray, _array[_i]);
    }
    return _newArray;
}

// @description Finds the index of a value in an array.
// @param _array The array to search through.
// @param _value The value to find in the array.
// @return The index of the value if found, -1 if not found.
function array_find_index(_array, _value) {
    for (var _i = 0; _i < array_length(_array); _i++) {
        if (_array[_i] == _value) {
            return _i;
        }
    }
    return -1;
}

// @description Reverses the elements of an array.
// @param _array The array to reverse.
// @return The reversed array.
function array_reverse(_array) {
    var _newArray = [];
    for (var _i = array_length(_array) - 1; _i >= 0; _i--) {
        array_push(_newArray, _array[_i]);
    }
    return _newArray;
}

// @description Randomly shuffles the elements of an array.
// @param _array The array to shuffle.
// @return The shuffled array.
function array_shuffle(_array) {
    var _newArray = _array;
    for (var _i = array_length(_newArray) - 1; _i > 0; _i--) {
        var _j = irandom(_i);
        var _temp = _newArray[_i];
        _newArray[_i] = _newArray[_j];
        _newArray[_j] = _temp;
    }
    return _newArray;
}

// @description Creates a copy of an array.
// @param _array The array to clone.
// @return The cloned array.
function array_clone(_array) {
    var _newArray = [];
    for (var _i = 0; _i < array_length(_array); _i++) {
        array_push(_newArray, _array[_i]);
    }
    return _newArray;
}

// @description Calculates the sum of the elements in an array.
// @param _array The array of numbers.
// @return The sum of all numeric elements.
function array_sum(_array) {
    var _sum = 0;
    for (var _i = 0; _i < array_length(_array); _i++) {
        _sum += _array[_i];
    }
    return _sum;
}

// @description Checks if a value exists in an array.
// @param _array The array to search through.
// @param _value The value to check for in the array.
// @return Returns true if the value exists in the array, false otherwise.
function array_contains(_array, _value) {
    return array_find_index(_array, _value) != -1;
}

// @description Removes a value from an array by index.
// @param _array The array to remove the value from.
// @param _index The index of the value to be removed.
// @return The modified array with the value removed.
function array_remove_by_index(_array, _index) {
    var _newArray = [];
    for (var _i = 0; _i < array_length(_array); _i++) {
        if (_i != _index) {
            array_push(_newArray, _array[_i]);
        }
    }
    return _newArray;
}

// @description Finds the maximum value in an array of numbers.
// @param _array The array to find the max value in.
// @return The maximum value in the array.
function array_max(_array) {
    var _max = _array[0];
    for (var _i = 1; _i < array_length(_array); _i++) {
        if (_array[_i] > _max) {
            _max = _array[_i];
        }
    }
    return _max;
}

// @description Finds the minimum value in an array of numbers.
// @param _array The array to find the min value in.
// @return The minimum value in the array.
function array_min(_array) {
    var _min = _array[0];
    for (var _i = 1; _i < array_length(_array); _i++) {
        if (_array[_i] < _min) {
            _min = _array[_i];
        }
    }
    return _min;
}