-- brand Table
create table brand (
brandID int auto_increment primary key,
brandName varchar(50) not null
);
-- product category table
create table product_category (
categoryID int auto_increment primary key,
categoryName varchar(50) not null
);

-- product Table
create table products (
productID int auto_increment primary key,
brandID int not null,
categoryID int not null,
productName varchar(50) not null,
basePrice decimal(10, 2) not null,
description varchar(50),
foreign key (brandID) references brand(brandID),
foreign key (categoryID) references product_category(categoryID)
);
-- colors Table
create table colors (
colorID int auto_increment primary key,
colorName varchar(50)
);

-- size category table
create table size_category (
sizeCategoryID int auto_increment primary key,
sizeCategoryName varchar(50) not null
);

-- size option table
create table size_option (
sizeID int auto_increment primary key,
sizeCategoryID int not null,
sizeName varchar(50) not null,
foreign key (sizeCategoryID) references size_category(sizeCategoryID)
);

-- product item table
create table product_item (
itemID int auto_increment primary key,
colorID int not null,
sizeID int not null,
productID int not null,
price decimal(10,2) not null,
stockQuantity int not null,
foreign key (colorID) references colors(colorID),
foreign key (sizeID) references size_option(sizeID),
foreign key (productID) references products(productID)
);


-- product variation table
create table product_variation (
variationID int auto_increment primary key,
productID int not null,
sizeID int not null,
colorID int not null,
foreign key (productID) references products(productID),
foreign key (sizeID) references size_option(sizeID),
foreign key (colorID) references colors(colorID)
);
-- product image table
create table product_image (
imageID int auto_increment primary key,
productID int not null,
imageUrl varchar(200) not null,
foreign key (productID) references products(productID)
);
-- attributes category table
create table attributes_category (
attributeCategoryID int auto_increment primary key,
attributeCategoryName varchar(50) not null
);
-- attributes type table
create table attributes_type (
attributeTypeID int auto_increment primary key,
typeName varchar(50) not null,
dataType varchar(50) not null,
attributeCategoryID int not null,
foreign key (attributeCategoryID) references attributes_category(attributeCategoryID)
);
-- product_attribute table
create table product_attribute (
productAttributeID int auto_increment primary key,
productID int not null,
attributeTypeID int not null,
foreign key (productID) references products(productID),
foreign key (attributeTypeID) references attributes_type(attributeTypeID)
);



