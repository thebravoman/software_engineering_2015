var drawer = function(a, b) {
    var res = function(first_value, second_value) {
        var result = -second_value/first_value;
        return result;
    };

    var x = res(a, b);
    var y = b;

    line(x, 0, 50, y);
};
drawer(5, 8);
