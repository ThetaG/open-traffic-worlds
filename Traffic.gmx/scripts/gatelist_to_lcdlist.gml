arg_gatelist = argument0;
arg_lcdlist = argument1;

kk = 0;
current_index = arg_gatelist[kk];

while ((kk < maxindices) && (arg_gatelist[kk] > 0))
    {
    if (kk == 0)
        {
        arg_lcdlist[@ 0] = arg_gatelist[kk];
        arg_lcdlist[@ 1] = arg_gatelist[kk];
        arg_lcdlist[@ 2] = arg_gatelist[kk];
        arg_lcdlist[@ 3] = arg_gatelist[kk];
        arg_lcdlist[@ 4] = arg_gatelist[kk];
        }
    else if (kk == 1)
        {
        //arg_lcdlist[@ 0] = arg_gatelist[kk];
        //arg_lcdlist[@ 1] = arg_gatelist[kk];
        //arg_lcdlist[@ 2] = arg_gatelist[kk];
        //arg_lcdlist[@ 3] = arg_gatelist[kk];
        arg_lcdlist[@ 4] = arg_gatelist[kk];
        }
    else if (kk == 2)
        {
        //arg_lcdlist[@ 0] = arg_gatelist[kk];
        //arg_lcdlist[@ 1] = arg_gatelist[kk];
        arg_lcdlist[@ 2] = arg_gatelist[kk - 1];
        arg_lcdlist[@ 3] = arg_gatelist[kk - 1];
        arg_lcdlist[@ 4] = arg_gatelist[kk];
        }
    else if (kk == 3)
        {
        //arg_lcdlist[@ 0] = arg_gatelist[kk];
        arg_lcdlist[@ 1] = arg_gatelist[kk - 2];
        arg_lcdlist[@ 2] = arg_gatelist[kk - 1];
        arg_lcdlist[@ 3] = arg_gatelist[kk];
        arg_lcdlist[@ 4] = arg_gatelist[kk];
        }
    else if (kk == 4)
        {
        //arg_lcdlist[@ 0] = arg_gatelist[kk];
        //arg_lcdlist[@ 1] = arg_gatelist[kk];
        //arg_lcdlist[@ 2] = arg_gatelist[kk];
        //arg_lcdlist[@ 3] = arg_gatelist[kk];
        arg_lcdlist[@ 4] = arg_gatelist[kk];
        }
    
    
    kk += 1;
    }



