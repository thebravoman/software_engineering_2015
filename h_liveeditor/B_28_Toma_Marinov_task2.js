var draww = function(a, b, c) {
    var find_solution = function(a, b, c, type) {
        var result;
        
        if(type === "first") {
            result = (-b + sqrt(b*b - 4*a*c))/2*a;
            
            return result;
        } else if(type === "second") {
            result = (-b - sqrt(b*b - 4*a*c))/2*a;
            
            return result;
        } else {
            result = -b/2*a;
            
            return result;
        }
    };
    
    var x1 = find_solution(a, b, c, "first");
    var x2 = find_solution(a, b, c, "second");
    
    var y1 = 0;
    var y2 = c;
    
    beginShape();
        curveVertex(x2, y2);
        curveVertex(0, y1);
        curveVertex(35, 150);
        curveVertex(x1, y1);
        curveVertex(x1, y1);
        curveVertex(35, 150);
        curveVertex(0, y1);
        curveVertex(x2, y2);
    endShape();
};

draww(1, -60, 25);