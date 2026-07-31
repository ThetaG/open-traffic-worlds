//copy from save_script, adjust
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

//loadworkedstr = "no string";

ini_open("savegame.ini");

//loadworkedstr = "file supposedly loaded";

str = ini_read_string('GridData','roadgrid',"notfound");
ds_list_read(roadgrid,str,false);

str = ini_read_string('GridData','cargrid',"notfound");
//loadworkedstr = str;
ds_list_read(cargrid,str,false);

str = ini_read_string('GridData','buildinggrid',"notfound");
ds_list_read(buildinggrid,str,false);


str = ini_read_string('GridData','pathposgrid',"notfound");
ds_list_read(pathposgrid,str,false);


str = ini_read_string('GridData','pathmaxposgrid',"notfound");
ds_list_read(pathmaxposgrid,str,false);
        

str = ini_read_string('GridData','cartimergrid',"notfound");
ds_list_read(cartimergrid,str,false);


str = ini_read_string('GridData','cartimersetgrid',"notfound");
ds_list_read(cartimersetgrid,str,false);
        

str = ini_read_string('GridData','hometimergrid',"notfound");
ds_list_read(hometimergrid,str,false);
        

str = ini_read_string('GridData','intersectiongrid',"notfound");
ds_list_read(intersectiongrid,str,false);

str = ini_read_string('GridData','intersectiontimergrid',"notfound");
ds_list_read(intersectiontimergrid,str,false);

str = ini_read_string('GridData','intersectionstategrid',"notfound");
ds_list_read(intersectionstategrid,str,false);

str = ini_read_string('GridData','intersectiontimerset1grid',"notfound");
ds_list_read(intersectiontimerset1grid,str,false);

str = ini_read_string('GridData','intersectiontimerset2grid',"notfound");
ds_list_read(intersectiontimerset2grid,str,false);
        

str = ini_read_string('GridData','obstaclegrid',"notfound");
ds_list_read(obstaclegrid,str,false);
        

str = ini_read_string('GridData','placedwhilepausedgrid',"notfound");
ds_list_read(placedwhilepausedgrid,str,false);


//scalar data
cars_in = ini_read_real('ScalarData','cars_in',0);
cars_out = ini_read_real('ScalarData','cars_out',10);
total_homes = ini_read_real('ScalarData','total_homes',1);
flow_ratio = ini_read_real('ScalarData','flow_ratio',0);
normalized_flow_ratio = ini_read_real('ScalarData','normalized_flow_ratio',0);

timeofday = ini_read_real('ScalarData','timeofday',0);
daynumber = ini_read_real('ScalarData','daynumber',1);
weeknumber = ini_read_real('ScalarData','weeknumber',1);

money = ini_read_real('ScalarData','money',10000);
roadcount = ini_read_real('ScalarData','roadcount',0);
maintenance_fee = ini_read_real('ScalarData','maintenance_fee',10);
indices_on_board = ini_read_real('ScalarData','indices_on_board',1);


//more lists

str = ini_read_string('MoreListData','indexlist',"notfound");
ds_list_read(indexlist,str,false);
housecountlist = ds_list_create();
business_loc_i_list = ds_list_create();
business_loc_j_list = ds_list_create();

str = ini_read_string('MoreListData','housecountlist',"notfound");
ds_list_read(housecountlist,str,false);

str = ini_read_string('MoreListData','business_loc_i_list',"notfound");
ds_list_read(business_loc_i_list,str,false);

str = ini_read_string('MoreListData','business_loc_j_list',"notfound");
ds_list_read(business_loc_j_list,str,false);

for (ii = 0; ii < maxindices; ii += 1)
    {
    //array starts at 0
    housecountarray[ii] = ds_list_find_value(housecountlist,ii);
    }
    
for (testindex = 1; testindex <= maxindices ; testindex += 1)
    {
    //array 'starts at 1'
    business_loc_i[testindex] = ds_list_find_value(business_loc_i_list,testindex);
    business_loc_j[testindex] = ds_list_find_value(business_loc_j_list,testindex);
    }




//alarms
alarm[0] = ini_read_real('AlarmData','alarm0',newobsalarm);
alarm[1] = ini_read_real('AlarmData','alarm1',newbuildingalarm);
alarm[2] = ini_read_real('AlarmData','alarm2',flow_ratio_compute_interval);

//options
global.musicmute = ini_read_real('OptionsData','musicmute',false);
global.soundmute = ini_read_real('OptionsData','soundmute',false);
colorblind_mode = ini_read_real('OptionsData','colorblindmode',false);

//musicpos
musicpos = ini_read_real('MusicPos','musicpos',0);
audio_sound_set_track_position(global.current_music,musicpos);


for (i = 0; i < maxi ; i += 1)
    {
    for (j = 0; j < maxj ; j += 1)
        {
        roadarray[i,j] = ds_list_find_value(roadgrid,i*maxj + j);
        cararray[i,j] = ds_list_find_value(cargrid,i*maxj + j);
        buildingarray[i,j] = ds_list_find_value(buildinggrid,i*maxj + j);
        
        //will take special care
        str = ini_read_string('pathi_' + string(i),'pathi_' + string(j),"notfound");
        ds_list_read(pathiarray[i,j],str,false);
        
        str = ini_read_string('pathj_' + string(i),'pathj_' + string(j),"notfound");
        ds_list_read(pathjarray[i,j],str,false);
        
        
        pathposarray[i,j] = ds_list_find_value(pathposgrid,i*maxj + j);
        pathmaxposarray[i,j] = ds_list_find_value(pathmaxposgrid,i*maxj + j);
        
        cartimerarray[i,j] = ds_list_find_value(cartimergrid,i*maxj + j);
        cartimersetarray[i,j] = ds_list_find_value(cartimersetgrid,i*maxj + j);
        
        hometimerarray[i,j] = ds_list_find_value(hometimergrid,i*maxj + j);
        
        intersectionarray[i,j] = ds_list_find_value(intersectiongrid,i*maxj + j);
        intersectiontimerarray[i,j] = ds_list_find_value(intersectiontimergrid,i*maxj + j);
        intersectionstatearray[i,j] = ds_list_find_value(intersectionstategrid,i*maxj + j);
        intersectiontimerset1array[i,j] = ds_list_find_value(intersectiontimerset1grid,i*maxj + j);
        intersectiontimerset2array[i,j] = ds_list_find_value(intersectiontimerset2grid,i*maxj + j);
        
        obstaclearray[i,j] = ds_list_find_value(obstaclegrid,i*maxj + j);
        
        placedwhilepaused[i,j] = ds_list_find_value(placedwhilepausedgrid,i*maxj + j);
        }
    }



    
    
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
