maxtries = 1000;
tries = 0;

obstacle_trystep();
//tryi = irandom(maxi-1);
//tryj = irandom(maxj-1);

while ((tries < maxtries) && (roadarray[tryi,tryj] || (buildingarray[tryi,tryj] != 0)))
    {
    tries += 1;
    
    obstacle_trystep();
    }
    
if (tries < maxtries)
    {
    create_obstacle(tryi,tryj);
    global.passtryi = tryi;
    global.passtryj = tryj;
    with (instance_create(0,0,square_effect))
        {
        colorval = c_black;
        maxalphaval = 0.6;
        ipos = global.passtryi;
        jpos = global.passtryj;
        alphaspeed = 3/60;
        }
    }
