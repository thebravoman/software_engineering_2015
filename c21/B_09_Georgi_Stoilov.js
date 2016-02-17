var count = 0;
for(var i = 0; i < 4; i+=1){
    for(var j = 0; j < 4; j+=1){
        fill(250, 0, 0);
        rect(i*50, j*50, 40, 40);
        fill(0, 0, 0);
        text(count,i*50+10, j*50+10, 50, 50);
        count+=1;
    }
}
