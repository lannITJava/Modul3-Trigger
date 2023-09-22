create database Trigger_Demo;
create table Product(
product_id int primary key,
product_name varchar(100),
price float
);
DELIMITER //
create trigger before_insert_product before insert on product for each row
begin
    if (NEW.price<0) then 
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Bạn sắp insert Price có giá nhỏ hơn không';	
	end if;
    
end //
DELIMITER ;
select * from product;
insert into product values('1','Lập trình',20);
DELIMITER //
create trigger Update_data_into_table before update on Product
for each row
begin
if new.Price < 0 then set new.Price = 0;
        end if;
end //
DELIMITER ;
update Product
set Price = -15
where productId = 1;


                          
