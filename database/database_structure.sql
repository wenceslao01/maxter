drop database if exists `maxter`;
create database `maxter` default character set utf8 default collate utf8_general_ci;

##################### DROP ALL TABLES #####################
use `maxter`;
drop table if exists `user_notification`;
drop table if exists `notification`;
drop table if exists `log`;
drop table if exists `user_session`;
drop table if exists `permission_assigned`;
drop table if exists `permission`;
drop table if exists `user`;
drop table if exists `profile`;
drop table if exists `role`;
drop table if exists `city`;
drop table if exists `state`;
drop table if exists `country`;
use `maxter`;

##################### COUNTRY #####################
create table `country` (
`id` int(11) unsigned not null auto_increment,
`code` varchar(2) not null default '',
`name` varchar(100) not null default '',
primary key (`id`)
) comment='';

##################### STATE #####################
create table `state` (
  `id` int(11) unsigned not null auto_increment,
  `id_country` int(11) unsigned not null,
  `name` varchar(45) not null,
  primary key (`id`),
  foreign key (`id_country`) references `country`(`id`) on update cascade
) comment='';

##################### CITY #####################
create table `city` (
  `id` int(11) unsigned not null auto_increment,
  `id_state` int(11) unsigned not null,
  `name` varchar(45) not null,
  primary key (`id`),
  foreign key (`id_state`) references `state`(`id`) on update cascade
) comment='';

##################### ROLE #####################
create table `role` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `name` varchar(35) not null,
    `description` text,
    primary key (`id`)
) comment='';

drop trigger if exists `role_date_created`;
create trigger `role_date_created` before insert
    on `role`
    for each row
    set new.`date_created` = now();


##################### USER #####################
create table `user` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `id_role` bigint(20) unsigned not null,
    `password` char(16),
    `password_question` varchar(200),
    `password_answer` varchar(100),
    `first_name` varchar(35) not null,
    `last_name` varchar(35) not null,
    `sex` char(1),
    `email` varchar(254),
    `phone` varchar(20),
    `birthday` datetime,
    `address` varchar(40),
    `description` text,
    `id_country` int unsigned,
    `id_state` int unsigned,
    `id_city` int unsigned,
    `zip_code` varchar(10),
    primary key (`id`),
    foreign key (`id_role`) references `role`(`id`) on update cascade,
    foreign key (`id_country`) references `country`(`id`) on update cascade,
    foreign key (`id_state`) references `state`(`id`) on update cascade,
    foreign key (`id_city`) references `city`(`id`) on update cascade
) comment='';

drop trigger if exists `user_date_created`;
create trigger `user_date_created` before insert
    on `user`
    for each row
    set new.`date_created` = now();

/*drop trigger if exists `profile_update_user`;
create trigger `profile_update_user` before update
    on `profile`
    for each row
    begin
        update `user` u set u.`username` = new.`email`
        where u.`id_user` = new.`id_user`;
    end;*/

##################### PERMISSION #####################
create table `permission` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `name` varchar(35) not null,
    `description` text,
    primary key (`id`)
) comment='';

drop trigger if exists `permission_date_created`;
create trigger `permission_date_created` before insert
    on `permission`
    for each row
    set new.`date_created` = now();

##################### PERMISSION_ASSIGNED #####################
create table `permission_assigned` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `id_permission` bigint(20) unsigned not null,
    `id_user` bigint(20) unsigned,
    `id_role` bigint(20) unsigned,
    primary key (`id`),
    foreign key (`id_permission`) references `permission`(`id`) on update cascade,
    foreign key (`id_user`) references `user`(`id`) on update cascade,
    foreign key (`id_role`) references `role`(`id`) on update cascade
) comment='';

drop trigger if exists `permission_assigned_date_created`;
create trigger `permission_assigned_date_created` before insert
    on `permission_assigned`
    for each row
    set new.`date_created` = now();

##################### USER_SESSION #####################
create table `user_session` (
    `id` bigint(20) unsigned not null auto_increment,
    `id_user` bigint(20) unsigned not null,
    `logon_date` datetime,
    `logoff_date` datetime,
    `ip_address` varchar(45),
    `user_agent` varchar(413),
    primary key (`id`),
    foreign key (`id_user`) references `user`(`id`) on update cascade
) comment='';


##################### LOG #####################
create table `log` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `id_user` bigint(20) unsigned,
    `tablename` varchar(64),
    `id_row` bigint(20) unsigned,
    `type` char(1) not null,
    `description` text,
    primary key (`id`)
) comment='';

drop trigger if exists `log_date_created`;
create trigger `log_date_created` before insert
    on `log`
    for each row
    set new.`date_created` = now();

##################### NOTIFICATION #####################
create table `notification` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `date` datetime not null,
    `priority` tinyint unsigned not null,
    `id_role` bigint(20) unsigned,
    `id_user` bigint(20) unsigned,
    `description` text,
    `link` varchar(2083),
    primary key (`id`),
    foreign key (`id_role`) references `role`(`id`) on update cascade,
    foreign key (`id_user`) references `user`(`id`) on update cascade
) comment='';

drop trigger if exists `notification_date_created`;
create trigger `notification_date_created` before insert
    on `notification`
    for each row
    set new.`date_created` = now();

##################### USER_NOTIFICATION #####################
create table `user_notification` (
    `id` bigint(20) unsigned not null auto_increment,
    `id_notification` bigint(20) unsigned not null,
    `id_user` bigint(20) unsigned not null,
    `checked` tinyint(1) not null default 0,
    primary key (`id`),
    foreign key (`id_notification`) references `notification`(`id`) on update cascade,
    foreign key (`id_user`) references `user`(`id`) on update cascade
) comment='';

##################### PROVIDERS #####################
drop table if exists `provider`;
create table `provider` (
    `id` bigint(20) unsigned not null auto_increment,
    `date_created` datetime,
    `date_deleted` datetime,
    `first_name` varchar(35) not null,
    `email` varchar(254),
    `phone` varchar(20),
    `address` varchar(40),
    `description` text,
    `id_country` int unsigned,
    `id_state` int unsigned,
    `id_city` int unsigned,
    `zip_code` varchar(10),
    primary key (`id`),
    foreign key (`id_country`) references `country`(`id`) on update cascade,
    foreign key (`id_state`) references `state`(`id`) on update cascade,
    foreign key (`id_city`) references `city`(`id`) on update cascade
) comment='';

drop trigger if exists `provider_date_created`;
create trigger `provider_date_created` before insert
    on `provider`
    for each row
    set new.`date_created` = now();
