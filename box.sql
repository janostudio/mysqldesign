-- --------------------------------------------------------
-- 主机:                           23.83.236.115
-- 服务器版本:                        5.5.48-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 box 的数据库结构
CREATE DATABASE IF NOT EXISTS `box` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `box`;


-- 导出  表 box.account 结构
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `accountname` varchar(50) NOT NULL,
  `accountimg` varchar(50) NOT NULL,
  `sum` float NOT NULL,
  `note` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户及余额表';

-- 数据导出被取消选择。


-- 导出  表 box.deposit 结构
CREATE TABLE IF NOT EXISTS `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '储蓄明细id',
  `uid` int(11) NOT NULL,
  `depositname` varchar(50) NOT NULL,
  `depositimg` varchar(50) NOT NULL,
  `saveintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `money` float NOT NULL,
  `yearrate` float NOT NULL,
  `withdrawtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='储蓄表';

-- 数据导出被取消选择。


-- 导出  表 box.item 结构
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `accid` int(11) NOT NULL COMMENT '账户id',
  `cate` varchar(50) NOT NULL,
  `money` float NOT NULL,
  `note` varchar(256) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流动明细表';

-- 数据导出被取消选择。


-- 导出  表 box.itemcate 结构
CREATE TABLE IF NOT EXISTS `itemcate` (
  `id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `catename` varchar(50) DEFAULT NULL,
  `cateimg` varchar(50) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='种类表';

-- 数据导出被取消选择。


-- 导出  表 box.logs 结构
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `useragent` varchar(500) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 数据导出被取消选择。


-- 导出  表 box.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userid',
  `groupid` int(11) NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `userimg` varchar(100) NOT NULL,
  `lastlogginttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
