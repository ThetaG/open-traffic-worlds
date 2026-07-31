//copy from save_script, adjust
roadgrid = ds_grid_create(maxi,maxj);
cargrid = ds_grid_create(maxi,maxj);
buildinggrid = ds_grid_create(maxi,maxj);


pathposgrid = ds_grid_create(maxi,maxj);
pathmaxposgrid = ds_grid_create(maxi,maxj);
        
cartimergrid = ds_grid_create(maxi,maxj);
cartimersetgrid = ds_grid_create(maxi,maxj);
        
hometimergrid = ds_grid_create(maxi,maxj);
        
intersectiongrid = ds_grid_create(maxi,maxj);
intersectiontimergrid = ds_grid_create(maxi,maxj);
intersectionstategrid = ds_grid_create(maxi,maxj);
intersectiontimerset1grid = ds_grid_create(maxi,maxj);
intersectiontimerset2grid = ds_grid_create(maxi,maxj);
        
obstaclegrid = ds_grid_create(maxi,maxj);
        
placedwhilepausedgrid = ds_grid_create(maxi,maxj);

//loadworkedstr = "no string";

ini_open("savegame.ini");

//loadworkedstr = "file supposedly loaded";

str = ini_read_string('GridData','roadgrid',"notfound");
ds_grid_read(roadgrid,str,false);

str = ini_read_string('GridData','cargrid',"notfound");
//loadworkedstr = str;
ds_grid_read(cargrid,str,false);

str = ini_read_string('GridData','buildinggrid',"notfound");
ds_grid_read(buildinggrid,str,false);


str = ini_read_string('GridData','pathposgrid',"notfound");
ds_grid_read(pathposgrid,str,false);


str = ini_read_string('GridData','pathmaxposgrid',"notfound");
ds_grid_read(pathmaxposgrid,str,false);
        

str = ini_read_string('GridData','cartimergrid',"notfound");
ds_grid_read(cartimergrid,str,false);


str = ini_read_string('GridData','cartimersetgrid',"notfound");
ds_grid_read(cartimersetgrid,str,false);
        

str = ini_read_string('GridData','hometimergrid',"notfound");
ds_grid_read(hometimergrid,str,false);
        

str = ini_read_string('GridData','intersectiongrid',"notfound");
ds_grid_read(intersectiongrid,str,false);

str = ini_read_string('GridData','intersectiontimergrid',"notfound");
ds_grid_read(intersectiontimergrid,str,false);

str = ini_read_string('GridData','intersectionstategrid',"notfound");
ds_grid_read(intersectionstategrid,str,false);

str = ini_read_string('GridData','intersectiontimerset1grid',"notfound");
ds_grid_read(intersectiontimerset1grid,str,false);

str = ini_read_string('GridData','intersectiontimerset2grid',"notfound");
ds_grid_read(intersectiontimerset2grid,str,false);
        

str = ini_read_string('GridData','obstaclegrid',"notfound");
ds_grid_read(obstaclegrid,str,false);
        

str = ini_read_string('GridData','placedwhilepausedgrid',"notfound");
ds_grid_read(placedwhilepausedgrid,str,false);


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


for (i = 0; i < maxi ; i += 1)
    {
    for (j = 0; j < maxj ; j += 1)
        {
        roadarray[i,j] = ds_grid_get(roadgrid,i,j);
        cararray[i,j] = ds_grid_get(cargrid,i,j);
        buildingarray[i,j] = ds_grid_get(buildinggrid,i,j);
        
        //will take special care
        str = ini_read_string('pathi_' + string(i),'pathi_' + string(j),"notfound");
        ds_list_read(pathiarray[i,j],str,false);
        
        str = ini_read_string('pathj_' + string(i),'pathj_' + string(j),"notfound");
        ds_list_read(pathjarray[i,j],str,false);
        
        
        pathposarray[i,j] = ds_grid_get(pathposgrid,i,j);
        pathmaxposarray[i,j] = ds_grid_get(pathmaxposgrid,i,j);
        
        cartimerarray[i,j] = ds_grid_get(cartimergrid,i,j);
        cartimersetarray[i,j] = ds_grid_get(cartimersetgrid,i,j);
        
        hometimerarray[i,j] = ds_grid_get(hometimergrid,i,j);
        
        intersectionarray[i,j] = ds_grid_get(intersectiongrid,i,j);
        intersectiontimerarray[i,j] = ds_grid_get(intersectiontimergrid,i,j);
        intersectionstatearray[i,j] = ds_grid_get(intersectionstategrid,i,j);
        intersectiontimerset1array[i,j] = ds_grid_get(intersectiontimerset1grid,i,j);
        intersectiontimerset2array[i,j] = ds_grid_get(intersectiontimerset2grid,i,j);
        
        obstaclearray[i,j] = ds_grid_get(obstaclegrid,i,j);
        
        placedwhilepaused[i,j] = ds_grid_get(placedwhilepausedgrid,i,j);
        }
    }



    
    
ds_list_destroy(housecountlist);
ds_list_destroy(business_loc_i_list);
ds_list_destroy(business_loc_j_list);
    
        
ds_grid_destroy(roadgrid);
ds_grid_destroy(cargrid);
ds_grid_destroy(buildinggrid);
        
//will take special care
//pathilist_sav = ds_list_create();
//pathjlist_sav = ds_list_create();


ds_grid_destroy(pathposgrid);
ds_grid_destroy(pathmaxposgrid);
        
ds_grid_destroy(cartimergrid);
ds_grid_destroy(cartimersetgrid);
        
ds_grid_destroy(hometimergrid);
        
ds_grid_destroy(intersectiongrid);
ds_grid_destroy(intersectiontimergrid);
ds_grid_destroy(intersectionstategrid);
ds_grid_destroy(intersectiontimerset1grid);
ds_grid_destroy(intersectiontimerset2grid);
        
ds_grid_destroy(obstaclegrid);
        
ds_grid_destroy(placedwhilepausedgrid);

ini_close();
