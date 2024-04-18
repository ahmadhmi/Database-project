SET echo ON
SPOOL "C:\sait second semester\Database Design and Programming\final project\Project\Project\Reports\productReviews\productReviews.txt"

set linesize 200
set pagesize 120

column "Product ID" format a10;
column "Customer#" format a10;
column "Email" format a20;
column "Ratings" format 90.9;
column "Reviews" format a30;

set verify off
accept productID CHAR prompt "Enter the product ID: " 


select TB_Product.product_number "Product ID", TB_Customer.customer_number "Customer#", email_address "Email", rating "Ratings", comments "Reviews"
from TB_product JOIN TB_order_item ON(TB_Product.product_number = TB_Order_Item.product_number)  
JOIN TB_customer_order ON(TB_order_item.order_number = TB_Customer_order.order_number)
join TB_customer ON(TB_customer_order.customer_number = TB_Customer.customer_number)
join TB_product_review ON(TB_customer.customer_number = TB_product_review.customer_number)
where TB_Product.product_number = to_char(&productID)
order by 2;


clear columns
spool off
set echo off