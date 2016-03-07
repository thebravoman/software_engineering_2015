var x1, x2, y1, y2, i;
var a, b, tx = 10, ty = 200;
a = 10;
b = 5;

line(0,200,400,200);
line(200,0,200,400);

fill(255, 0, 0);

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

x1 = -b/a;
y1 = 0;

x2 = 0;
y2 = b;

fill(0, 0, 0);
line(x1*20+200,200-25*y1,x2*20+200,200-y2*25);
