var box_width = 20,box_height = 20,x=20,y=20;
var space_between = 20;
var i,j;
var array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
var count = 0;
for(i=0;i<=(box_width+space_between)*3;i+=box_width+space_between){
    for (j=0;j<=(box_height+space_between)*3;j+=box_height+space_between){
        fill(Math.random()*255,Math.random()*255,Math.random()*255);
        rect(x+i,y+j,box_width,box_height);
        fill(0,0,0);
        text(array[count],x+i+6,y+j+6,16,16);
        count++;
    }
}
