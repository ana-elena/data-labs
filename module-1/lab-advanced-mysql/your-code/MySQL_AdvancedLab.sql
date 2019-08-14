use publications;

select au_id, au_fname, au_lname, round(sales_royalty+advance) as profit
from
(
select a.au_id, t.title_id, a.au_lname, a.au_fname, t.price, s.qty, t.royalty, ta.royaltyper, round(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalty, t.advance
from authors a
left join titleauthor ta on a.au_id=ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=t.title_id
group by a.au_id, t.title_id
) new
order by profit desc; 

create temporary table most_profiting_au
select a.au_id, t.title_id, a.au_lname, a.au_fname, t.price, s.qty, t.royalty, ta.royaltyper, round(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalty, t.advance
from authors a
left join titleauthor ta on a.au_id=ta.au_id
left join titles t on t.title_id=ta.title_id
left join sales s on s.title_id=t.title_id
group by a.au_id, t.title_id;