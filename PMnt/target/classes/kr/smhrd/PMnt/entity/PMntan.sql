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


select * from pro_product where userbno ="123456" and pname ="사과";


select * from pro_product where pname ="사과" and userbno ="123456";

select * from pro_product where pname = "사과";

update pro_product set preceivingquantity = "789456",
		pshipments = "789456", preceivingdate = "2023-01-01",
		pshippingdate ="2023-01-01", preceivingamount ="789456",
		pshippingamount = "789456",pincome = "789456", premarks = "789456"
		where pseq="79" and userbno ="123456";
		
select ftext from pro_fruits where fmonth ="1";

select * from pro_fruits where fmonth = date_format(now(), '%m');
