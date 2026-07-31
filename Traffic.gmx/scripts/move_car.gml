iold = argument0;
jold = argument1;

arg_inew = argument2;
arg_jnew = argument3;

arg_cararray = argument4;

arg_pathiarray = argument5;
arg_pathjarray = argument6;
arg_pathposarray = argument7;
        
arg_cartimerarray = argument8;
arg_cartimersetarray = argument9;

arg_pathmaxposarray = argument10;


arg_cararray[@ arg_inew,arg_jnew] = arg_cararray[iold,jold];

ds_list_copy(arg_pathiarray[@ arg_inew,arg_jnew],arg_pathiarray[iold,jold]);
ds_list_copy(arg_pathjarray[@ arg_inew,arg_jnew],arg_pathjarray[iold,jold]);
//arg_pathiarray[@ arg_inew,arg_jnew] = temppathi;
//arg_pathjarray[@ arg_inew,arg_jnew] = temppathj;
arg_pathposarray[@ arg_inew,arg_jnew] = arg_pathposarray[iold,jold];
arg_cartimerarray[@ arg_inew,arg_jnew] = arg_cartimerarray[iold,jold];
arg_cartimersetarray[@ arg_inew,arg_jnew] = arg_cartimersetarray[iold,jold];
arg_pathmaxposarray[@ arg_inew,arg_jnew] = arg_pathmaxposarray[iold,jold];

arg_cararray[@ iold,jold] = 0;
