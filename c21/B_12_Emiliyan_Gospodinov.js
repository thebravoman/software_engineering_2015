var i = 0, count = 0, j = 0;
var array = [];
for (i = 0; i < 16; i++) {
    array[i] = i;   
}
for (i = 0; i < 4; i++) {
    for (j = 0; j < 4; j++){
        fill(0, 255, 17);
        rect(10 + i * 60, 10 + j* 60, 50, 50);
        fill(0, 0, 0);
        text(array[count],30 + i * 60, 30 + j * 60, 30, 50);
        count++;
    }
}
