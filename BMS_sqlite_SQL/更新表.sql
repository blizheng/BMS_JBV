/*更新表*/

update borrow 
set borrow_state='0',return_time='201905051226'
where user_id='2019005596' and book_id='2019080402';

select book_num from book where book_id='2019080402';

update book set book_num=book_num-1 where book_id='2019080402';

/*
if not exists (select * from borrow where borrow_state='0' and book_id='33' and user_id='22')
insert into borrow  values('22','33','201902051512','','0')
*/
/*MySQL使用*/
insert into borrow(user_id,book_id,borrow_time,return_time,borrow_state)
select '22','33','201902051512','','2' from dual
where not exists (select * from borrow where borrow_state='2' and book_id='33' and user_id='22')


/*sqlite
*/
select count(*) from borrow where borrow_state='1' and book_id='33' and user_id='22'