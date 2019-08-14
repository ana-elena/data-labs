use publications;

select a.au_id, au_fname, au_lname, p.pub_name, count(t.title_id) as title_count
from authors a
left join titleauthor as ta on a.au_id=ta.au_id
left join titles t on ta.title_id=t.title_id
left join publishers p on p.pub_id=t.pub_id 
group by au_id, pub_name;