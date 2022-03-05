drop schema test_db if exists;
create schema test_db default character set utf8mb4 collate utf8mb4_general_ci;
use test_db;

create table Categories (
  categoryId varchar (10) primary key,
  categoryName varchar (100) not null default "c1",
  description varchar (200) default null
) ENGINE=InnoDB default CHARSET=utf8mb4;

insert into Categories values
('C001', 'Beverages', 'Soft drink, milk, beer'),
('C002', 'Seafood', 'Fish, crab and more'),
('C003', 'Fast food', 'Hum berger, KFC');

create table Products (
    productId varchar (10) primary key,
    categoryId varchar (10) not null,
    productName varchar (100) not null default "c1",
    price float default null,
    description varchar (200) default null,
    foreign key (categoryId) references Categories(categoryId) on update cascade
) ENGINE=InnoDB default CHARSET=utf8mb4;

insert into Products values
('P001', 'C001', 'Saigon beer', 20, 'Soft drink, milk, beer'),
('P002', 'C001', 'Hanoi beer', 15, 'A good beer'),
('P003', 'C002', 'Pate eggs', 62, 'Hum berger, KFC'),
('P004', 'C003', 'Big fish', 34, 'Shark big');