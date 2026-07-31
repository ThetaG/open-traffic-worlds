ipos = argument0;
jpos = argument1;
colorval = argument2;
alphaval = argument3;

draw_set_alpha(alphaval);
draw_set_color(colorval);

draw_rectangle(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,false);

draw_set_alpha(1);
