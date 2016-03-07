line(180,40,180,310);
line(50, 130+40, 320, 130+40);

for(var i = 1; i <= 26; i+=1){
    line(i*10+50, 130+35, i*10+50, 130+45);
}

for(var i = 1; i <= 26; i+=1){
    line(175, i*10+40, 185 , i*10+40);
}

/*
    You can try with:
        a = 1; b = 4; c = -5;
        a = 1; b = 5; c = -6;
        a = 1; b = -3; c = -4;
        a = -2; b = -8; c = 10;
        a = 1; b = 2; c = -8;
*/
var a = 1;
var b = -4;
var c = -5;
//y = ax^2 + bx + c;

var x;
var x1;
var x2;
var y;
var y_ = 0;

x = 0;
if(x === 0){
    y = a*x*x + b*x + c;
}
y_ = y;
fill(0, 0, 0);
text(y, 180+10, 175-y*10);

y = 0;
if(y === 0){
    var D = b*b - 4*a*c;
    x1 = (-b+Math.sqrt(D))/(2*a);
    x2 = (-b-Math.sqrt(D))/(2*a);
}

println(x1);
println(x2);
println(y_);

text(x1, 50+125+x1*10, 160);
text(x2, 50+125+x2*10, 160);

noFill();
beginShape();
    curveVertex(50+125+x2*10, 160);
    curveVertex(50+129+x2*10, 170);
    curveVertex(180, 170-y_*10);
    curveVertex(50+132+x1*10, 170);
    curveVertex(50+132+x1*10, 170);
endShape();

text("y = ("+a+")x^2 + ("+b+")x + ("+c+")",220,30, 200, 200);
