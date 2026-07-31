draw_set_alpha(menualpha*0.7);
draw_set_color(c_white);
draw_rectangle(0,0,room_width,room_height,false);

//draw_set_color(COOL_GREY);
//draw_set_alpha(menualpha*0.5);
//draw_rectangle(room_width/2 - room_width/6,room_height/3 - room_height/24,room_width/2 + room_width/6,room_height/3 + room_height/24,false);
draw_set_font(huge_goth);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_shadow(room_width/2,room_height/4,"TrafficWorlds",c_black,c_gray,2,menualpha,menualpha*0.7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(cent_goth);
draw_text_shadow(room_width/2,room_height/3 - 3*gridsize/4,"by Theta Games",c_black,c_gray,2,menualpha,menualpha*0.7);

draw_set_alpha(1);
draw_set_font(big_goth);
for (k = 0 ; k < menuitems ; k += 1)
    {
    if (k == menuselect)
        {
        menucolor1 = c_black;
        menucolor2 = index_to_color(menuindex,128,200);
        }
    else
        {
        menucolor1 = c_black;
        menucolor2 = c_gray;
        }
    if (k == menuselected)
        {
        menucolor1 = index_to_color(menuindex,255,255);
        menucolor2 = c_black;
        }
    draw_text_shadow(menuitems_xpos + menuitems_textoffset,menuitems_ypos + k*menuitems_height,menustring[k],menucolor1,menucolor2,2,menualpha,menualpha*0.7);
    }
    
//draw_text(0,room_height-40,string(menufunction[0]) + string(menufunction[1]) + string(menufunction[2]));
