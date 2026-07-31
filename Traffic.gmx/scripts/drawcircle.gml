ipos = argument0;
jpos = argument1;
colorval = argument2;
alphaval = argument3;

draw_set_alpha(alphaval);
draw_set_color(colorval);

draw_circle(ipos*gridsize + gridsize/2,jpos*gridsize + gridsize/2,3*gridsize/8,false);

draw_set_alpha(1);
