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
        a = 2; b = 6;
        a = 4; b = 8;
        a = 4; b = -8;
        a = -4; b = -8;
        a = -4; b = 8;
*/
var a = 2;
var b = 6;
//y = ax + b;

var x;
var y;
var x_ = 0;
var y_ = 0;

x = 0;
if(x === 0){
    y = a*x + b;
}
y_ = y;
fill(0, 0, 0);
text(y, 180+10, 175-y*10);

y = 0;
if(y === 0){
    x = -b/a;
}

println(x);
println(y_);

x_ = x;
text(x, 50+125+x*10, 160);

stroke(255, 0, 0);
line(180, 170-y_*10, 50+130+x_*10, 170);

text("y ="+a+"x + "+b,280,30, 100, 100);
