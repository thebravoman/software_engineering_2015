var middle = 200;

var getQuadEqOutput = function(a, b, c, x) { 
    return a*x*x + b*x + c;
};

var graphQuadEq = function(a, b, c) {
    var x1 = (-b + Math.sqrt(Math.pow(b, 2) - 4*a*c)) / (2*a);
    var x2 = (-b - Math.sqrt(Math.pow(b, 2) - 4*a*c)) / (2*a);
    
    if (isNaN(x1) || isNaN(x2)) {
        println("No real roots.");   
    } else {
        println("{x1 = " + x1 + "}, {x2 = " + x2 + "}");
    }
        var outputs = [];
        
        for (var i = 0; i < 100; i++) {
            outputs[i] = [i, getQuadEqOutput(a, b, c, i)];
        }
        
        for (var i = 0; i < 99; i++) {
            line(middle + outputs[i][0], middle - outputs[i][1], 
                 middle + outputs[i+1][0], middle - outputs[i+1][1]);
        }
        for (var i = 0; i < 99; i++) {
            line(middle - outputs[i][0], middle - outputs[i][1], 
                 middle - outputs[i+1][0], middle - outputs[i+1][1]);
        }
};

graphQuadEq(1, -2, -3);
