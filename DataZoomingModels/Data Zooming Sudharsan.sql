#table creation 

create table if not exists daily_exsice_t(
id int primary key auto_increment,
Parnt_id int,
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,	
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_daily_exsice FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_exsice_a_t(
id int primary key,
parnt_id int not null,
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
INDEX parnt_id_idx (parnt_id),
CONSTRAINT FK_daily_exsice_a FOREIGN KEY (id) REFERENCES daily_exsice_t(id));

create table if not exists weekly_exsice_t(
id int primary key auto_increment,
chld_id int unique key,
weekly varchar(200),
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_weekly_exsice_chld_id FOREIGN KEY (chld_id) REFERENCES daily_exsice_a_t(parnt_id),
CONSTRAINT FK_weekly_exsice_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));


create table if not exists monthly_exsice_t(
id int primary key,
chld_id int unique key,
monthly varchar(200),
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_monthly_exsice_weekly FOREIGN KEY (chld_id) REFERENCES weekly_exsice_t(chld_id),
CONSTRAINT FK_monthly_exsice_daily FOREIGN KEY (chld_id) REFERENCES daily_exsice_a_t(parnt_id),
CONSTRAINT FK_monthly_exsice_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));


create table if not exists yearly_exsice_t(
id int primary key,
chld_id int unique key,
yearly int,
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_yearly_exsice_weekly FOREIGN KEY (chld_id) REFERENCES monthly_exsice_t(chld_id),
CONSTRAINT FK_yearly_exsice_daily FOREIGN KEY (chld_id) REFERENCES daily_exsice_a_t(parnt_id),
CONSTRAINT FK_yearly_exsice_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_sleep_t(
id int primary key auto_increment,
Parnt_id int,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_daily_sleep FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_sleep_a_t(
id int,
Parnt_id int ,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
INDEX sleep_parnt_id_idx (parnt_id),
CONSTRAINT FK_daily_sleep_a FOREIGN KEY (id) REFERENCES daily_sleep_t(id));

create table if not exists weekly_sleep_t(
id int primary key auto_increment,
child_id int unique key,
weekly varchar(500),
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_weekly_sleep FOREIGN KEY (child_id) REFERENCES daily_sleep_a_t(parnt_id),
CONSTRAINT FK_weekly_sleep_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));


create table if not exists monthly_sleep_t(
id int primary key,
child_id int unique key,
weekly varchar(200), 
monthly varchar(200),
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_monthly_sleep_weekly FOREIGN KEY (child_id) REFERENCES weekly_sleep_t(child_id),
CONSTRAINT FK_monthly_sleep_daily FOREIGN KEY (child_id) REFERENCES daily_sleep_a_t(parnt_id),
CONSTRAINT FK_monthly_sleep_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));


create table if not exists yearly_sleep_t(
id int primary key,
child_id int unique key,
yearly int,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_yearly_sleep_weekly FOREIGN KEY (child_id) REFERENCES monthly_sleep_t(child_id),
CONSTRAINT FK_yearly_sleep_daily FOREIGN KEY (child_id) REFERENCES daily_sleep_a_t(parnt_id),
CONSTRAINT FK_yearly_sleep_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_nutrits_t(
id int primary key auto_increment,
parnt_id int,
food_type varchar(500),
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_daily_nutrits FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_nutrits_a_t(
id int,
parnt_id int,
food_type varchar(500),
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
INDEX nutrits_parnt_id_idx (parnt_id),
CONSTRAINT FK_daily_nutrits_a FOREIGN KEY (id) REFERENCES daily_nutrits_t(id));

create table if not exists weekly_nutrits_t(
id int primary key auto_increment,
child_id int unique key,
weekly varchar(500),
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_weekly_nutrits FOREIGN KEY (child_id) REFERENCES daily_nutrits_a_t(parnt_id),
CONSTRAINT FK_weekly_nutrits_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists monthly_nutrits_t(
id int primary key,
child_id int unique key,
monthly varchar(500),
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_monthly_nutrits_weekly FOREIGN KEY (child_id) REFERENCES weekly_nutrits_t(child_id),
CONSTRAINT FK_monthly_nutrits_daily FOREIGN KEY (child_id) REFERENCES daily_nutrits_a_t(parnt_id),
CONSTRAINT FK_monthly_nutrits_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));


create table if not exists yearly_nutrits_t(
id int primary key,
child_id int unique key,
yearly int,
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_yearly_nutrits_weekly FOREIGN KEY (child_id) REFERENCES monthly_nutrits_t(child_id),
CONSTRAINT FK_yearly_nutrits_daily FOREIGN KEY (child_id) REFERENCES daily_nutrits_a_t(parnt_id),
CONSTRAINT FK_yearly_nutrits_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_body_status_t(
id int primary key auto_increment,
parnt_id int,
weight float,
height float,
tol_cal float,
cal_bun float,
water_level float,
heart_beat float,
BP float,
blood_gb_l float,
oxy float,
ele_lev float,/*electrolyte level*/
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_daily_body_status FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists daily_body_status_a_t(
id int,
parnt_id int,
weight float,
height float,
tol_cal float,
cal_bun float,
water_level float,
heart_beat float,
BP float,
blood_gb_l float,
oxy float,
ele_lev float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
INDEX status_parnt_id_idx (parnt_id),
CONSTRAINT FK_daily_status_a FOREIGN KEY (id) REFERENCES daily_body_status_t(id));


create table if not exists weekly_body_status_t(
id int primary key auto_increment,
child_id int unique key,
weekly varchar(500),
weight float,
height float,
tol_cal float,
cal_bun float,
water_level float,
heart_beat float,
BP float,
blood_gb_l float,
oxy float,
ele_lev float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
 CONSTRAINT FK_weekly_body_status FOREIGN KEY (child_id) REFERENCES daily_body_status_a_t(parnt_id),
 CONSTRAINT FK_weekly_body_status_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists monthly_body_status_t(
id int primary key,
child_id int unique key,
monthly varchar(200),
weight float,
height float,
tol_cal float,
cal_bun float,
water_level float,
heart_beat float,
BP float,
blood_gb_l float,
oxy float,
ele_lev float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_montly_body_status_weekly FOREIGN KEY (child_id) REFERENCES weekly_body_status_t(child_id),
CONSTRAINT FK_monthly_body_status_daily FOREIGN KEY (child_id) REFERENCES daily_body_status_a_t(parnt_id),
CONSTRAINT FK_montly_body_status_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists yearly_body_status_t(
id int primary key,
child_id int unique key,
yearly int,
weight float,
height float,
tol_cal float,
cal_bun float,
water_level float,
heart_beat float,
BP float,
blood_gb_l float,
oxy float,
ele_lev float,
str_dtm datetime not null,
end_dtm datetime,
upd_dtm datetime,
upd_num int,
txn_id int unique key,
upd_txn_id int,
CONSTRAINT FK_yearly_body_status_weekly FOREIGN KEY (child_id) REFERENCES monthly_body_status_t(child_id),
CONSTRAINT FK_yearly_body_status_daily FOREIGN KEY (child_id) REFERENCES daily_body_status_a_t(parnt_id),
CONSTRAINT FK_yearly_body_status_txn FOREIGN KEY (txn_id) REFERENCES txn_t(txn_id));

create table if not exists txn_t(
txn_id int auto_increment primary key,
upd_txn int,
cmnt varchar(500),
str_dtm datetime,
upd_dtm datetime,
 INDEX upd_txn_idx (upd_txn,txn_id)
);


create table if not exists upd_t(
id int primary key auto_increment,
upd_id int,
comments varchar(500),
str_dtm datetime,
upd_dtm datetime,
CONSTRAINT FK_update_id FOREIGN KEY (upd_id) REFERENCES txn_t(upd_txn)
);

#procedure call





#drop procedure proc_daily_exsice_insert ;
#call proc_daily_exsice_insert(null,null,null,null,null,2,null,50,165,600,15,10,112,80,22,91,97);
#SET FOREIGN_KEY_CHECKS=0;
#SET FOREIGN_KEY_CHECKS=1;
#select * from daily_exsice_t;
delimiter //
CREATE PROCEDURE proc_daily_exsice_insert(
running float,
walking float,
jacking float,
swiming float,
cycling float,
yoga float,
workout float,
weight float ,
height  float,
tol_cal float ,
cal_bun  float,
water_level  float,
heart_beat  float,
BP  float,
blood_gb_l  float,
oxy float ,
ele_lev float)

BEGIN
declare txn_id_from int;
declare parent_id int;
declare new_parent_id int;
insert into txn_t(upd_txn,cmnt,str_dtm,upd_dtm) values(null,'proc_daily_exsice_insert',sysdate(),null);
set txn_id_from=(select  max(txn_id) from txn_t where date(str_dtm)= date(sysdate()));

/*
IF not exists(select * from daily_exsice_t)
then
insert into daily_exsice_t(parnt_id,running,walking ,jacking ,swiming ,cycling ,yoga,workout,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
       values(1,running,walking ,jacking ,swiming ,cycling ,yoga,workout,sysdate(),null,null,1, txn_id_from,null);

ELSEIF exists(SELECT * FROM daily_exsice_t WHERE date(str_dtm) = date(now())) 
*/
IF exists(SELECT * FROM daily_exsice_t WHERE date(str_dtm) = date(now())) 
then
  set parent_id=(select MAX(parnt_id) from daily_exsice_t);
 insert into daily_exsice_t(parnt_id,running,walking ,jacking ,swiming ,cycling ,yoga,workout,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
       values(parent_id ,running,walking ,jacking ,swiming ,cycling ,yoga,workout,sysdate(),null,null,1, txn_id_from,null);
 ELSE 
    -- Increment the number and insert new data
    set new_parent_id=(SELECT MAX(parnt_id) FROM daily_exsice_t) + 1;
    insert into daily_exsice_t(parnt_id,running,walking ,jacking ,swiming ,cycling ,yoga,workout,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
       values(new_parent_id ,running,walking ,jacking ,swiming ,cycling ,yoga,workout,sysdate(),null,null,1, txn_id_from,null);
 
END IF; 

/*
IF not exists(select * from daily_body_status_t)
then
insert into daily_body_status_t(parnt_id,
                                weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,str_dtm,
								end_dtm,upd_dtm,upd_num, 
								txn_id,upd_txn_id) 
                 values(1,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
				 null,1, txn_id_from,null);

ELSEIF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
*/
IF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
then
  set parent_id=(select MAX(parnt_id) from daily_body_status_t);
 insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
								 end_dtm,upd_dtm,upd_num,
								 txn_id,upd_txn_id) 
                 values(parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
						 null,1, txn_id_from,null);
 ELSE 
    -- Increment the number and insert new data
    set new_parent_id=(SELECT MAX(parnt_id) FROM daily_body_status_t) + 1;
    insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
									end_dtm,upd_dtm,upd_num, 
									txn_id,upd_txn_id) 
                values(new_parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,sysdate(),null,
						null,1, txn_id_from,null);
 
END IF; 
insert into daily_exsice_a_t select distinct * from daily_exsice_t where txn_id=txn_id_from;
insert into daily_body_status_a_t select distinct * from daily_body_status_t where txn_id=txn_id_from;

END ;//
delimiter 

#drop procedure proc_daily_sleep_insert ;
#call proc_daily_sleep_insert(null,now(),50,100,300,10,80,100,125,40,90,97);
#SET FOREIGN_KEY_CHECKS=0;
#SET FOREIGN_KEY_CHECKS=1;

delimiter //
CREATE PROCEDURE proc_daily_sleep_insert(
in_str_dtm datetime,
in_end_dtm datetime,
weight float ,
height  float,
tol_cal float ,
cal_bun  float,
water_level  float,
heart_beat  float,
BP  float,
blood_gb_l  float,
oxy float ,
ele_lev float)

BEGIN
declare txn_id_from int;
declare parent_id int;
declare new_parent_id int;
insert into txn_t(upd_txn,cmnt,str_dtm,upd_dtm) values(null,'proc_daily_sleep_insert',sysdate(),null);
set txn_id_from=(select  max(txn_id) from txn_t where date(str_dtm)= date(sysdate()));

IF in_str_dtm is not NULL
then
/*
	IF not exists(select * from daily_sleep_t)
	then
	insert into daily_sleep_t(parnt_id,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
		   values(1,str_dtm,end_dtm,null,1, txn_id_from,null);

	#ELSEIF exists(SELECT * FROM daily_sleep_t WHERE date(str_dtm) = date(now())) 
*/
	IF exists(SELECT * FROM daily_sleep_t WHERE date(str_dtm) = date(now())) 
	then
	  set parent_id=(select MAX(parnt_id) from daily_sleep_t);
	 insert into daily_sleep_t(parnt_id,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
		                values(parent_id ,in_str_dtm,in_end_dtm,null,1, txn_id_from,null);
	 ELSE 
		-- Increment the number and insert new data
		set new_parent_id=(SELECT MAX(parnt_id) FROM daily_sleep_t) + 1;
		insert into daily_sleep_t(parnt_id,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
		   values(new_parent_id ,in_str_dtm,in_end_dtm,null,1, txn_id_from,null);
	 
	END IF; 
ELSE
    update daily_sleep_t ds set ds.end_dtm=in_end_dtm,ds.upd_txn_id=txn_id_from where ds.end_dtm is null;
END IF;


/*
IF not exists(select * from daily_body_status_t)
then
insert into daily_body_status_t(parnt_id,
                                weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,str_dtm,
								end_dtm,upd_dtm,upd_num, 
								txn_id,upd_txn_id) 
                 values(1,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
				 null,1, txn_id_from,null);

ELSEIF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
*/
IF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
then
  set parent_id=(select MAX(parnt_id) from daily_body_status_t);
 insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
								 end_dtm,upd_dtm,upd_num,
								 txn_id,upd_txn_id) 
                 values(parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
						 null,1, txn_id_from,null);
 ELSE 
    -- Increment the number and insert new data
    set new_parent_id=(SELECT MAX(parnt_id) FROM daily_body_status_t) + 1;
    insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
									end_dtm,upd_dtm,upd_num, 
									txn_id,upd_txn_id) 
                values(new_parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,sysdate(),null,
						null,1, txn_id_from,null);
 
END IF; 
IF in_str_dtm is not NULL
then
       insert into daily_sleep_a_t select distinct * from daily_sleep_t where txn_id=txn_id_from;
else 
      update daily_sleep_a_t ds set ds.end_dtm=(select distinct dst.end_dtm from daily_sleep_t dst where dst.upd_txn_id=txn_id_from ),
       ds.upd_txn_id=txn_id_from where ds.end_dtm is null and ds.upd_txn_id is null;
END IF;      
   
   
insert into daily_body_status_a_t select distinct * from daily_body_status_t where txn_id=txn_id_from;

END ; //
delimiter 

#drop procedure proc_daily_nutrins_insert ;
#call proc_daily_nutrins_insert('milk',2,15,50,10,2,19,50,80,200,10,20,22,25,44,30,88);
#SET FOREIGN_KEY_CHECKS=0;
#SET FOREIGN_KEY_CHECKS=1;

delimiter //
CREATE PROCEDURE proc_daily_nutrins_insert(
food_type varchar(500),
quantity_gms float,
carbohy float,
fat float,
protein float,
vitmins float,
calories float,
weight float ,
height  float,
tol_cal float ,
cal_bun  float,
water_level  float,
heart_beat  float,
BP  float,
blood_gb_l  float,
oxy float ,
ele_lev float)

BEGIN
declare txn_id_from int;
declare parent_id int;
declare new_parent_id int;
insert into txn_t(upd_txn,cmnt,str_dtm,upd_dtm) values(null,'proc_daily_nutrins_insert',sysdate(),null);
set txn_id_from=(select  max(txn_id) from txn_t where date(str_dtm)= date(sysdate()));
/*
IF not exists(select * from daily_nutrits_t)
then
insert into daily_nutrits_t(parnt_id,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
	   values(1,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,now(),end_dtm,null,1, txn_id_from,null);

ELSEIF exists(SELECT * FROM daily_nutrits_t WHERE date(str_dtm) = date(now())) 
*/
IF exists(SELECT * FROM daily_nutrits_t WHERE date(str_dtm) = date(now())) 
then
  set parent_id=(select MAX(parnt_id) from daily_nutrits_t);
 insert into daily_nutrits_t(parnt_id,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
	   values(parent_id ,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,now(),end_dtm,null,1, txn_id_from,null);
 ELSE 
	-- Increment the number and insert new data
	set new_parent_id=(SELECT MAX(parnt_id) FROM daily_nutrits_t) + 1;
	insert into daily_nutrits_t(parnt_id,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,str_dtm,end_dtm,upd_dtm,upd_num, txn_id,upd_txn_id) 
	   values(new_parent_id ,food_type ,
							quantity_gms ,
							carbohy ,
							fat ,
							protein ,
							vitmins ,
							calories,now(),end_dtm,null,1, txn_id_from,null);
 
END IF; 
/*
IF not exists(select * from daily_body_status_t)
then
insert into daily_body_status_t(parnt_id,
                                weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,str_dtm,
								end_dtm,upd_dtm,upd_num, 
								txn_id,upd_txn_id) 
                       values(1,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
				 null,1, txn_id_from,null);

ELSEIF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
*/
IF exists(SELECT * FROM daily_body_status_t WHERE date(str_dtm) = date(now())) 
then
  set parent_id=(select MAX(parnt_id) from daily_body_status_t);
 insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
								 end_dtm,upd_dtm,upd_num,
								 txn_id,upd_txn_id) 
                 values(parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,sysdate(),null,
						 null,1, txn_id_from,null);
 ELSE 
    -- Increment the number and insert new data
    set new_parent_id=(SELECT MAX(parnt_id) FROM daily_body_status_t) + 1;
    insert into daily_body_status_t(parnt_id,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev ,str_dtm,
									end_dtm,upd_dtm,upd_num, 
									txn_id,upd_txn_id) 
                values(new_parent_id ,weight  ,
								height  ,
								tol_cal  ,
								cal_bun  ,
								water_level  ,
								heart_beat  ,
								BP  ,
								blood_gb_l  ,
								oxy  ,
								ele_lev  ,sysdate(),null,
						null,1, txn_id_from,null);
 
END IF; 

insert into daily_nutrits_a_t select distinct * from daily_nutrits_t where txn_id=txn_id_from;
     
     
insert into daily_body_status_a_t select distinct * from daily_body_status_t where txn_id=txn_id_from;

END ;//
delimiter 

#FUNCTION call



#drop function fun_update_sum_daily_to_weekly;
#date(/*DATE_SUB(NOW(),INTERVAL 1 DAY)*/now())
DELIMITER //
CREATE FUNCTION fun_update_sum_daily_to_weekly()
RETURNS INT DETERMINISTIC
BEGIN
 /*declaring variables for updating weekly table from daily table*/
	declare txn_id_from int;
insert into txn_t(upd_txn,cmnt,str_dtm,upd_dtm) values(null,'fun_update_sum_daily_to_weekly',sysdate(),null);
set txn_id_from=(select  max(txn_id) from txn_t where date(str_dtm)= date(sysdate()));
/*---------------------------------------------------------------------------------------------------------------------------*/
    insert into weekly_exsice_t(chld_id,
weekly,
running,
walking ,
jacking ,
swiming ,
cycling ,
yoga ,
workout ,
str_dtm ,
end_dtm ,
upd_dtm ,
upd_num ,
txn_id ,
upd_txn_id ) select  dt.Parnt_id,null,
 avg(dt.running),
avg(dt.walking) ,
avg(dt.jacking),
 avg(dt.swiming) ,
avg(dt.cycling) ,
 avg(dt.yoga),
	 avg(dt.workout),
sysdate(),
null,
null,
null,
 txn_id_from,
 null
from daily_exsice_t dt where date(dt.str_dtm)=date(DATE_SUB(NOW(), INTERVAL 1 DAY))group by dt.Parnt_id;
  /*---------------------------------------------------------------------------------------------------------------------------*/
insert into weekly_sleep_t(child_id,
weekly,
str_dtm ,
end_dtm ,
upd_dtm ,
upd_num ,
txn_id ,
upd_txn_id ) select  ds.Parnt_id,null,
min(ds.str_dtm) ,
max(ds.end_dtm) ,
null,
null,
 txn_id_from,
 null
from daily_sleep_t ds where date(ds.str_dtm)=date(DATE_SUB(NOW(), INTERVAL 1 DAY))group by ds.Parnt_id;   
/*---------------------------------------------------------------------------------------------------------------------------*/
insert into weekly_nutrits_t(child_id,
weekly,
quantity_gms ,
carbohy ,
fat ,
protein ,
vitmins ,
calories ,
str_dtm ,
end_dtm ,
upd_dtm ,
upd_num ,
txn_id ,
upd_txn_id ) select  dn.Parnt_id,null,
avg(dn.quantity_gms) ,
avg(dn.carbohy) ,
avg(dn.fat) ,
avg(dn.protein) ,
avg(dn.vitmins) ,
avg(dn.calories) ,
sysdate(),
null,
null,
null,
 txn_id_from,
 null
from daily_nutrits_t dn where date(dn.str_dtm)=date(DATE_SUB(NOW(), INTERVAL 1 DAY))group by dn.Parnt_id;  

/*---------------------------------------------------------------------------------------------------------------------------*/
 insert into weekly_body_status_t(child_id,
weekly,
weight ,
height ,
tol_cal ,
cal_bun ,
water_level ,
heart_beat ,
BP ,
blood_gb_l ,
oxy ,
ele_lev ,
str_dtm ,
end_dtm ,
upd_dtm ,
upd_num ,
txn_id ,
upd_txn_id ) select  dbs.Parnt_id,null,
avg(dbs.weight) ,
avg(dbs.height ),
avg(dbs.tol_cal) ,
avg(dbs.cal_bun ),
avg(dbs.water_level) ,
avg(dbs.heart_beat ),
avg(dbs.BP) ,
avg(dbs.blood_gb_l) ,
avg(dbs.oxy ),
avg(dbs.ele_lev ),
sysdate(),
null,
null,
null,
 txn_id_from,
 null
from daily_body_status_t dbs where date(dbs.str_dtm)=date(DATE_SUB(NOW(), INTERVAL 1 DAY))group by dbs.Parnt_id;
/*-------------------------------------------------------------------------------------------------------------*/

insert into monthly_exsice_t      select * from weekly_exsice_t where txn_id=txn_id_from ;
insert into yearly_exsice_t       select * from weekly_exsice_t where txn_id=txn_id_from;

insert into monthly_sleep_t       select * from weekly_sleep_t where txn_id=txn_id_from;
insert into yearly_sleep_t        select * from weekly_sleep_t where txn_id=txn_id_from;

insert into monthly_nutrits_t     select * from weekly_nutrits_t where txn_id=txn_id_from;
insert into yearly_nutrits_t      select * from weekly_nutrits_t where txn_id=txn_id_from;

insert into monthly_body_status_t select * from weekly_body_status_t where txn_id=txn_id_from;
insert into yearly_body_status_t  select * from weekly_body_status_t where txn_id=txn_id_from;
  return 1;
END ;


#scheduled event

#drop event end_of_day_event_to_week;
#SHOW VARIABLES LIKE 'event_scheduler';
#SET GLOBAL event_scheduler = ON;
#SET GLOBAL event_scheduler = off;

DELIMITER //

CREATE EVENT end_of_day_event_to_week
ON SCHEDULE
    EVERY 1 DAY
    STARTS CONCAT(DATE(NOW() + INTERVAL 1 DAY), ' 00:30:00')
    #STARTS CONCAT(DATE(NOW()), ' 11:31:00')
ON COMPLETION PRESERVE ENABLE
DO
    BEGIN
        DECLARE new_data INT;
        SET new_data = (select fun_update_sum_daily_to_weekly());
        
    END //

DELIMITER ;



