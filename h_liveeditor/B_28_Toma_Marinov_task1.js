var draww = function(a, b) {
    var find_x = function(first_value, second_value) {
        var result;
        result = -second_value/first_value;
        
        return result;
    };
    
    var x = find_x(a, b);
    var y = b;
    
    line(x, 0, 50, y);
};

draww(50, 50);