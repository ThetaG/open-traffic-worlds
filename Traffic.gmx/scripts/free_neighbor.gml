arg_i = argument0;
arg_j = argument1;

is_free_neighbor = false;

for (nn = 0; nn < 4 ; nn += 1)
    {
    neighbi = arg_i + cardtoi(nn);
    neighbj = arg_j + cardtoj(nn);
    
    if (onboard(neighbi,neighbj) && roadarray[neighbi,neighbj] && (cararray[neighbi,neighbj] == 0))
        {
        is_free_neighbor = true;
        return is_free_neighbor;
        }
    }
return is_free_neighbor;
