var draw_f = function(a, b){
    var ITERATIONS = 20;
    var points = [];
    var x = 0;
    
    // y = ax + b
    for(var i = 0; i < ITERATIONS; i++){
        var y = a * x + b;
        points[i] = [x, y];
        
        x += 10;
    }
    
    for(var i = 0; i < ITERATIONS - 1; i++){
        line(points[i][0], points[i][1], points[i + 1][0], points[i + 1][1]);
    }
};

draw_f(5, 6);