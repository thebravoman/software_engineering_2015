var array = [0,1,2,3,4,5,6,7,8,9];
var length = array.length;
var i, j;

for (i = 0; i < length; i++) { 
    for(j=0; j< 5; j++){
        fill(150, 100, 200);
        rect(i*20,j*20,20,20);
        fill(255, 255, 255);
        text(""+((i*5)+j),i*20+(10-textWidth(""+((i*5)+j)))/2 + 5,j*20 +15);
    }
}
