menuitems = 1;
menustring[10] = 100;
menustring[0] = "Play";
menufunction[0] = 1;

if (SAVING_ENABLED && gamestarted)
    {
    menuitems += 1;
    menustring[menuitems-1] = "Save";
    menufunction[menuitems-1] = 2;
    }
    
if (SAVING_ENABLED && save_exists)
    {
    menuitems += 1;
    menustring[menuitems-1] = "Load";
    menufunction[menuitems-1] = 3;
    }
    
menuitems += 1;
menustring[menuitems-1] = "Regenerate";
menufunction[menuitems-1] = 4;
   
menuitems_textoffset = 12;
menuitems_xpos = 5*room_width/12 - menuitems_textoffset;
menuitems_ypos = 2*room_height/3 - room_height/6;
menuitems_width = room_width/6 + 2*menuitems_textoffset;
menuitems_height = 2*font_get_size(big_goth);


menuselect = -1;
menuselected = -1;
selectedfunction = -1;
