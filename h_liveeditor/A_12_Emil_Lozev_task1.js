var lineXY = function(a,b){
    var x1 = 0;
    var y1 = a*x1 + b;
    var x2 = 2;
    var y2 = a*y2 + b;
    line(200, 200, x1 + x2, y1 + y2);
};

lineXY(1,1);
