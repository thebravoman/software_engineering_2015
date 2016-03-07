var equation = function(a, b, y)
{

    var x = y - b/a;
    return x;
};

var a = 7;
var b = 17;
var y = 27;
var a1 = 600;
var b1 = 700;
var y1 = 300;

var x = equation(a, b, y);
var x2 = equation(a1, b1, y1);
line(x, y, x2, y1);
