arg_g = argument0;
arg_outputlist = argument1;

j_increment = 0;

for (kk = 0; kk < maxindices; kk += 1)
    {
    if (kthbittrue(arg_g,kk))
        {
        arg_outputlist[@ j_increment] = kk+1;
        j_increment += 1;
        }
    }
    
for (kk = j_increment; kk < maxindices ; kk += 1)
    {
    arg_outputlist[@ kk] = 0;
    }
