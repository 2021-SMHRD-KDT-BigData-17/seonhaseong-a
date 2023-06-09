select * from pro_user;

select * from pro_product order by userbno;

insert into pro_product (pnum,pname,preceivingquantity,
		pshipments,preceivingdate,pshippingdate,
		pexpirationdate,preceivingamount,pshippingamount,
		pincome,premarks,userbno)
		values ('159789','복숭아','10000','8000',
		'2023-06-07','2023-06-08','20',
		'20000000','30000000','10000000',
		'복숭아농장','123456')
		 where userbno = '123456';
		 
INSERT INTO pro_product (pnum,pname,preceivingquantity,pshipments,preceivingdate,pshippingdate,pexpirationdate,preceivingamount,pshippingamount,pincome,premarks) VALUES ('1597514', '자두', '10000', '8000', '2023-06-07', '2023-06-08', '20', '20000000', '30000000', '10000000', '복숭아농장') weher userbno = '123456';

INSERT INTO pro_product (pnum, pname, preceivingquantity, pshipments, preceivingdate, pshippingdate, pexpirationdate, preceivingamount, pshippingamount, pincome, premarks)
VALUES ('1597514', '자두', '10000', '8000', '2023-06-07', '2023-06-08', '20', '20000000', '30000000', '10000000', '복숭아농장')
WHERE userbno = '123456';


select * from pro_product order by userbno;

SHOW COLUMNS FROM pro_product;
