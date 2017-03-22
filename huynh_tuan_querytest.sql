use online_shop;
go


--list computers that are not sold yet
select UPC, Type, Description, Price
from COMPUTERS
where Qty_Sold = 0;

--list prices of all laptops are built-in intel i7 that are more than 2 in stock
select Description, Price
from COMPUTERS 
where Description Like '%i7%' and Type = 'Laptop' and Qty_InStock > 2
group by Description, Price;

--find the customer information who has purchased laptops at least $1000 by PayPal account?
select *
from CUSTOMER
where User_ID IN (select User_ID
				from ORDER_ITEM as O, PURCHASED as P, CHECKOUT as C
				where O.Order_ID = P.Order_No and P.Order_No = C.Order_No
				and C.Payment_Option LIKE 'PayPal' and C.TotalPrice > 1000
				group by User_ID);

-- list the customer name and product description that are rated 5 stars.
select CUSTOMER.Fname, CUSTOMER.Lname, COMPUTERS.Description
from CUSTOMER, COMPUTERS, RATINGS
where CUSTOMER.User_ID = RATINGS.User_ID and COMPUTERS.UPC = RATINGS.UPC
group by CUSTOMER.Fname, CUSTOMER.Lname, COMPUTERS.Description, RATINGS.Rating_stars
having RATINGS.Rating_stars = 5;
