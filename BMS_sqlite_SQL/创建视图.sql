/*创建视图*/
-- 表单连接

select * from book inner join category on book.category_id = category.category_id;
select * from book inner join borrow on book.book_id = borrow.book_id;

select * from (select * from book inner join borrow on book.book_id = borrow.book_id) as a inner join category on a.category_id = category.category_id;


----------
create view bookview
as
select book_id,book_name,book_author,book_price,book_pub,book_image,
book_num,isbn,category_name,book_description
from book as a,category as b
where a.category_id=b.category_id;


create view borrowview
as
select
book_id,book_name,book_author,book_price,book_pub,book_image,
isbn,category_name,book_description,user_id,borrow_time
from (select * from (select * from book inner join borrow on book.book_id = borrow.book_id) as a inner join category on a.category_id = category.category_id)
where borrow_state=1;

create view returnview
as
select
book_id,book_name,book_author,book_price,book_pub,book_image,
isbn,category_name,book_description,user_id,borrow_time,return_time
from (select * from (select * from book inner join borrow on book.book_id = borrow.book_id) as a inner join category on a.category_id = category.category_id)
where borrow_state=0;


/*
select
book_name,book_author,book_price,book_pub,book_image,
isbn,category_name,book_description
from (select * from book inner join category on book.category_id = category.category_id) as a
inner join borrow on a.book_id=borrow.book_id;
*/



