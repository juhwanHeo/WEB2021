select 
	*
from 
	station
where
	address like '%��õ%'
	or charge_name like '%�ȼ���û%'
	or cido like '%��õ%'
	or road_address like '%��õ%'
	or num_address like '%��õ%';

select 
	count(*) as cnt
from 
	station
where
	address like '%%'
	or charge_name like '%%'
	or cido like '%%'
	or road_address like '%%'
	or num_address like '%%';

select 
	*
from 
	station
where
	cido like '%���%';

create table user (
	id varchar(20) NOT NULL,
	passwd varchar(20) NOT NULL,
	name varchar(30) NOT NULL,
	PRIMARY KEY (id)
);

insert into student (id, passwd, name)
values ('juhwan', 'web123', '����ȯ');
