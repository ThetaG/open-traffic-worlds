arg_i = argument0;
arg_j = argument1;

for (buildi = arg_i-1 ; buildi <= arg_i+1 ; buildi += 1)
    {
    for (buildj = arg_j-1 ; buildj <= arg_j+1 ; buildj += 1)
        {
        if (onboard(buildi,buildj) && (roadarray[buildi,buildj] == 0) && (buildingarray[buildi,buildj] == 0))
            {
            obstaclearray[buildi,buildj] = true;
            }
        }
    }


