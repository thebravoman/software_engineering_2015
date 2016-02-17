for(var i=0;i<4;i++){
    for(var j=0;j<4;j++){
        fill(255, 0, 0);
        rect(i*20,j*20,18,18);
        fill(255, 255, 255);
        text(""+((i*4)+j),i*20+(11-textWidth(""+((i*4)+j)))/2 + 3,j*20 +15);
    }
}
