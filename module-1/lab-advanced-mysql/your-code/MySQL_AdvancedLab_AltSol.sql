use publications; 
create table most_profiting_authors
select au_id, au_fname, au_lname, round(sales_royalty+advance) as profit
from most_profiting_au
order by profit desc; 

