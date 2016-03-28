var arr = [1, 2, 3, 4];

for(var i = 0; i < arr.length; i++) {
    fill(255, 0, 0);
    rect(i * 50, 50, 50, 50);
    fill(0, 0, 0);
    text("test", i*55, 75);
}
