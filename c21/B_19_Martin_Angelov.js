var array = [0,1,2,3,4,5,6,7,8,9];
var length = array.length;
var count, count2;

for (count = 0; count < length; count++) { 
    for(count2=0; count2< 5; count2++){
        fill(41, 16, 227);
        rect(count*20,count2*20,20,20);
        fill(10, 10, 10);
        text(""+((count*5)+count2),count*20+(10-textWidth(""+((count*5)+count2)))/2 + 5,count2*20 +15);
    }
}
