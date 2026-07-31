ipos = argument0;
jpos = argument1;
colorval = argument2;
alphaval = argument3;

draw_set_alpha(alphaval);
draw_set_color(colorval);

draw_rectangle(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,false);
//draw_rectangle(ipos*gridsize+1,jpos*gridsize+1,(ipos+1)*gridsize-1,(jpos+1)*gridsize-1,true);
//draw_rectangle(ipos*gridsize+2,jpos*gridsize+2,(ipos+1)*gridsize-2,(jpos+1)*gridsize-2,true);

draw_set_alpha(1);
