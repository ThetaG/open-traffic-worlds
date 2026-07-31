ipos = argument0;
jpos = argument1;

arg_type = argument2;
arg_state = argument3;

arg_alphaval = argument4;

draw_set_alpha(arg_alphaval);

ofsout = gridsize/24;
ofsin = gridsize/6;

xout1 = ipos*gridsize - ofsout;
yout1 = jpos*gridsize - ofsout;
xout2 = (ipos + 1)*gridsize + ofsout;
yout2 = (jpos + 1)*gridsize + ofsout;

xin1 = ipos*gridsize + ofsin;
yin1 = jpos*gridsize + ofsin;
xin2 = (ipos + 1)*gridsize - ofsin;
yin2 = (jpos + 1)*gridsize - ofsin;

if (((arg_type >= 4) && (arg_type <= (4 + maxindices))))
    {
    draw_set_alpha(0.75*arg_alphaval);
    }

if (arg_type == 1)
    {
    draw_set_color(c_white);
    draw_rectangle(xout1,yout1,xout2,yout2,false);
    if (arg_state)
        {
        draw_set_color(c_lime);
        draw_rectangle(xin1,yout1,xin2,yout2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xout1,yout1,xin1,yout2,false);
        draw_rectangle(xin2,yout1,xout2,yout2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            draw_text_shadow((ipos + 1/2 + 0.5*cos(pi/2))*gridsize,(jpos + 1/2 - 0.5*sin(pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_text_shadow((ipos + 1/2 + 0.5*cos(3*pi/2))*gridsize,(jpos + 1/2 - 0.5*sin(3*pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    else
        {
        draw_set_color(c_lime);
        draw_rectangle(xout1,yin1,xout2,yin2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xout1,yout1,xout2,yin1,false);
        draw_rectangle(xout1,yin2,xout2,yout2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(pi))*gridsize,(jpos + 1/2 - 0.4*sin(pi))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(0))*gridsize,(jpos + 1/2 - 0.4*sin(0))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    
    
    /*
    if (arg_state)
        {
        draw_set_color(c_green);
        }
    else
        {
        draw_set_color(c_red);
        }
    //north,south
    draw_line_width(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize,gridsize/4);
    draw_line_width(ipos*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    if (arg_state)
        {
        draw_set_color(c_red);
        }
    else
        {
        draw_set_color(c_green);
        }
    //east,west
    draw_line_width(ipos*gridsize,jpos*gridsize,ipos*gridsize,(jpos+1)*gridsize,gridsize/4);
    draw_line_width((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    draw_set_color(c_green);
    draw_rectangle(ipos*gridsize + ofs,jpos*gridsize + ofs,(ipos+1)*gridsize - ofs,(jpos+1)*gridsize - ofs,false);
    */
    }
else if (arg_type == 2)
    {
    //north south alternating
    draw_set_color(c_white);
    draw_rectangle(xout1,yout1,xout2,yout2,false);
    if (arg_state)
        {
        draw_set_color(c_lime);
        draw_rectangle(xin1,yout1,xin2,yin2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xout1,yin2,xout2,yout2,false);
        draw_rectangle(xout1,yout1,xin1,yin2,false);
        draw_rectangle(xin2,yout1,xout2,yin2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(pi/2))*gridsize,(jpos + 1/2 - 0.4*sin(pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            //draw_text_shadow((ipos + 1/2 + 0.3*cos(3*pi/2))*gridsize,(jpos + 1/2 - 0.3*sin(3*pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    else
        {
        draw_set_color(c_lime);
        draw_rectangle(xin1,yin1,xin2,yout2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xout1,yout1,xout2,yin1,false);
        draw_rectangle(xout1,yin1,xin1,yout2,false);
        draw_rectangle(xin2,yin1,xout2,yout2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            //draw_text_shadow((ipos + 1/2 + 0.3*cos(pi/2))*gridsize,(jpos + 1/2 - 0.3*sin(pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(3*pi/2))*gridsize,(jpos + 1/2 - 0.4*sin(3*pi/2))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    
    
    /*
    if (arg_state)
        {
        draw_set_color(c_green);
        }
    else
        {
        draw_set_color(c_red);
        }
    draw_line_width(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize,gridsize/4);
    if (arg_state)
        {
        draw_set_color(c_red);
        }
    else
        {
        draw_set_color(c_green);
        }
    draw_line_width(ipos*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    
    draw_set_color(c_red);
    draw_line_width(ipos*gridsize,jpos*gridsize,ipos*gridsize,(jpos+1)*gridsize,gridsize/4);
    draw_line_width((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    */
    }
else if (arg_type == 3)
    {
    //west east alternating
    draw_set_color(c_white);
    draw_rectangle(xout1,yout1,xout2,yout2,false);
    if (arg_state)
        {
        draw_set_color(c_lime);
        draw_rectangle(xout1,yin1,xin2,yin2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xin2,yout1,xout2,yout2,false);
        draw_rectangle(xout1,yout1,xin2,yin1,false);
        draw_rectangle(xout1,yin2,xin2,yout2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(pi))*gridsize,(jpos + 1/2 - 0.4*sin(pi))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            //draw_text_shadow((ipos + 1/2 + 0.3*cos(0))*gridsize,(jpos + 1/2 - 0.3*sin(0))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    else
        {
        draw_set_color(c_lime);
        draw_rectangle(xin1,yin1,xout2,yin2,false);
        
        draw_set_color(c_red);
        draw_rectangle(xout1,yout1,xin1,yout2,false);
        draw_rectangle(xin1,yout1,xout2,yin1,false);
        draw_rectangle(xin1,yin2,xout2,yout2,false);
        if (control.colorblind_mode)
            {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_font(half_goth);
            //draw_text_shadow((ipos + 1/2 + 0.3*cos(pi))*gridsize,(jpos + 1/2 - 0.3*sin(pi))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_text_shadow((ipos + 1/2 + 0.4*cos(0))*gridsize,(jpos + 1/2 - 0.4*sin(0))*gridsize + 1,"GO",c_black,c_white,1,control.colorblind_alph,0.5);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            }
        }
    
    /*
    if (arg_state)
        {
        draw_set_color(c_green);
        }
    else
        {
        draw_set_color(c_red);
        }
    draw_line_width(ipos*gridsize,jpos*gridsize,ipos*gridsize,(jpos+1)*gridsize,gridsize/4);
    if (arg_state)
        {
        draw_set_color(c_red);
        }
    else
        {
        draw_set_color(c_green);
        }
    draw_line_width((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    
    draw_set_color(c_red);
    draw_line_width(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize,gridsize/4);
    draw_line_width(ipos*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/4);
    */
    }
else if (arg_type == 4)
    {
    draw_set_color(c_black);
    draw_triangle(ipos*gridsize,jpos*gridsize,ipos*gridsize + gridsize/2,jpos*gridsize,ipos*gridsize,jpos*gridsize + gridsize/2,false);
    draw_triangle((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize - gridsize/2,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize + gridsize/2,false);
    draw_triangle(ipos*gridsize,(jpos+1)*gridsize,ipos*gridsize + gridsize/2,(jpos+1)*gridsize,ipos*gridsize,(jpos+1)*gridsize - gridsize/2,false);
    draw_triangle((ipos+1)*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize - gridsize/2,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize - gridsize/2,false);
    
    draw_line_width(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize,gridsize/8);
    draw_line_width(ipos*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/8);
    draw_line_width(ipos*gridsize,jpos*gridsize,ipos*gridsize,(jpos+1)*gridsize,gridsize/8);
    draw_line_width((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/8);
    
    if (control.colorblind_mode)
        {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(half_goth);
        draw_text_shadow((ipos + 1/2)*gridsize,(jpos + 1/2)*gridsize,string(0),c_black,c_white,1,control.colorblind_alph,0.5);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        }
    }
else if (arg_type >= 5)
    {
    to_gatelist(arg_type - 4,current_gatelist);
    gatelist_to_lcdlist(current_gatelist,current_lcdlist);
    
    
    draw_set_color(index_to_color(current_lcdlist[0],255,255));
    draw_triangle(ipos*gridsize,jpos*gridsize,ipos*gridsize + gridsize/2,jpos*gridsize,ipos*gridsize,jpos*gridsize + gridsize/2,false);
    draw_set_color(index_to_color(current_lcdlist[1],255,255));
    draw_triangle((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize - gridsize/2,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize + gridsize/2,false);
    draw_set_color(index_to_color(current_lcdlist[2],255,255));
    draw_triangle(ipos*gridsize,(jpos+1)*gridsize,ipos*gridsize + gridsize/2,(jpos+1)*gridsize,ipos*gridsize,(jpos+1)*gridsize - gridsize/2,false);
    draw_set_color(index_to_color(current_lcdlist[3],255,255));
    draw_triangle((ipos+1)*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize - gridsize/2,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize - gridsize/2,false);
    
    draw_set_color(index_to_color(current_lcdlist[4],255,255));
    draw_line_width(ipos*gridsize,jpos*gridsize,(ipos+1)*gridsize,jpos*gridsize,gridsize/8);
    draw_line_width(ipos*gridsize,(jpos+1)*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/8);
    draw_line_width(ipos*gridsize,jpos*gridsize,ipos*gridsize,(jpos+1)*gridsize,gridsize/8);
    draw_line_width((ipos+1)*gridsize,jpos*gridsize,(ipos+1)*gridsize,(jpos+1)*gridsize,gridsize/8);
    
    if (control.colorblind_mode)
        {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(half_goth);
        for (colorblindk = 0; colorblindk < control.maxindices; colorblindk += 1)
            {
            if (kthbittrue(arg_type - 4,colorblindk))
                draw_text_shadow((ipos + 1/2 + 0.3*cos(pi - 2*pi*colorblindk/control.maxindices))*gridsize,(jpos + 1/2 - 0.3*sin(pi - 2*pi*colorblindk/control.maxindices))*gridsize + 1,string(colorblindk + 1),c_black,c_white,1,control.colorblind_alph,0.5);
            }
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        }
    }


draw_set_alpha(1);
