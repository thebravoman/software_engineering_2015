var middle = 200;

line(middle, 0, middle, middle * 2);
line(0, middle, middle * 2, middle);

var graphLinearEq = function(a, b) {
    var x1 = (-b) / a;
    var y1 = 0;
    var x2 = 0;
    var y2 = b;
    
    println("{x1 = " + x1 + ", y1 = " + y1 + "}, {x2 = " + x2 + ", y2 = " + y2 + "}");
    line(middle + x1 * 10, middle, middle, middle - y2 * 10);
};

graphLinearEq(2, 6);
