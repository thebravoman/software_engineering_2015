var equation_root1 = function(a, b, c) {
  return (-b + sqrt(b*b - 4*a*c))/2*a;
};
var equation_root2 = function(a, b, c) {
  return (-b - sqrt(b*b - 4*a*c))/2*a;
};
  
var x1 = equation_root1(4, -20, 1);
var x2 = equation_root2(4, -20, 1);
  
var y1 = 0;
var y2 = 1;
  
beginShape();
  curveVertex(x2, y2);
  curveVertex(0, y1);
  curveVertex(50, 100);
  curveVertex(x1, y1);
  curveVertex(50, 100);
  curveVertex(0,y1);
  curveVertex(x2,y2);
endShape();


