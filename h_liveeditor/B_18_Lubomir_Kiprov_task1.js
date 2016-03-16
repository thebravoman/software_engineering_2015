var drawline = function(a, b) {
    var x = -a / b;
    var y = b;
    line(x, 0, 100, y);
};

drawline(50, 50);
