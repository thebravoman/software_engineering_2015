var draw_f = function(a, b, c){
    var ITERATIONS = 10000;
    var X_OFFSET = 100;
    var Y_OFFSET = 100;
    var points = [];
    var x = -500;
    
    // y = ax^2 + bx + c
    for(var i = 0; i < ITERATIONS; i++){
        var y = a * x * x + b * x + c;
        points[i] = [x, y];
        
        x += 1;
    }
    
    for(var i = 0; i < ITERATIONS - 1; i++){
        line(points[i][0] + X_OFFSET, points[i][1] + Y_OFFSET, points[i + 1][0] + X_OFFSET, points[i + 1][1] + Y_OFFSET);
    }
};

draw_f(4, 5, 4);