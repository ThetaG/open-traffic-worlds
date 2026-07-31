starti = argument0;
startj = argument1;
endi = argument2;
endj = argument3;

arg_ilist = argument4;
arg_jlist = argument5;

arg_athome = argument6;

for (ii = 0; ii < maxi ; ii += 1)
    {
    for (jj = 0; jj < maxj ; jj += 1)
        {
        mp_grid_add_cell(grid,ii,jj);
        
        if (ii == starti && jj == startj)
            {
            mp_grid_clear_cell(grid,ii,jj);
            }
        if (ii == endi && jj == endj)
            {
            mp_grid_clear_cell(grid,ii,jj);
            }
        if (roadarray[ii,jj] && !((intersectionarray[ii,jj] >= 4) && (!kthbittrue(intersectionarray[ii,jj] - 4,cararray[starti,startj] - 1))) && (arg_athome || ((cararray[ii,jj] == 0) || (cartimersetarray[ii,jj] < cartimermax))) && !((is_ns_adjacent(starti,startj,ii,jj) && (intersectionarray[ii,jj] == 3)) || (is_we_adjacent(starti,startj,ii,jj) && (intersectionarray[ii,jj] == 2))))
            {
            mp_grid_clear_cell(grid,ii,jj);
            }
        
        }
    }
    
is_path = mp_grid_path(grid, path, starti*gridsize + gridsize/2, startj*gridsize + gridsize/2, endi*gridsize + gridsize/2, endj*gridsize + gridsize/2, false);
if (is_path)
    {
    discretize_path(path,arg_ilist,arg_jlist);
    }
return is_path;
