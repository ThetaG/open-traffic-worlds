maxtries = 500;
tries = 0;
arg_index = argument0;
arg_buildingarray = argument1;

business_loc_i = argument2;
business_loc_j = argument3;

is_start = argument4;

tryi = irandom(maxi-1);
tryj = irandom(maxj-1);

while ((tries < maxtries) && (roadarray[tryi,tryj] || (arg_buildingarray[tryi,tryj] != 0) || obstaclearray[tryi,tryj] || exist_neighboring_roads(tryi,tryj) || exists_neighboring_othercolor(tryi,tryj,arg_index) || ((arg_index < 0) && !exists_possible_path(tryi,tryj,business_loc_i[-arg_index],business_loc_j[-arg_index]))))
    {
    tries += 1;
    
    tryi = irandom(maxi-1);
    tryj = irandom(maxj-1);
    
    alphaspeed = 1/60;
    }
    
if (tries < maxtries)
    {
    create_building(tryi,tryj,arg_index,arg_buildingarray);
    
    if (!is_start)
        {
        if (!global.soundmute)
            {
            audio_play_sound(new_building,0,false);
            }
        }
        
    last_building_i = tryi;
    last_building_j = tryj;
    last_building_index = arg_index;
    global.passcolor = index_to_color(abs(arg_index),128 + 127*(arg_index > 0),200 + 55*(arg_index > 0));
    global.passtryi = tryi;
    global.passtryj = tryj;
    with (instance_create(0,0,square_effect))
        {
        colorval = global.passcolor;
        maxalphaval = 0.5;
        ipos = global.passtryi;
        jpos = global.passtryj;
        alphaspeed = 1/120;
        }
    if (arg_index > 0)
        {
        business_loc_i[@ arg_index] = tryi;
        business_loc_j[@ arg_index] = tryj;
        }
    else if (arg_index < 0)
        {
        total_homes += 1;
        housecountarray[-arg_index - 1] += 1;
        }
    }
    

