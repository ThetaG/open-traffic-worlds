arg_cars_out = argument0;
//arg_cars_out = argument1;

/*
if (arg_cars_in == 0)
    {
    return -1;
    }
else
    {
    return arg_cars_out/arg_cars_in;
    }
*/
return arg_cars_out*(avghometimer - rush_effect/2)/(total_homes*flow_ratio_compute_interval);
