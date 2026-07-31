starti = argument0;
startj = argument1;
endi = argument2;
endj = argument3;

for (ii = 0; ii < maxi ; ii += 1)
    {
    for (jj = 0; jj < maxj ; jj += 1)
        {
        mp_grid_clear_cell(grid,ii,jj);
        
        if ((ii != starti || jj != startj) && (ii != endi || jj != endj))
            {
            if ((buildingarray[ii,jj] != 0) || (obstaclearray[ii,jj]))
                {
                mp_grid_add_cell(grid,ii,jj);
                }
            }
        
        }
    }
    
is_path = mp_grid_path(grid, path, starti*gridsize + gridsize/2, startj*gridsize + gridsize/2, endi*gridsize + gridsize/2, endj*gridsize + gridsize/2, false);
return is_path;
