if (!menupresent)
    {
    if (keyboard_check(intersection_holdkey))
        {
        if (roadarray[mousei,mousej] && (intersectionarray[mousei,mousej] > 0) && (intersectionarray[mousei,mousej] <= 3))
            {
            //if (intersectionholdi == mousei && intersectionholdj == mousej)
            if (intersection_double_volatile)
                {
                intersection_double_volatile = false;
                if (!soundmute)
                    {
                    audio_play_sound(ctrl_adjust,0,false);
                    }
                if (intersectionstatearray[mousei,mousej])
                    {
                    intersectiontimerset1array[mousei,mousej] += intersectiontimerdefault;
                    global.temp_int_inc_amount = floor(intersectiontimerset1array[mousei,mousej]/intersectiontimerdefault);
                    //intersectiontimerarray[mousei,mousej] += intersectiontimerdefault;
                    }
                else
                    {
                    intersectiontimerset2array[mousei,mousej] += intersectiontimerdefault;
                    //intersectiontimerarray[mousei,mousej] += intersectiontimerdefault;
                    global.temp_int_inc_amount = floor(intersectiontimerset2array[mousei,mousej]/intersectiontimerdefault);
                    }
                with (instance_create(0,0,intersection_double_effect))
                    {
                    int_inc_amount = global.temp_int_inc_amount;
                    }
                }
                /*
                intersectionhold += 1;
                if (intersectionhold == 0)
                    {
                    //intersection_temp_timer = intersectiontimerarray[mousei,mousej];
                    }
                    
                if (intersectionstatearray[mousei,mousej])
                    {
                    intersectiontimerset1array[mousei,mousej] = intersectionhold;
                    intersectiontimerarray[mousei,mousej] = 1;
                    }
                else
                    {
                    intersectiontimerset2array[mousei,mousej] = intersectionhold;
                    intersectiontimerarray[mousei,mousej] = 1;
                    }
                */
            /*
                }
            else
                {
                intersectionhold = 0;
                //intersectionholdi = mousei;
                //intersectionholdj = mousej;
                }
            */
            }
        }
    else
        {
        intersectionhold = 0;
            
        if (volatile && roadarray[mousei,mousej])
            {
            intersectionarray[mousei,mousej] = hotkey_select;
            if (!soundmute)
                {
                audio_play_sound(place_intersection,0,false);
                }
                
            if (intersectionarray[mousei,mousej] >= maxintersectiontypes)
                {
                intersectionarray[mousei,mousej] = 0;
                }
                
            if (intersectionarray[mousei,mousej] == 0)
                {
                intersectionstatearray[mousei,mousej] = true;
                intersectiontimerarray[mousei,mousej] = intersectiontimerdefault;
                intersectiontimerset1array[mousei,mousej] = intersectiontimerdefault;
                intersectiontimerset2array[mousei,mousej] = intersectiontimerdefault;
                }
            }
        
        if (onboard(mousei,mousej) && (buildingarray[mousei,mousej] == 0) && !obstaclearray[mousei,mousej])
            {
            if (!roadarray[mousei,mousej])
                {
                if (money >= roadcost)
                    {
                    placedwhilepaused[mousei,mousej] = pause;
                    money -= roadcost;
                    roadarray[mousei,mousej] = true;
                    moneystring = "Road:  -$" + string(roadcost);
                    moneystringalpha = 1;
                    moneystringcolor = c_red;
                    roadcount += 1;
                    if (!soundmute)
                        {
                        audio_play_sound(place_road,0,false);
                        }
                    }
                else
                    {
                    moneystring = "Can't afford road!";
                    moneystringalpha = 1;
                    moneystringcolor = c_red;
                    if (!soundmute && volatile)
                        {
                        audio_play_sound(cant_place,0,false);
                        }
                    }
                }
            }
            
        volatile = false;
        }
    }
    
    /*
    if (startclicking)
        {
        startclicking = false;
        oldmousex = toxy(mousei);
        oldmousey = toxy(mousej);
        }
    
    newmousex = toxy(mousei);
    newmousey = toxy(mousej);
    
    path_clear_points(mousepath);
    path_add_point(mousepath,oldmousex,oldmousey,100);
    path_add_point(mousepath,newmousex,newmousey,100);
    discretize_path(mousepath,mouselisti,mouselistj);
    
    for (k = 0; k < ds_list_size(mouselisti); k += 1)
        {
        tempmousei = ds_list_find_value(mouselisti,k);
        tempmousej = ds_list_find_value(mouselistj,k);
        if (onboard(tempmousei,tempmousej) && (buildingarray[tempmousei,tempmousej] == 0))
            {
            roadarray[tempmousei,tempmousej] = true;
            }
        }
    
    
        
        
    oldmousex = newmousex;
    oldmousey = newmousey;
    */
