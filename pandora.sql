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

-- 导出 pandora 的数据库结构
CREATE DATABASE IF NOT EXISTS `pandora` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pandora`;


-- 导出  表 pandora.account_type_table 结构
CREATE TABLE IF NOT EXISTS `account_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_name` varchar(50) NOT NULL,
  `account_type_icon` varchar(50) NOT NULL,
  `account_remark` varchar(255) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='储蓄账户类别表';

-- 数据导出被取消选择。


-- 导出  表 pandora.balance_table 结构
CREATE TABLE IF NOT EXISTS `balance_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_type_id` int(2) NOT NULL COMMENT '账户类型值（关系到计算公式）',
  `account_name` varchar(50) NOT NULL COMMENT '账户名称',
  `account_icon` varchar(50) NOT NULL,
  `account_remark` varchar(100) NOT NULL,
  `money_sum` double NOT NULL,
  `money_limit` double NOT NULL,
  `deposits_type` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '存储类型',
  `money_rate` double NOT NULL DEFAULT '1',
  `createtime` datetime NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='余额表';

-- 数据导出被取消选择。


-- 导出  表 pandora.book_table 结构
CREATE TABLE IF NOT EXISTS `book_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账本表';

-- 数据导出被取消选择。


-- 导出  表 pandora.category_table 结构
CREATE TABLE IF NOT EXISTS `category_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_icon` varchar(50) NOT NULL,
  `category_inout_type` enum('Y','N') NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='明细类别表';

-- 数据导出被取消选择。


-- 导出  表 pandora.item_detail_table 结构
CREATE TABLE IF NOT EXISTS `item_detail_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL COMMENT '明细日期',
  `money` double NOT NULL,
  `book_id` int(11) NOT NULL COMMENT '账本id',
  `account_id` int(11) NOT NULL COMMENT '余额账户id',
  `inout_type` enum('Y','N') NOT NULL COMMENT 'Y收入/N支出类型',
  `category_id` int(11) NOT NULL COMMENT '类别id',
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目明细';

-- 数据导出被取消选择。


-- 导出  表 pandora.member_table 结构
CREATE TABLE IF NOT EXISTS `member_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员表';

-- 数据导出被取消选择。


-- 导出  表 pandora.user_log 结构
CREATE TABLE IF NOT EXISTS `user_log` (
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `login_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户历史纪录表';

-- 数据导出被取消选择。


-- 导出  表 pandora.user_table 结构
CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `phone_number` varchar(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nickname` varchar(46) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  `last_logging_time` datetime NOT NULL,
  `sex` enum('Y','N') DEFAULT 'Y' COMMENT 'Y男 N女',
  `birth` date DEFAULT NULL,
  `session_id` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
