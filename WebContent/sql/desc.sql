desc member;

desc company;

desc consequence;

desc subject;

alter table subject change column s_code s_code varchar(50);

alter table member add s_id int not null;

alter table subject add s_member varchar(20);
alter table subject add s_empoyee varchar(20);
alter table consequence add s_id varchar(20);

alter table consequence change column co_asse co_asse int;

alter table subject add s_session varchar(20);
alter table subject add s_profession varchar(20);
alter table subject add s_subject varchar(20);
alter table subject add s_affiliation varchar(20);
alter table subject add s_name2 varchar(20);
alter table subject add s_option varchar(20);
alter table subject add s_code2 varchar(20);
alter table subject add s_condition varchar(20);

ALTER TABLE member drop column m_note;

alter table note change column n_note n_note varchar(200) not null;