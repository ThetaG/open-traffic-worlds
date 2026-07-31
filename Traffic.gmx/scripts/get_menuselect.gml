if ((mouse_x >= menuitems_xpos) && (mouse_x <= menuitems_xpos + menuitems_width) && (mouse_y >= menuitems_ypos) && (mouse_y < menuitems_ypos + menuitems_height*menuitems))
    {
    return floor((mouse_y - menuitems_ypos)/menuitems_height);
    }
else
    {
    return -1;
    }
