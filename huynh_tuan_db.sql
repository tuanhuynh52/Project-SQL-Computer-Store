create database online_shop;
go
use online_shop;
go 


create table CUSTOMER (
	User_ID			integer			not null,
	Fname			char(10)		null,
	Lname			char(10)		null,
	Email			char(30)		not null,
	Phone			char(10)		null,
	CONSTRAINT	PK_UserID	primary key (User_ID)
	);

create table COMPUTERS (
	UPC			char(15)		not null,
	Type		char(9)			not null,
	Description	char(200)		not null,
	Qty_InStock	integer			null,
	Qty_Sold	integer			null,
	Price		Decimal(9,2)	not null,
	CONSTRAINT PK_UPC	primary key (UPC)
	);

create table ORDER_ITEM (
	Order_ID			integer			not null,
	User_ID				integer			not null,
	UPC					char(15)		not null,
	Item_Price			Decimal(9,2)	not null,
	Quantity			integer			null,
	Extended_Price		Decimal(9,2)	not null,
	CONSTRAINT		ORDER_ITEM_PK	primary key (Order_ID),
	CONSTRAINT		FK_User_ID		foreign key (User_ID)
			REFERENCES		CUSTOMER (User_ID),
	CONSTRAINT		FK_UPC			foreign key (UPC)
			REFERENCES		COMPUTERS (UPC),
	);

create table PURCHASED (
	Order_No			integer			not null,
	BillingName			char(30)		not null,
	BillingAddress		char(50)		not null,
	BillingCity			Char(15)		not null,
	BillingState		char(3)			not null,
	BillingZip			char(6)			not null,
	Phone				char(10)		null,
	Sub_Total			Decimal(10,2)	not null,
	Shipping			Decimal(5,2)	not null,
	Tax					Decimal(5,2)	not null,
	TotalCost			Decimal(10,2)	not null,
	CONSTRAINT		PURCHASED_PK	primary key (Order_No),
	CONSTRAINT		Order_ID_Relationship	foreign key (Order_No)
		REFERENCES		ORDER_ITEM (Order_ID)
	);

CREATE TABLE CHECKOUT (
	PaymentID		integer			not null,
	Order_No		integer			not null,
	TotalPrice		Decimal(10,2)	not null,
	Payment_Option	char(10)		not null,
	CONSTRAINT		CHECKOUT_PK		PRIMARY KEY (PaymentID),
	CONSTRAINT		ORDER_No_Relationship		foreign key (Order_No)
		REFERENCES		PURCHASED (Order_No)
	);

create table RATINGS (
	User_ID		integer		not null,
	UPC			char(15)	not null,
	Comments	char(300)	null,
	Rating_stars	integer	null,
	CONSTRAINT		RATINGS_PK	PRIMARY KEY (User_ID, UPC),
	CONSTRAINT		User_ID_relationship foreign key (User_ID)
		REFERENCES  CUSTOMER (User_ID),
	CONSTRAINT		UPC_Relationship foreign key (UPC)
		REFERENCES	COMPUTERS(UPC)
	);

insert into CUSTOMER VALUES (
	100100, 'David', 'Tran', 'davidtr@gmail.com', '2063331011');
insert into CUSTOMER values (
	100101, 'Tu', 'Huynh', 'camtu@yahoo.com', '2067249225');
insert into CUSTOMER values (
	100102, 'Xin', 'MC', 'mcxin21@gmail.com', '2533110011');
insert into CUSTOMER values (
	200102, 'McCuban', 'Christ', 'mccub@uw.edu', '3607712005');
insert into CUSTOMER values (
	200103, 'Tuan', 'Huynh', 'thuynh@gmail.com', '2067249657');

/* COMPUTER DATA */
insert into COMPUTERS values (
	'888772931551', 'Desktop', 'Lenovo H50 with AMD A6-6310 Processor 6GB DDR3 Memory 1TB Hard Drive Windows 8.1',6, 5, 379.99);
insert into COMPUTERS values (
	'887899671890', 'Desktop', 'GATEWAY DX4375 AMD A6-5200 Processor 4GB Memory 1TB Hard Drive Radeon HD8400 Graphics Windows 8.1',4, 0, 449.99);
insert into COMPUTERS values (
	'848604013015', 'Desktop', 'iBuypower FR650 Gaming PC with AMD FX-4300 Processor 8GB 1600Mhz PC3-12800 Memory 1TB Hard Drive Radeon R7-250 2gb Graphics Windows 7 Pro',10, 0, 699.99);
insert into COMPUTERS values (
	'886227847433', 'Desktop', 'Asus M32AD-US006O Desktop PC with Intel Core i7-4790 Processor 8GB Memory 2TB Hard Drive Windows 7 Home Premium', 0, 3, 799.99);
insert into COMPUTERS values (
	'884116135371', 'Laptop', 'Dell i15RVT-3809BLK Intel Pentium 2127U 15.6" Touch Screen With 4GB Memory 500GB Hard Drive Windows 8.1', 10, 1, 449.99);
insert into COMPUTERS values (
	'888772072438', 'Laptop', 'Lenovo G50 Intel Core i7-4510U 15.6" With 8GB Memory 1TB Hard Drive Windows 8.1', 5, 3, 699.99);
insert into COMPUTERS values (
	'824142020227', 'Laptop', 'MSI GE70 Intel Core i7-4700 17.3" Screen Gaming Laptop With 12GB Memory 1TB Hard Drive Windows 8.1', 2, 3, 1299.99);

