/*触发器*/


--mysql触发器
create trigger user_insert
on user for insert
as
declare @num int(10)
select @num=id from inserted
insert into orders(user_id) values(@num);


--sqllite触发器
 CREATE TRIGGER audit_log AFTER INSERT 
ON user
BEGIN
   INSERT INTO orders(user_id) VALUES (new.id);
END;