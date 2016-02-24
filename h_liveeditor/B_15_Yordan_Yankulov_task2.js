var fx = function(a,b,c)
{
    var x1 = (-b + sqrt(b^2 - 4*a*c))/2*a;
    return x1;
};
var fx1 = function(a,b,c)
{
    var x2 = (-b - sqrt(b^2 - 4*a*c))/2*a;
    return x2;
};
var a = 1;
var b = -40;
var c = 175;
var x1 = fx(a,b,c);
var x2 = fx1(a,b,c);
var y1 = 0;
var y2 = c;
var x3 = -b/2*a;
var y3 = a*x3*x3 + b * x3 + c^2;
beginShape();
noFill();
curveVertex(x2,y1);
curveVertex(0, y2);
curveVertex(x3,  -y3);
curveVertex(x1,  y1);
curveVertex(x1,  y1);
curveVertex(x3,  -y3);
curveVertex(0, y2);
curveVertex(x2,y1);
endShape();
