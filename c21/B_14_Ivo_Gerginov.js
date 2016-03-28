var array = [4][4];
var count = 0;

for(var i = 0; i < 4; i++)
{
    for(var j = 0; j < 4; j++)
    {
        fill(255, 200, 220);
        rect(j*22,i*22, 20, 20);
        fill(0, 0, 0);
        text(count,j*22 + 6, i*22 + 6, 100, 100);
        fill(255, 200, 220);
        count+=1;
    }
}


