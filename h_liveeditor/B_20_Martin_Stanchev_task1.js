var linear = function(a, b) {
    var first_point = 50;
    var last_point = 250;

    var x = a*first_point + b;
    var y = a*last_point + b;

    line(x, first_point, y, last_point );
};

linear(1,1);
