arg_xpos = argument0;
arg_ypos = argument1;
arg_halfwidth = argument2;
arg_alpha = argument3;
arg_iconpos = argument4;
arg_textpos = argument5;

arg_param1 = argument6;
arg_param2 = argument7;

arg_textstring = argument8;


draw_set_alpha(arg_alpha*0.5);
draw_set_color(c_white);
//draw_set_color(make_color_rgb(114,115,141));
draw_rectangle(arg_xpos - arg_halfwidth*control.gridsize,arg_ypos - 3*control.gridsize,arg_xpos + arg_halfwidth*control.gridsize,arg_ypos + control.gridsize,false);


for (editork = 0 ; editork < maxindices ; editork += 1)
    {
    drawsquare(arg_xpos/control.gridsize - 2.5 - 2/3 + (1 + 1/3)*editork,arg_ypos/control.gridsize - 2,index_to_color(editork+1,128 + 127*(kthbittrue(current_multigate,editork)),155 + 100*(kthbittrue(current_multigate,editork))),0.5);
    if (!kthbittrue(current_multigate,editork))
        {
        draw_set_color(c_gray);
        draw_set_alpha(0.5);
        drawx(arg_xpos/control.gridsize - 2.5 - 2/3 + (1 + 1/3)*editork,arg_ypos/control.gridsize - 2);
        }
    if (colorblind_mode)
        {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(med_goth);
        draw_text_shadow((arg_xpos/control.gridsize - 2.5 - 2/3 + (1 + 1/3)*editork + 1/2)*control.gridsize - 1,(arg_ypos/control.gridsize - 2 + 1/2)*control.gridsize + 1,string(editork + 1),c_black,c_white,1,control.colorblind_alph,0.5);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        }
    }

if (arg_param1 == 1)
    {
    drawintersection(arg_xpos/control.gridsize + arg_iconpos,arg_ypos/control.gridsize - 0.5,arg_param2,true,arg_alpha*0.5);
    }
    
draw_set_font(cent_goth);
draw_set_halign(fa_left);
draw_text_shadow(arg_xpos + arg_textpos*control.gridsize,arg_ypos - control.gridsize*0.5,arg_textstring,c_black,c_gray,2,arg_alpha,arg_alpha*0.7);

draw_set_alpha(1);
