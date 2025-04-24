-- Enable FK checks (avoid errors)
SET FOREIGN_KEY_CHECKS = 0;

-- Brands --
create table Brand (
Brand_Name varchar (50))
insert into Brand (Brand_name) 
values 
('Nike'), ('Adidas'), ('Apple'), ('Samsung'), ('Levi’s');

-- Categories --
create table Product_Category(
Category_Name varchar(50),
Parent_ID int
);
insert into Product_Category(
Category_Name,
Parent_ID) values 
('Clothing', NULL),
  ('T-Shirts', 1),
  ('Jeans', 1),
('Electronics', NULL),
  ('Phones', 4),
  ('Laptops', 4);
  
  -- Colors --
  create table Colors(
 Color_Name varchar (50),
 Hex_Code varchar (50)
 );
 insert into Colors(
 Color_Name,
 hex_Code) values
 ('Red', '#FF0000'), 
('Blue', '#0000FF'), 
('Black', '#000000'),
('White', '#FFFFFF');

-- Sizes --
create table Size_Category(
Cartegory_Name varchar (50)
);
insert into Size_Category(Cartegory_Name)
values
('Clothing'),
('Shoes');

-- Size_Option --
Create table Size_Option(
Size_Name varchar (50),
Size_Category_ID int
);

-- Products and Variants --

-- Products --
create table Products(
Product_Name varchar (50),
Brand_ID int,
Category_ID int,
Base_Price double,
Descripton varchar (300)
);

-- Procuct_Items(Variants)
create table Product_Item(
Product_ID int, 
Color_ID int, 
Size_ID int,
sku varchar (50), 
Price_Adjustment int,
Stock_Quantity int );

-- Attributes --
create table Attribute_Type(
Type_Name varchar(50),
Data_Type varchar(50)
);

insert into Size_Option (
Size_Name,
Size_Category_ID) values 
('S', 1), ('M', 1), ('L', 1),   -- Clothing
('40', 2), ('42', 2), ('44', 2); -- Shoes

-- ========== PRODUCTS & VARIANTS ==========
-- Products
insert into Products (Product_Name,
Brand_ID,
Category_ID,
Base_Price,
Description) values 
('Cotton T-Shirt', 1, 2, 19.99, 'Soft 100% cotton tee'),
('Classic Jeans', 5, 3, 59.99, 'Slim-fit denim jeans'),
('Smartphone X', 3, 5, 999.99, 'Latest flagship phone');

-- Product Items (Variants)
insert into Product_Item (Product_ID,
Color_ID,
Size_ID,
sku, 
Price_Adjustment,
Stock_Quantity) values 
-- T-Shirt variants
(1, 1, 1, 'NIK-TS-RED-S', 0, 50),  -- Red, S
(1, 1, 2, 'NIK-TS-RED-M', 0, 30),  -- Red, M
(1, 3, 2, 'NIK-TS-BLK-M', 0, 25),  -- Black, M
-- Jeans variants
(2, 3, 2, 'LEV-JN-BLK-M', 5.00, 20),  -- Black, M (+$5)
-- Phone (no size)
(3, 3, NULL, 'APL-PHX-BLK', 0, 100);

-- ========== ATTRIBUTES (Bonus) ==========
-- Attribute Types
insert into Attribute_Type (Type_Name, Data_Type) 
values
('Material', 'text'), 
('Weight', 'decimal'), 
('Waterproof', 'boolean');

-- Assign attributes to products
insert into Product_Attribute (Product_ID, Attribute_Type_ID, Value) 
values 
(1, 1, 'Cotton'),
(2, 1, 'Denim'),
(3, 3, 'true');  -- Waterproof phone

-- Enable FK checks again
SET FOREIGN_KEY_CHECKS = 1;

