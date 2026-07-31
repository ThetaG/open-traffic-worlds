//arg_i = argument0;
//arg_j = argument1;
neighboring_buildings = false;

for (nn = 0; nn < 4 ; nn += 1)
    {
    neighbi = argument0 + cardtoi(nn);
    neighbj = argument1 + cardtoj(nn);
    
    if (onboard(neighbi,neighbj) && roadarray[neighbi,neighbj])
        {
        neighboring_buildings = true;
        return neighboring_buildings;
        }
    }
return neighboring_buildings;
