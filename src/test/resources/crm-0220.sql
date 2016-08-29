# MySQL-Front 5.0  (Build 1.0)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;


# Host: 127.0.0.1    Database: crm
# ------------------------------------------------------
# Server version 5.5.21

CREATE DATABASE `crm` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `crm`;

#
# Table structure for table authority
#

CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `staff_id` bigint(20) NOT NULL COMMENT 'staff表主键',
  `funcpoint_id` bigint(20) NOT NULL COMMENT 'funcpoint表主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限表，即staff表和funcpoint表的中间表';

#
# Table structure for table course
#

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '课程名称',
  `status` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '状态有：正常、关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='学科表';
INSERT INTO `course` VALUES (1,'hadoop','正常');
INSERT INTO `course` VALUES (2,'pig','关闭');
INSERT INTO `course` VALUES (3,'java','开启');
INSERT INTO `course` VALUES (5,'asp.net','关闭');
INSERT INTO `course` VALUES (8,'c','开启');
INSERT INTO `course` VALUES (9,'111','开启');

#
# Table structure for table funpoint
#

CREATE TABLE `funpoint` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `pid` bigint(20) DEFAULT NULL COMMENT 'parent id，可以引用自己表主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '功能点名称',
  `url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '对应的url',
  `status` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '状态有：正常、关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='功能点表';

#
# Table structure for table grade
#

CREATE TABLE `grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '班级名称',
  `course_id` bigint(20) NOT NULL COMMENT 'course表主键',
  `status` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '状态有：正常、关闭',
  PRIMARY KEY (`id`),
  KEY `FK41DCFB77E91457C` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT=' 班级表';
INSERT INTO `grade` VALUES (1,'班级1',1,'开启');
INSERT INTO `grade` VALUES (2,'班级1',1,'开启');
INSERT INTO `grade` VALUES (3,'班级3',5,'开启');

#
# Table structure for table staff
#

CREATE TABLE `staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '登录本系统用的密码',
  `qq` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QQ号码,唯一约束',
  `phonenumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '手机号码，唯一约束',
  `gender` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '性别，男、女',
  `province` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '所在省',
  `birthday` int(11) NOT NULL COMMENT '出生年',
  `education` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '学历',
  `isIT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '是否从事IT行业',
  `language` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '熟悉的开发语言？逗号分隔多个选项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='员工表';
INSERT INTO `staff` VALUES (1,'超哥',x'313233','1231454325','1111110','男','北京',1989,'本科','是',x'6A617661');
INSERT INTO `staff` VALUES (2,'admin',x'313233','1231454325','1111110','男','北京',1989,'本科','是',x'6A617661');
INSERT INTO `staff` VALUES (5,'1',x'31','1','1','男','1',1,'1','是',x'6A6176612C20C6E4CBFB');
INSERT INTO `staff` VALUES (6,'1',x'31','1','1','男','1',1,'1','是',x'6A6176612C20C6E4CBFB');
INSERT INTO `staff` VALUES (9,'1',x'32','3','4','男','5',6,'7','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (10,'1',x'31','3','4','男','5',6,'7','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (11,'2',x'32','2','2','男','2',2,'2','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (12,'3',x'33','3','3','男','3',3,'3','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (13,'4',x'34','4','4','男','4',4,'4','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (14,'1',x'32','3','4','女','5',6,'7','否',x'C6E4CBFB');
INSERT INTO `staff` VALUES (15,'1',x'32','3','4','男','5',6,'7','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (16,'7',x'38','6','5','男','4',3,'2','是',x'C6E4CBFB');
INSERT INTO `staff` VALUES (19,'9',x'39','9','9','男','9',9,'9','是',x'C6E4CBFB');

#
# Table structure for table student
#

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '真实姓名',
  `qq` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QQ号码,唯一约束',
  `phonenumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '手机号码，唯一约束',
  `gender` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '性别，男、女',
  `province` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '所在省',
  `birthday` int(11) NOT NULL COMMENT '出生年',
  `education` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '学历',
  `jobyear` int(11) NOT NULL COMMENT '哪年参加工作',
  `isIT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '是否从事IT行业',
  `language` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '熟悉的开发语言？逗号分隔多个选项',
  `newschannel` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '如何知道我们的？逗号分隔多个选项',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='学员信息表';

#
# Table structure for table tuition
#

CREATE TABLE `tuition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` bigint(20) NOT NULL COMMENT 'student表主键',
  `course_id` bigint(20) NOT NULL COMMENT 'course表主键',
  `grade_id` bigint(20) NOT NULL COMMENT 'grade表主键',
  `value` int(8) NOT NULL COMMENT '缴费金额',
  `paystyle` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '支付方式：支付宝，招行',
  `advisor_id` bigint(20) NOT NULL COMMENT 'staff表主键，即介绍人，咨询顾问',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳，插入表时自动生成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='学费情况表';

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
