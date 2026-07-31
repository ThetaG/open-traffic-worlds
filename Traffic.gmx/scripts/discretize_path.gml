argpath = argument0;
newilist = argument1;
newjlist = argument2;

posinc = 0.5;
currentpos = 0;

ds_list_clear(newilist);
ds_list_clear(newjlist);

potentiali = toij(path_get_x(argpath,currentpos));
potentialj = toij(path_get_y(argpath,currentpos));

ds_list_add(newilist,potentiali);
ds_list_add(newjlist,potentialj);

oldi = potentiali;
oldj = potentialj;

oldpos = currentpos;

while (currentpos <= 1)
    {
    currentpos += posinc;
    
    potentiali = toij(path_get_x(argpath,currentpos));
    potentialj = toij(path_get_y(argpath,currentpos));
    
    if ((potentiali != oldi) || (potentialj != oldj))
        {
        if (taxicab(potentiali,potentialj,oldi,oldj) == 1)
            {
            ds_list_add(newilist,potentiali);
            ds_list_add(newjlist,potentialj);
            oldpos = currentpos;
            oldi = potentiali;
            oldj = potentialj;
            }
        else
            {
            posinc = posinc / 2;
            currentpos = oldpos;
            }
        }
    }



