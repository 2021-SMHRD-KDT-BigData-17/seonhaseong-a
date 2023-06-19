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

select * from pro_synthesis;

SELECT syproduct, wtemperature, CAST(SUM(sycnt) AS SIGNED) AS sycnt
	    FROM (
	        SELECT syproduct,
	            CASE
	                WHEN wtemperature >= -15 AND wtemperature < -10 THEN -15
	                WHEN wtemperature >= -10 AND wtemperature < -5 THEN -10
	                WHEN wtemperature >= -5 AND wtemperature < 0 THEN -5
	                WHEN wtemperature >= 0 AND wtemperature < 5 THEN 0
	                WHEN wtemperature >= 5 AND wtemperature < 10 THEN 5
	                WHEN wtemperature >= 10 AND wtemperature < 15 THEN 10
	                WHEN wtemperature >= 15 AND wtemperature < 20 THEN 15
	                WHEN wtemperature >= 20 AND wtemperature < 25 THEN 20
	                WHEN wtemperature >= 25 AND wtemperature < 30 THEN 25
	                WHEN wtemperature >= 30 AND wtemperature < 35 THEN 30
	                ELSE 35
	            END AS wtemperature,
	            sycnt
	        FROM pro_synthesis
	        WHERE wtemperature >= -15 AND wtemperature <= 35
	    ) AS subquery
	    GROUP BY syproduct, wtemperature;

