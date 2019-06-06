# Host: localhost  (Version: 5.5.15)
# Date: 2019-06-06 16:52:52
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "tbl_dept"
#

DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "tbl_dept"
#

INSERT INTO `tbl_dept` VALUES (1,'开发部'),(2,'测试部');
