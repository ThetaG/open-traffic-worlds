arg_x = argument0;
arg_y = argument1;
arg_str = argument2;
arg_col1 = argument3;
arg_col2 = argument4;
arg_offset = argument5;
arg_totalalpha = argument6;
arg_shadowalpha = argument7;

draw_set_alpha(arg_shadowalpha*arg_totalalpha);
draw_set_color(arg_col2);
draw_text(arg_x + arg_offset,arg_y + arg_offset,arg_str);
draw_set_alpha(arg_totalalpha);
draw_set_color(arg_col1);
draw_text(arg_x,arg_y,arg_str);

draw_set_alpha(1);

