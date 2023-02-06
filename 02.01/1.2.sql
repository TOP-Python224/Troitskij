drop database if exists sales;

create database sales;
use sales;

create table sellers (
	`id` tinyint unsigned not null auto_increment primary key,
    `name` varchar(30) not null,
    constraint `CH_sellers_name` check (`name` <> ''),
    `surname` varchar(30) not null,
    constraint `CH_sellers_surname` check (`surname` <> ''),
    `email` varchar(60) not null,
    constraint `CH_sellers_email` check (`email` <> ''),
    `phone_number` char(20) not null,
    constraint `CH_sellers_phone_number` check (`phone_number` <> '')
    );

create table buyers (
	`id` tinyint unsigned not null auto_increment primary key,
    `name` varchar(30) not null,
    constraint `CH_buyers_name` check (`name` <> ''),
    `surname` varchar(30) not null,
    constraint `CH_buyers_surname` check (`surname` <> ''),
    `email` varchar(60) not null,
    constraint `CH_buyers_email` check (`email` <> ''),
    `phone_number` char(20) not null,
    constraint `CH_buyers_phone_number` check (`phone_number` <> '')
    );
    
create table sales (
	`id` tinyint unsigned not null auto_increment primary key,
    `buyer_id` tinyint unsigned not null,
    `seller_id` tinyint unsigned not null,
    `product` varchar(50) not null,
    constraint `CH_sales_product` check (`product` <> ''),
    `price` decimal(7, 2) not null,
    constraint `CH_sales_price` check (`price` > 0),
    `date` date not null
    );
    
alter table sales
	add constraint `FK_sales_buyer_id` foreign key (`buyer_id`)
    references buyers(`id`),
    add constraint `FK_sales_seller_id` foreign key (`seller_id`)
    references sellers(`id`);