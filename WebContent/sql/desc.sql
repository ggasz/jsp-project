desc member;

desc company;

desc consequence;

desc subject;

alter table subject change column s_code s_code varchar(50);

alter table member add s_id int not null;

alter table subject add s_member varchar(20);
alter table subject add s_empoyee varchar(20);
alter table consequence add s_id varchar(20);

alter table consequence change column s_id s_id int;
