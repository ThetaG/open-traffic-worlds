ipos = argument0;
jpos = argument1;

arg_index = argument2;
arg_cararray = argument3;

arg_pathiarray = argument4;
arg_pathjarray = argument5;
arg_pathposarray = argument6;
        
arg_cartimerarray = argument7;
arg_cartimersetarray = argument8;

arg_pathmaxposarray = argument9;

arg_cararray[@ ipos,jpos] = arg_index;

arg_pathposarray[@ ipos,jpos] = 0;

ds_list_clear(arg_pathiarray[@ ipos,jpos]);
ds_list_clear(arg_pathjarray[@ ipos,jpos]);

arg_cartimerarray[@ ipos,jpos] = cartimermax;
arg_cartimersetarray[@ ipos,jpos] = cartimermax;

arg_pathmaxposarray[@ ipos,jpos] = 0;

success = calculate_path(ipos,jpos,business_loc_i[arg_index],business_loc_j[arg_index],arg_pathiarray[@ ipos,jpos],arg_pathjarray[@ ipos,jpos],true);

//temporary, will do something better to delete cars if no path
if (!success)
    {
    arg_cararray[@ ipos,jpos] = 0;
    }
else
    {
    arg_pathmaxposarray[@ ipos,jpos] = ds_list_size(arg_pathiarray[ipos,jpos]);
    }
