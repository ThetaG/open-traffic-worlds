arg_i = argument0;
arg_j = argument1;

num_neighbors_output = 0;

if ((intersectionarray[arg_i,arg_j] >= 1) && (intersectionarray[arg_i,arg_j] <= 3))
    {
    return num_neighbors_output;
    }

for (nn = 0; nn < 4 ; nn += 1)
    {
    neighbi = arg_i + cardtoi(nn);
    neighbj = arg_j + cardtoj(nn);
    
    if (onboard(neighbi,neighbj) && roadarray[neighbi,neighbj] && (cararray[neighbi,neighbj] > 0))
        {
        //if (intersection_allow(neighbi,neighbj,arg_i,arg_j,intersectionarray[neighbi,neighbj],intersectionstatearray[neighbi,neighbj],cararray[arg_i,arg_j]))
        //    {
        num_neighbors_output += 1;
        //    }
        }
    }
return num_neighbors_output;
