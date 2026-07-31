arg_query_index = argument2;
neighboring_othercolor = false;

for (nn = 0; nn < 4 ; nn += 1)
    {
    neighbi = argument0 + cardtoi(nn);
    neighbj = argument1 + cardtoj(nn);
    
    if (arg_query_index < 0)
        {
        if (onboard(neighbi,neighbj) && (buildingarray[neighbi,neighbj] > 0) && (buildingarray[neighbi,neighbj] != -arg_query_index))
            {
            neighboring_othercolor = true;
            return neighboring_othercolor;
            }
        }
    else if (arg_query_index > 0)
        {
        if (onboard(neighbi,neighbj) && (buildingarray[neighbi,neighbj] != 0) && (buildingarray[neighbi,neighbj] != abs(arg_query_index)))
            {
            neighboring_othercolor = true;
            return neighboring_othercolor;
            }
        }
    }
return neighboring_othercolor;
