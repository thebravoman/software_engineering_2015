var equation = function(a, b, c){
    var d = b*b - 4*a*c;
    var x;
    var x1, x2, peak_x, peak_y, cordinata_peak_x,  cordinata_peak_y;
    x1 = -b + sqrt(d)/ 2*a;
    x2 = -b - sqrt(d)/ 2*a;
    peak_x = -b/2*a;
    peak_y = ((4*a*c)-(b*b))/4*a; // -5/4
    cordinata_peak_y = (-2600 + (peak_y*345)); 
    if (a > 0) {    
        curve(  400, cordinata_peak_y,
                200 + 80/a , 0, 
                200 - 80/a , 0,
                200 + 80/a, -200 - 80/a
        );
    }
    else if (a < 0) {
        curve(  -200, -cordinata_peak_y - 400,
                200 + a*80, 400, 
                200 - a*80, 400,
                200 + a*80, -(200 - a*80)
        );
    }
};

var a = 1, b = -1, c = -2;
equation(a, b, c);

line(25,200, 375, 200);
line(200, 25, 200, 375);
var zero_cordinata_x = 203;
var zero_cordinata_y = 205;

for (var i = 1; i < 375 / 2; i++) {
    if (i%25 === 0) {
        fill(0, 0, 0);
        text(i/25, zero_cordinata_x, zero_cordinata_y -= 25);
    }
}

zero_cordinata_x = 200;
zero_cordinata_y = 215;
for (var i = 1; i < 375 / 2; i++) {
    if (i%25 === 0) {
        fill(0, 0, 0);
        text(i/25, zero_cordinata_x += 25, zero_cordinata_y);
    }
}

zero_cordinata_x = 190;
zero_cordinata_y = 215;
for (var i = 1; i < 375 / 2; i++) {
    if (i%25 === 0) {
        fill(0, 0, 0);
        text(-i/25, zero_cordinata_x -= 25, zero_cordinata_y);
    }
}


zero_cordinata_x = 203;
zero_cordinata_y = 205;
for (var i = 1; i < 375 / 2; i++) {
    if (i%25 === 0) {
        fill(0, 0, 0);
        text(-i/25, zero_cordinata_x, zero_cordinata_y += 25);
    }
}