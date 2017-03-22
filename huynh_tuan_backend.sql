use online_shop;
go 

/*  ORDER_ITEM DATA */

insert into ORDER_ITEM values (
	12345, 100100, '824142020227', 1299.99, 1, 1299.99);
insert into ORDER_ITEM values (
	11220, 100101, '888772072438', 699.99, 2, 1399.98);
insert into ORDER_ITEM values (
	12346, 100102, '888772931551', 379.99, 1, 379.99);
insert into ORDER_ITEM values (
	11320, 200102, '886227847433', 799.99, 3, 2399.97);
insert into ORDER_ITEM values (
	11321, 200103, '888772072438', 699.99, 1, 699.99);
insert into ORDER_ITEM values (
	11400, 200103, '884116135371', 499.99, 1, 449.99);

/* PURCHASED DATA */

insert into PURCHASED values (
	12345, 'David Tran', '12039 69th Ave S', 'Seattle', 'WA', '98178', '2533433300', 1679.98, 0.00, 159.59, 1839.57);
insert into PURCHASED values (
	11220, 'Tu Huynh', '6025 S 117th PL', 'Seattle', 'WA', '98178', '2067249225', 1399.98, 1.99, 120.10, 1522.07);
insert into PURCHASED values (
	11400, 'Tuan Huynh', '6025 S 117th PL', 'Seattle', 'WA', '98178', '2067249657', 449.99, 10.99, 40.00, 500.98);
insert into PURCHASED values (
	11320, 'McCuban Christ', '1373 Sherman St', 'San Jose', 'CA', '95110', '4082541234', 3099.96, 0.00, 201.50, 3301.46);

insert into CHECKOUT values (
	8300201, 12345, 1839.57, 'PayPal');
insert into CHECKOUT values (
	8300400, 11220, 1522.07, 'Debit');
insert into CHECKOUT values (
	8300415, 11400, 500.98, 'Credit');
insert into CHECKOUT values (
	8300301, 11320, 3301.46, 'PayPal');

/* COMMENTS */
insert into RATINGS values (
	200103, '884116135371', 'very good laptop and reliable but a litle hit at the bottom', 4);
insert into RATINGS values (
	100100, '888772072438', 'fast and working like a charm', 5);