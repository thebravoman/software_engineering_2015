var a = 1, b = 5, c = 6;
var x1, x2, y1, y2;
var peak;
var tx = 10, ty = 200;
var i;
line(0,200,400,200);
line(200,0,200,400);

fill(0, 0, 0);
textSize(14);

for(i = 9; i >= 1; i--) {
    text(-i,tx,ty);
    text(i,ty,tx);
    tx += 20;
}
tx += 30;
for(i = 1; i < 10; i++) {
    text(i,tx,ty);
    text(-i,ty,tx + 15);
    tx += 20;
}

var get_y = function(a,b,c,x) {
    return ((a*x*x)+(b*x)+c);
};

var drawLine = function(x1,y1,x2,y2) {
    line(25*x1+200,200-25*y1,25*x2+200,200-25*y2);
};

peak = (-b/(2*a));
var inc = 0.1;

for(i = 0; i < 100; i++) {
    x1 = peak;
    y1 = get_y(a,b,c,x1);
    x2 = x1 + inc;
    y2 = get_y(a,b,c,x2);
    drawLine(x1,y1,x2,y2);
    peak = x2;
}

inc = -0.1;
peak = -peak;

for(i = 0; i < 100; i++) {
    x1 = peak;
    y1 = get_y(a,b,c,x1);
    x2 = x1 - inc;
    y2 = get_y(a,b,c,x2);
    drawLine(x1,y1,x2,y2);
    peak = x2;
}