var array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
var i = 0;
var x = 20;
var y = 10;
rect(x,y,30,30);
for(i = 0; i !== array.length; i++)
{
    rect(x,y,30,30);  
    x = x + 45;
    if (i % 4 === 0 && i !== 0)
    {
        y = y + 50;
        x = 20;
    }
}
