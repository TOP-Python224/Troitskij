drop database if exists phonebook;

create database phonebook;
use phonebook;

create table people (
	`id` tinyint unsigned not null auto_increment primary key,
	`name` varchar(30) not null,
    constraint `CH_people_name` check (`name` <> ''),
    `surname` varchar(30) not null,
    constraint `CH_people_surname` check (`surname` <> ''),
    `date_of_birth` date not null,
    `gender` enum('m', 'f') not null,
    constraint `CH_people_gender` check (`gender` <> ''),
    `phone_number` char(20) not null,
    constraint `CH_people_phone_number` check (`phone_number` <> ''),
    `city` char(35) not null,
    constraint `CH_people_city` check (`city` <> ''),
    `country` char(50) not null,
    constraint `CH_people_country` check (`country` <> ''),
    `address`varchar(255) not null,
    constraint `CH_people_address` check (`address` <> '')
    );