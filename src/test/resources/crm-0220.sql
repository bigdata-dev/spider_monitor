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
  `id` bigint(20) NOT NULL COMMENT '����',
  `staff_id` bigint(20) NOT NULL COMMENT 'staff������',
  `funcpoint_id` bigint(20) NOT NULL COMMENT 'funcpoint������',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Ȩ�ޱ���staff���funcpoint����м��';

#
# Table structure for table course
#

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '�γ�����',
  `status` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '״̬�У��������ر�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='ѧ�Ʊ�';
INSERT INTO `course` VALUES (1,'hadoop','����');
INSERT INTO `course` VALUES (2,'pig','�ر�');
INSERT INTO `course` VALUES (3,'java','����');
INSERT INTO `course` VALUES (5,'asp.net','�ر�');
INSERT INTO `course` VALUES (8,'c','����');
INSERT INTO `course` VALUES (9,'111','����');

#
# Table structure for table funpoint
#

CREATE TABLE `funpoint` (
  `id` bigint(20) NOT NULL COMMENT '����',
  `pid` bigint(20) DEFAULT NULL COMMENT 'parent id�����������Լ�������',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '���ܵ�����',
  `url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��Ӧ��url',
  `status` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '״̬�У��������ر�',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='���ܵ��';

#
# Table structure for table grade
#

CREATE TABLE `grade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '�༶����',
  `course_id` bigint(20) NOT NULL COMMENT 'course������',
  `status` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '״̬�У��������ر�',
  PRIMARY KEY (`id`),
  KEY `FK41DCFB77E91457C` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT=' �༶��';
INSERT INTO `grade` VALUES (1,'�༶1',1,'����');
INSERT INTO `grade` VALUES (2,'�༶1',1,'����');
INSERT INTO `grade` VALUES (3,'�༶3',5,'����');

#
# Table structure for table staff
#

CREATE TABLE `staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��ʵ����',
  `password` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '��¼��ϵͳ�õ�����',
  `qq` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QQ����,ΨһԼ��',
  `phonenumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '�ֻ����룬ΨһԼ��',
  `gender` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '�Ա��С�Ů',
  `province` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '����ʡ',
  `birthday` int(11) NOT NULL COMMENT '������',
  `education` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'ѧ��',
  `isIT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '�Ƿ����IT��ҵ',
  `language` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '��Ϥ�Ŀ������ԣ����ŷָ����ѡ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Ա����';
INSERT INTO `staff` VALUES (1,'����',x'313233','1231454325','1111110','��','����',1989,'����','��',x'6A617661');
INSERT INTO `staff` VALUES (2,'admin',x'313233','1231454325','1111110','��','����',1989,'����','��',x'6A617661');
INSERT INTO `staff` VALUES (5,'1',x'31','1','1','��','1',1,'1','��',x'6A6176612C20C6E4CBFB');
INSERT INTO `staff` VALUES (6,'1',x'31','1','1','��','1',1,'1','��',x'6A6176612C20C6E4CBFB');
INSERT INTO `staff` VALUES (9,'1',x'32','3','4','��','5',6,'7','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (10,'1',x'31','3','4','��','5',6,'7','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (11,'2',x'32','2','2','��','2',2,'2','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (12,'3',x'33','3','3','��','3',3,'3','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (13,'4',x'34','4','4','��','4',4,'4','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (14,'1',x'32','3','4','Ů','5',6,'7','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (15,'1',x'32','3','4','��','5',6,'7','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (16,'7',x'38','6','5','��','4',3,'2','��',x'C6E4CBFB');
INSERT INTO `staff` VALUES (19,'9',x'39','9','9','��','9',9,'9','��',x'C6E4CBFB');

#
# Table structure for table student
#

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '��ʵ����',
  `qq` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'QQ����,ΨһԼ��',
  `phonenumber` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '�ֻ����룬ΨһԼ��',
  `gender` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '�Ա��С�Ů',
  `province` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '����ʡ',
  `birthday` int(11) NOT NULL COMMENT '������',
  `education` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'ѧ��',
  `jobyear` int(11) NOT NULL COMMENT '����μӹ���',
  `isIT` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '�Ƿ����IT��ҵ',
  `language` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '��Ϥ�Ŀ������ԣ����ŷָ����ѡ��',
  `newschannel` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '���֪�����ǵģ����ŷָ����ѡ��',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='ѧԱ��Ϣ��';

#
# Table structure for table tuition
#

CREATE TABLE `tuition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `student_id` bigint(20) NOT NULL COMMENT 'student������',
  `course_id` bigint(20) NOT NULL COMMENT 'course������',
  `grade_id` bigint(20) NOT NULL COMMENT 'grade������',
  `value` int(8) NOT NULL COMMENT '�ɷѽ��',
  `paystyle` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '֧����ʽ��֧����������',
  `advisor_id` bigint(20) NOT NULL COMMENT 'staff���������������ˣ���ѯ����',
  `logtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'ʱ����������ʱ�Զ�����',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='ѧ�������';

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
