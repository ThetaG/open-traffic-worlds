file_delete("savegame.ini");

roadgrid = ds_list_create();
cargrid = ds_list_create();
buildinggrid = ds_list_create();


pathposgrid = ds_list_create();
pathmaxposgrid = ds_list_create();
        
cartimergrid = ds_list_create();
cartimersetgrid = ds_list_create();
        
hometimergrid = ds_list_create();
        
intersectiongrid = ds_list_create();
intersectiontimergrid = ds_list_create();
intersectionstategrid = ds_list_create();
intersectiontimerset1grid = ds_list_create();
intersectiontimerset2grid = ds_list_create();
        
obstaclegrid = ds_list_create();
        
placedwhilepausedgrid = ds_list_create();

ini_open("savegame.ini");
ini_write_real('SaveExists','SaveExists',1);


for (i = 0; i < maxi ; i += 1)
    {
    for (j = 0; j < maxj ; j += 1)
        {
        ds_list_add(roadgrid,roadarray[i,j]);
        ds_list_add(cargrid,cararray[i,j]);
        ds_list_add(buildinggrid,buildingarray[i,j]);
        
        //will take special care
        str = ds_list_write(pathiarray[i,j]);
        ini_write_string('pathi_' + string(i),'pathi_' + string(j),str);
        
        str = ds_list_write(pathjarray[i,j]);
        ini_write_string('pathj_' + string(i),'pathj_' + string(j),str);
        
        
        
        ds_list_add(pathposgrid,pathposarray[i,j]);
        ds_list_add(pathmaxposgrid,pathmaxposarray[i,j]);
        
        ds_list_add(cartimergrid,cartimerarray[i,j]);
        ds_list_add(cartimersetgrid,cartimersetarray[i,j]);
        
        ds_list_add(hometimergrid,hometimerarray[i,j]);
        
        ds_list_add(intersectiongrid,intersectionarray[i,j]);
        ds_list_add(intersectiontimergrid,intersectiontimerarray[i,j]);
        ds_list_add(intersectionstategrid,intersectionstatearray[i,j]);
        ds_list_add(intersectiontimerset1grid,intersectiontimerset1array[i,j]);
        ds_list_add(intersectiontimerset2grid,intersectiontimerset2array[i,j]);
        
        ds_list_add(obstaclegrid,obstaclearray[i,j]);
        
        ds_list_add(placedwhilepausedgrid,placedwhilepaused[i,j]);
        }
    }

str = ds_list_write(roadgrid);
ini_write_string('GridData','roadgrid',str);

str = ds_list_write(cargrid);
ini_write_string('GridData','cargrid',str);

str = ds_list_write(buildinggrid);
ini_write_string('GridData','buildinggrid',str);


str = ds_list_write(pathposgrid);
ini_write_string('GridData','pathposgrid',str);

str = ds_list_write(pathmaxposgrid);
ini_write_string('GridData','pathmaxposgrid',str);
        
str = ds_list_write(cartimergrid);
ini_write_string('GridData','cartimergrid',str);

str = ds_list_write(cartimersetgrid);
ini_write_string('GridData','cartimersetgrid',str);
        
str = ds_list_write(hometimergrid);
ini_write_string('GridData','hometimergrid',str);
        
str = ds_list_write(intersectiongrid);
ini_write_string('GridData','intersectiongrid',str);
str = ds_list_write(intersectiontimergrid);
ini_write_string('GridData','intersectiontimergrid',str);
str = ds_list_write(intersectionstategrid);
ini_write_string('GridData','intersectionstategrid',str);
str = ds_list_write(intersectiontimerset1grid);
ini_write_string('GridData','intersectiontimerset1grid',str);
str = ds_list_write(intersectiontimerset2grid);
ini_write_string('GridData','intersectiontimerset2grid',str);
        
str = ds_list_write(obstaclegrid);
ini_write_string('GridData','obstaclegrid',str);
        
str = ds_list_write(placedwhilepausedgrid);
ini_write_string('GridData','placedwhilepausedgrid',str);


//scalar data
ini_write_real('ScalarData','cars_in',cars_in);
ini_write_real('ScalarData','cars_out',cars_out);
ini_write_real('ScalarData','total_homes',total_homes);
ini_write_real('ScalarData','flow_ratio',flow_ratio);
ini_write_real('ScalarData','normalized_flow_ratio',normalized_flow_ratio);

ini_write_real('ScalarData','timeofday',timeofday);
ini_write_real('ScalarData','daynumber',daynumber);
ini_write_real('ScalarData','weeknumber',weeknumber);

ini_write_real('ScalarData','money',money);
ini_write_real('ScalarData','roadcount',roadcount);
ini_write_real('ScalarData','maintenance_fee',maintenance_fee);
ini_write_real('ScalarData','indices_on_board',indices_on_board);


//more lists
str = ds_list_write(indexlist);
ini_write_string('MoreListData','indexlist',str);
housecountlist = ds_list_create();
business_loc_i_list = ds_list_create();
business_loc_j_list = ds_list_create();

for (ii = 0; ii < maxindices; ii += 1)
    {
    ds_list_add(housecountlist,housecountarray[ii]);
    }
ds_list_add(business_loc_i_list,-1);
ds_list_add(business_loc_j_list,-1);
for (testindex = 1; testindex <= maxindices ; testindex += 1)
    {
    ds_list_add(business_loc_i_list,business_loc_i[testindex]);
    ds_list_add(business_loc_j_list,business_loc_j[testindex]);
    }
    
str = ds_list_write(housecountlist);
ini_write_string('MoreListData','housecountlist',str);
str = ds_list_write(business_loc_i_list);
ini_write_string('MoreListData','business_loc_i_list',str);
str = ds_list_write(business_loc_j_list);
ini_write_string('MoreListData','business_loc_j_list',str);




//alarms
ini_write_real('AlarmData','alarm0',alarm[0]);
ini_write_real('AlarmData','alarm1',alarm[1]);
ini_write_real('AlarmData','alarm2',alarm[2]);


//options
ini_write_real('OptionsData','musicmute',global.musicmute);
ini_write_real('OptionsData','soundmute',global.soundmute);
ini_write_real('OptionsData','colorblindmode',colorblind_mode);

//musicpos
musicpos = audio_sound_get_track_position(global.current_music);
ini_write_real('MusicPos','musicpos',musicpos);


    
    
ds_list_destroy(housecountlist);
ds_list_destroy(business_loc_i_list);
ds_list_destroy(business_loc_j_list);
    
        
ds_list_destroy(roadgrid);
ds_list_destroy(cargrid);
ds_list_destroy(buildinggrid);
        
//will take special care
//pathilist_sav = ds_list_create();
//pathjlist_sav = ds_list_create();


ds_list_destroy(pathposgrid);
ds_list_destroy(pathmaxposgrid);
        
ds_list_destroy(cartimergrid);
ds_list_destroy(cartimersetgrid);
        
ds_list_destroy(hometimergrid);
        
ds_list_destroy(intersectiongrid);
ds_list_destroy(intersectiontimergrid);
ds_list_destroy(intersectionstategrid);
ds_list_destroy(intersectiontimerset1grid);
ds_list_destroy(intersectiontimerset2grid);
        
ds_list_destroy(obstaclegrid);
        
ds_list_destroy(placedwhilepausedgrid);

ini_close();

save_exists = 1;
