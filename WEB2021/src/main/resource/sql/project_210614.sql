select 
	count(*) as all_cnt,
	count(case when cido like '%�����ֽ�%' or road_address like '%�����ֽ�%' or num_address like '%�����ֽ�%' then 1 end) as local_cnt
from 
	station;