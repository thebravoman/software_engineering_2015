var arr = new Array(4);
var count = 0;

for(var i = 0; i < 4; i+=1){
    arr[i] = new Array(4);
    for(var j = 0; j < 4; j+=1){
        arr[i][j] = count;
        count+=1;
    }
}

for(var i = 0; i < 4; i+=1){
    for(var j = 0; j < 4; j+=1){
        fill(Math.random()*255, Math.random()*255, Math.random()*255);
        rect(j*50, i*50, 40, 40);
        fill(0, 0, 0);
        text(arr[i][j],j*50+10, i*50+10, 50, 50);
    }
}
