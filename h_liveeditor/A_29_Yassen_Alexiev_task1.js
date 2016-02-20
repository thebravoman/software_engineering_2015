var equation = function(a, b){
    var x = -b/a;
    fill(0, 0, 0);
    line(200-(-x*25), 200 , 200, 200-(b*25));
};

var a = 3, b = 2;
equation(a, b);

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

zero_cordinata_x = 190;
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