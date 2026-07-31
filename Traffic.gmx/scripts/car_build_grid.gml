grid = mp_grid_create(0, 0, room_width / global.grid_size, room_height / global.grid_size, global.grid_size, global.grid_size);

for (i = 0 ; i < global.maxi ; i += 1)
    {
    for (j = 0 ; j < global.maxj ; j += 1)
        {
        mp_grid_add_cell(grid,i,j);
        
        if (instance_position(i*global.grid_size + global.grid_size/2,j*global.grid_size + global.grid_size/2,road))
            {
            mp_grid_clear_cell(grid,i,j);
            }
        if ((instance_position(i*global.grid_size + global.grid_size/2,j*global.grid_size + global.grid_size/2,home)))
            {
            if ((instance_position(i*global.grid_size + global.grid_size/2,j*global.grid_size + global.grid_size/2,home)).index == index)
                {
                mp_grid_clear_cell(grid,i,j);
                }
            }
        if ((instance_position(i*global.grid_size + global.grid_size/2,j*global.grid_size + global.grid_size/2,business)))
            {
            if ((instance_position(i*global.grid_size + global.grid_size/2,j*global.grid_size + global.grid_size/2,business)).index == index)
                {
                mp_grid_clear_cell(grid,i,j);
                targetx = i*global.grid_size + global.grid_size/2;
                targety = j*global.grid_size + global.grid_size/2;
                }
            }
        }
    }
