arg_xpos = argument0;
arg_ypos = argument1;
arg_halfwidth = argument2;
arg_alpha = argument3;
arg_iconpos = argument4;
arg_textpos = argument5;

arg_param1 = argument6;
arg_param2 = argument7;

arg_textstring = argument8;

arg_blink = argument9;


draw_set_alpha(arg_alpha*0.5);
draw_set_color(c_white);
//draw_set_color(make_color_rgb(114,115,141));
draw_rectangle(arg_xpos - arg_halfwidth*control.gridsize,arg_ypos - control.gridsize,arg_xpos + arg_halfwidth*control.gridsize,arg_ypos + control.gridsize,false);

if (arg_param1 == 1)
    {
    drawintersection(arg_xpos/control.gridsize + arg_iconpos,arg_ypos/control.gridsize - 0.5,arg_param2,arg_blink,arg_alpha*0.5);
    }
    
draw_set_font(cent_goth);
draw_set_halign(fa_left);
draw_text_shadow(arg_xpos + arg_textpos*control.gridsize,arg_ypos - control.gridsize*0.5,arg_textstring,c_black,c_gray,2,arg_alpha,arg_alpha*0.7);

draw_set_alpha(1);
