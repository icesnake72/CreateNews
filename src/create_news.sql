-- my_news 스키마(데이터베이스)를 생성한다
create database my_news;

-- my_news 스키마를 사용하겠다
use my_news;

create table country(
id bigint not null auto_increment,
c_code varchar(10) not null unique,
c_name varchar(50) not null,
primary key (id)
);

create table category(
id bigint not null auto_increment,
ct_code varchar(30) not null unique,
ct_name varchar(50) not null,
ct_desc varchar(100),
primary key (id)
);

create table `source`(
id bigint not null auto_increment,
s_id varchar(30) default '',
s_name varchar(100) default '',
primary key (id)
);

create table article(
id bigint not null auto_increment,
author varchar(200) default '',
title varchar(500) not null,
`description` varchar(1000) default '',
url varchar(500) default '',
urlToImage varchar(500) default '',
publishedAt timestamp default current_timestamp,
country_id bigint not null,
category_id bigint not null,
source_id bigint not null,
primary key(id),
key fk_country(country_id),
key fk_category(category_id),
key fk_source(source_id),
constraint fk_country foreign key(country_id) references country(id),
constraint fk_category foreign key(category_id) references category(id),
constraint fk_source foreign key(source_id) references `source`(id)
);


insert into country (c_code, c_name)
values('kr','대한민국');

insert into country (c_code, c_name)
values('us','미국');

insert into country (c_code, c_name)
values('jp','일본');

select * from country;

insert into category (ct_code, ct_name, ct_desc)
values('business','경제','경제/부동산/증권/유가');

insert into category (ct_code, ct_name, ct_desc)
values('entertainment','연예','연예뉴스/K-POP');

insert into category (ct_code, ct_name, ct_desc)
values('health','건강','생활/건강');

insert into category (ct_code, ct_name, ct_desc)
values('science','과학','기초과학');

insert into category (ct_code, ct_name, ct_desc)
values('sports','스포츠','국내외 스포츠 뉴스');

insert into category (ct_code, ct_name, ct_desc)
values('technology','기술','최첨단 기술/자동차');

select * from category;

select * from article;



