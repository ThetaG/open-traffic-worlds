file_delete("savegame.ini");

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

ini_open("savegame.ini");
ini_write_real('SaveExists','SaveExists',1);


for (i = 0; i < maxi ; i += 1)
    {
    for (j = 0; j < maxj ; j += 1)
        {
        ds_grid_add(roadgrid,i,j,roadarray[i,j]);
        ds_grid_add(cargrid,i,j,cararray[i,j]);
        ds_grid_add(buildinggrid,i,j,buildingarray[i,j]);
        
        //will take special care
        str = ds_list_write(pathiarray[i,j]);
        ini_write_string('pathi_' + string(i),'pathi_' + string(j),str);
        
        str = ds_list_write(pathjarray[i,j]);
        ini_write_string('pathj_' + string(i),'pathj_' + string(j),str);
        
        
        
        ds_grid_add(pathposgrid,i,j,pathposarray[i,j]);
        ds_grid_add(pathmaxposgrid,i,j,pathmaxposarray[i,j]);
        
        ds_grid_add(cartimergrid,i,j,cartimerarray[i,j]);
        ds_grid_add(cartimersetgrid,i,j,cartimersetarray[i,j]);
        
        ds_grid_add(hometimergrid,i,j,hometimerarray[i,j]);
        
        ds_grid_add(intersectiongrid,i,j,intersectionarray[i,j]);
        ds_grid_add(intersectiontimergrid,i,j,intersectiontimerarray[i,j]);
        ds_grid_add(intersectionstategrid,i,j,intersectionstatearray[i,j]);
        ds_grid_add(intersectiontimerset1grid,i,j,intersectiontimerset1array[i,j]);
        ds_grid_add(intersectiontimerset2grid,i,j,intersectiontimerset2array[i,j]);
        
        ds_grid_add(obstaclegrid,i,j,obstaclearray[i,j]);
        
        ds_grid_add(placedwhilepausedgrid,i,j,placedwhilepaused[i,j]);
        }
    }

str = ds_grid_write(roadgrid);
ini_write_string('GridData','roadgrid',str);

str = ds_grid_write(cargrid);
ini_write_string('GridData','cargrid',str);

str = ds_grid_write(buildinggrid);
ini_write_string('GridData','buildinggrid',str);


str = ds_grid_write(pathposgrid);
ini_write_string('GridData','pathposgrid',str);

str = ds_grid_write(pathmaxposgrid);
ini_write_string('GridData','pathmaxposgrid',str);
        
str = ds_grid_write(cartimergrid);
ini_write_string('GridData','cartimergrid',str);

str = ds_grid_write(cartimersetgrid);
ini_write_string('GridData','cartimersetgrid',str);
        
str = ds_grid_write(hometimergrid);
ini_write_string('GridData','hometimergrid',str);
        
str = ds_grid_write(intersectiongrid);
ini_write_string('GridData','intersectiongrid',str);
str = ds_grid_write(intersectiontimergrid);
ini_write_string('GridData','intersectiontimergrid',str);
str = ds_grid_write(intersectionstategrid);
ini_write_string('GridData','intersectionstategrid',str);
str = ds_grid_write(intersectiontimerset1grid);
ini_write_string('GridData','intersectiontimerset1grid',str);
str = ds_grid_write(intersectiontimerset2grid);
ini_write_string('GridData','intersectiontimerset2grid',str);
        
str = ds_grid_write(obstaclegrid);
ini_write_string('GridData','obstaclegrid',str);
        
str = ds_grid_write(placedwhilepausedgrid);
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

save_exists = 1;
