

drop database if exists truckBase;

create database truckBase;

use truckBase;

create table client(
	id varchar(32) not null primary key unique,
	phone varchar(16) not null,
	name varchar(25) not null default '',
	phoneConfirmed bit not null default 0,
	wechat varchar(40),
	password varchar(35) not null
)engine=innoDB charset=utf8;

create table driver(
	id varchar(32) not null primary key unique,
	phone varchar(16) not null,
	phoneConfirmed bit not null default 0,
	driverLiscNo varchar(18) not null,
	idcardNo varchar(18) not null,
	ordersCompleted int not null default 0,
	currentRange int not null default 80,
	weightLimit int not null default 0 comment 'kg',
	truckHeight int not null default 180 comment 'cm',
	specialQualification varchar(25) not null default '',
	longx varchar(10) not null default ' ',
	longy varchar(10) not null default ' ',
	wechat varchar(40),
	password varchar(35) not null
)engine=innoDB charset=utf8;

create table contract(
	id varchar(32) not null primary key unique,
	clientID varchar(32) not null,
	driverID varchar(32),
	price varchar(10) not null default '0',
	startX varchar(10) not null default '0',
	startY varchar(10) not null default '0',
	endX varchar(10) not null default '0',
	endY varchar(10) not null default '0',
	recipientPhone varchar(11) not null default '',
	recipientName varchar(20) not null default '',
	postTime datetime not null default now(),
	acceptTime datetime,
	completionCode varchar(4) not null comment 'a code for the recipient to give to the driver to prove contract completion',
	isDirect bit not null default 0 comment '0 for not direct 1 for direct',
	accepted bit not null default 0 comment '0 for no, 1 for yes, regarding whethor or not a driver has accepted the contract',
	foreign key (driverID) references driver(id)
)engine=innoDB charset=utf8;

insert into client(id,phone,name,phoneConfirmed,wechat,password) values('4184761sdfsdfc','18780164434','Erich L',1,'yingwuyingyu','remoter');
