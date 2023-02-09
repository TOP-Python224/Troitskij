drop database if exists music_collection;

create database music_collection;
use music_collection;

create table music_disc (
	`id` tinyint unsigned not null auto_increment primary key,
    `disc_name` varchar(50) not null,
    constraint `CH_music_disc_disc_name` check (`disc_name` <> ''),
    `singer` varchar(50) not null,
    constraint `CH_music_disc_singer` check (`singer` <> ''),
    `singer_id` tinyint unsigned not null,
    `issue_date` date not null,
    `musical_style` varchar(20) not null,
    constraint `CH_music_disc_musical_style` check (`musical_style` <> ''),
    `musical_style_id` tinyint unsigned not null,
    `publisher` varchar(50) not null,
    constraint `CH_music_disc_publisher` check (`publisher` <> ''),
    `publishers_id` tinyint unsigned not null,
    `review` varchar(255) not null,
    constraint `CH_music_disc_review` check (`review` <> '')
    );
    
create table musical_styles (
	`id` tinyint unsigned not null auto_increment primary key,
    `style_name` varchar(20) not null,
    constraint `CH_musical_styles_style_name` check (`style_name` <> '')
    );
    
create table singers (
	`id` tinyint unsigned not null auto_increment primary key,
    `singer_name` varchar(50) not null,
    constraint `CH_singers_singer_name` check (`singer_name` <> '')
    );

create table publishers (
	`id` tinyint unsigned not null auto_increment primary key,
    `publisher_name` varchar(50) not null,
    constraint `CH_publishers_publisher_name` check (`publisher_name` <> ''),
    `country` char(50) not null,
    constraint `CH_publishers_country` check (`country` <> ''),
    `legal_address` varchar(255) not null,
    constraint `CH_publishers_legal_address` check (`legal_address` <> '')
    );

create table songs (
	`id` tinyint unsigned not null auto_increment primary key,
    `song_name` varchar(50) not null,
    constraint `CH_songs_song_name` check (`song_name` <> ''),
    `disc_name` varchar(50) not null,
    constraint `CH_songs_disc_name` check (`disc_name` <> ''),
    `disc_name_id` tinyint unsigned not null,
    `song_length` time not null,
    constraint `CH_songs_disc_song_length` check (`song_length` > 0 and `song_length` <> ''),
    `musical_style` varchar(20) not null,
    constraint `CH_songs_musical_style` check (`musical_style` <> ''),
    `musical_style_id` tinyint unsigned not null,
    `singer` varchar(50) not null,
    constraint `CH_songs_singer` check (`singer` <> ''),
    `singer_id` tinyint unsigned not null
    );
    
    alter table music_disc
		add constraint `FK_music_disc_musical_style_id` foreign key (`musical_style_id`)
        references musical_styles(`id`),
        add constraint `FK_music_disc_singer_id` foreign key (`singer_id`)
        references singers(`id`),
        add constraint `FK_music_disc_publishers_id` foreign key (`publishers_id`)
        references publishers(`id`);
        
	alter table songs
		add constraint `FK_songs_disc_name_id` foreign key (`disc_name_id`)
        references music_disc(`id`),
        add constraint `FK_songs_musical_style_id` foreign key (`musical_style_id`)
        references musical_styles(`id`),
        add constraint `FK_songs_singer_id` foreign key (`singer_id`)
        references singers(`id`);